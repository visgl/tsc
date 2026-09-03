# npm trusted publishers

This directory tracks npm packages that publish from the vis.gl GitHub
organization and provides a script to configure GitHub Actions as their trusted
publisher.

See npm's [trusted publishing documentation](https://docs.npmjs.com/trusted-publishers/)
and [`npm trust` CLI documentation](https://docs.npmjs.com/cli/v12/commands/npm-trust/)
for details about the underlying npm configuration.

## Prerequisites

- `npm` with the `npm trust` command (npm 11.15.0 or newer)
- `jq`
- An npm account with write access to every package being configured
- Account-level two-factor authentication enabled
- An authenticated npm CLI session

Each repository must have a `.github/workflows/release.yml` workflow configured
for npm trusted publishing. The publishing job must run on a GitHub-hosted runner
and grant `id-token: write` permission.

## Package list

[`packages.json`](./packages.json) groups package names by their GitHub repository:

```json
{
  "repo": "visgl/deck.gl",
  "packages": ["@deck.gl/core"]
}
```

Packages marked `private` in their source repository should not be added.

## Script usage

Configure every package in `packages.json`:

```bash
./configure-trusted-publishers.sh
```

Pass an optional literal substring to process only matching repository entries:

```bash
./configure-trusted-publishers.sh visgl/deck.gl
```

The filter uses substring matching. For example, `deck.gl` matches both
`visgl/deck.gl` and `visgl/deck.gl-community`; use `visgl/deck.gl` to select only
the primary repository.

For every selected package, the script:

1. Reads its current configuration with `npm trust list`.
2. Skips it if GitHub Actions, the expected repository, and `release.yml` are
   already configured.
3. Creates the missing configuration with `npm trust github --allow-publish`.
4. Reports an error without modifying the package if a different trusted
   publisher is already configured.

The script waits two seconds between packages to reduce registry rate limiting.
It continues after individual failures and exits with a nonzero status if any
package failed or had a conflicting configuration.

Before processing packages, the script runs one interactive `npm trust list`
request. npm requires a fresh second-factor challenge for package trust and
settings operations even after `npm login`. Complete the browser prompt and
select the option to skip additional 2FA prompts for the next five minutes so
the remaining bulk operations can proceed. Run the script directly in an
interactive terminal; redirected or background execution cannot open npm's web
authentication flow.

After trusted publishers have been checked or configured, the script sets every
selected package to require two-factor authentication and disallow token-based
publishing. Trusted publishing must therefore already work for every selected
package.

The script prompts once for the current npm authenticator code and supplies it to
each publishing-access request. If the code's 30-second validity window expires
during a large batch, the script asks for a fresh code and retries the affected
package. The code is not echoed or written to disk.

## Adding a new package

npm trusted publishers are configured per package. A new package does not inherit
the configuration of its npm scope or repository, and npm cannot configure trust
until the package exists in the registry.

1. Add the publishable package to the repository under `modules/*` and make sure
   its `package.json` contains the intended package name and repository metadata.
2. Publish its initial version using an interactive npm session. For a public
   scoped package:

   ```bash
   npm publish --access public
   ```

3. Add the package name to the matching repository entry in `packages.json`.
4. Configure its trusted publisher by filtering to the full repository name:

   ```bash
   ./configure-trusted-publishers.sh visgl/example-repository
   ```

5. Verify the resulting package configuration:

   ```bash
   npm trust list @scope/package
   ```

6. After an OIDC publish through `release.yml` succeeds, require two-factor
   authentication and disallow token publishing:

   ```bash
   npm access set mfa=publish @scope/package
   ```

Trusted publishing continues to work after token-based publishing is disabled.
