#!/usr/bin/env bash

set -uo pipefail

usage() {
  echo "Usage: $(basename -- "$0") [repository-filter]"
}

if (($# > 1)); then
  usage >&2
  exit 2
fi

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

readonly SCRIPT_DIRECTORY="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
readonly PACKAGES_FILE="${SCRIPT_DIRECTORY}/packages.json"
readonly WORKFLOW_FILE="release.yml"
readonly REPOSITORY_FILTER="${1:-}"

for command in npm jq; do
  if ! command -v "${command}" >/dev/null 2>&1; then
    echo "Error: ${command} is required." >&2
    exit 1
  fi
done

if ! npm trust --help >/dev/null 2>&1; then
  echo "Error: npm trust is unavailable. Install npm 11.15.0 or newer." >&2
  exit 1
fi

if ! jq -e '
  type == "array" and
  all(.[];
    (.repo | type == "string" and length > 0) and
    (.packages | type == "array" and length > 0) and
    all(.packages[]; type == "string" and length > 0)
  )
' "${PACKAGES_FILE}" >/dev/null; then
  echo "Error: ${PACKAGES_FILE} is not a valid package list." >&2
  exit 1
fi

matching_package_count="$(
  jq \
    --arg filter "${REPOSITORY_FILTER}" \
    '[.[] | select($filter == "" or (.repo | contains($filter))) | .packages[]] | length' \
    "${PACKAGES_FILE}"
)"
first_matching_package="$(
  jq -r \
    --arg filter "${REPOSITORY_FILTER}" \
    '[.[] | select($filter == "" or (.repo | contains($filter))) | .packages[]] | .[0] // empty' \
    "${PACKAGES_FILE}"
)"

if ((matching_package_count == 0)); then
  echo "Error: no repositories match filter '${REPOSITORY_FILTER}'." >&2
  exit 1
fi

if [[ -n "${REPOSITORY_FILTER}" ]]; then
  echo "Repository filter: ${REPOSITORY_FILTER} (${matching_package_count} packages)"
fi

if [[ -t 0 && -t 1 ]]; then
  echo "Checking npm authentication before processing packages..."
  echo "If prompted in the browser, allow npm to skip 2FA for the next five minutes."
  if ! npm trust list "${first_matching_package}"; then
    echo "Error: npm authentication failed." >&2
    exit 1
  fi
else
  echo "Warning: no interactive terminal is available for an npm web-2FA challenge." >&2
fi

configured_count=0
skipped_count=0
failed_count=0

while IFS=$'\t' read -r repository package; do
  echo "Checking ${package}..."

  if ! trust_json="$(npm trust list "${package}" --json)"; then
    echo "Error: could not read trusted publishers for ${package}." >&2
    echo "Run 'npm trust list ${package}' interactively, complete 2FA, and rerun this script." >&2
    ((failed_count += 1))
    sleep 2
    continue
  fi

  if [[ -n "${trust_json//[[:space:]]/}" ]]; then
    if jq -e \
      --arg repository "${repository}" \
      --arg workflow "${WORKFLOW_FILE}" \
      '.type == "github" and .repository == $repository and .file == $workflow' \
      <<<"${trust_json}" >/dev/null; then
      echo "Already configured: ${package}"
      ((skipped_count += 1))
    else
      echo "Error: ${package} already has a different trusted publisher:" >&2
      jq . <<<"${trust_json}" >&2
      ((failed_count += 1))
    fi
    sleep 2
    continue
  fi

  echo "Configuring ${package} for ${repository}/${WORKFLOW_FILE}..."
  if npm trust github "${package}" \
    --repo "${repository}" \
    --file "${WORKFLOW_FILE}" \
    --allow-publish \
    --yes; then
    ((configured_count += 1))
  else
    echo "Error: could not configure ${package}." >&2
    ((failed_count += 1))
  fi

  # npm recommends spacing bulk trust requests to avoid rate limiting.
  sleep 2
done < <(
  jq -r \
    --arg filter "${REPOSITORY_FILTER}" \
    '.[] | select($filter == "" or (.repo | contains($filter))) | .repo as $repo | .packages[] | [$repo, .] | @tsv' \
    "${PACKAGES_FILE}"
)

echo
echo "Configured: ${configured_count}"
echo "Already configured: ${skipped_count}"
echo "Failed or conflicting: ${failed_count}"

# After all trusted publishers have been verified, uncomment this block to require
# interactive 2FA and disallow token-based publishing for every package. Trusted
# publishing through GitHub Actions OIDC will continue to work.
# while IFS= read -r package; do
#   echo "Requiring 2FA and disallowing tokens for ${package}..."
#   npm access set mfa=publish "${package}"
#   sleep 2
# done < <(
#   jq -r \
#     --arg filter "${REPOSITORY_FILTER}" \
#     '.[] | select($filter == "" or (.repo | contains($filter))) | .packages[]' \
#     "${PACKAGES_FILE}"
# )

if ((failed_count > 0)); then
  exit 1
fi
