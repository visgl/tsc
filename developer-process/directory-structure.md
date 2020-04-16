# Directory Structure

This file describes the model used for code management.

Most vis.gl repositories are monorepos, meaning that multiple submodules are published to npm from the same repo with synchronized version numbers.

## Monorepo directory structure (Legacy)

This is the legacy directory structure used by some projects. New projects should adopt the new directory structure as described in the next section.

```bash
root
  ├── dev-docs              # Documentation for developers of the framework
  │     ├── RFCs
  │     ├── roadmaps
  ├── docs                  # Documentation for users of the framework
  │     ├── api-reference
  │     │     └── <submodule>
  │     ├── get-started
  │     ├── developer-guide
  │     ├── whats-new.md
  │     ├── upgrade-guide.md
  ├── examples
  │     ├── get-started     # Boilerplate templates
  │     └── <example>       # Examples used on the website
  ├── modules
  │     └── <submodule>     # <submodule> source
  │           ├── src
  │           ├── README.md
  │           └── package.json
  ├── scripts               # Dev scripts for lint, test, build etc.
  ├── test
  │     ├── apps            # Apps for dev testing, e.g. WIP features
  │     ├── bench           # Benchmarks
  │     ├── modules         # Unit tests, mirrors `modules` structure
  │     │     └── <submodule>
  │     └── render          # Render tests
  └── website               # Source of the website
```

## Monorepo directory structure


```bash
root
  ├── dev-docs              # Documentation for developers of the framework
  │     ├── RFCs
  │     ├── roadmaps
  ├── docs                  # Documentation for users of the framework
  │     ├── get-started
  │     ├── developer-guide
  │     ├── whats-new.md
  │     ├── upgrade-guide.md
  ├── examples
  │     ├── get-started     # Boilerplate templates
  │     └── <example>       # Examples used on the website
  ├── modules
  │     └── <submodule>
  │           ├── docs      # <submodule> API reference
  │           ├── src       # <submodule> source
  │           ├── test      # <submodule> unit tests & benchmarks
  │           ├── README.md
  │           └── package.json
  ├── scripts               # Dev scripts for lint, test, build etc.
  ├── test
  │     ├── apps            # Apps for dev testing, e.g. WIP features
  │     └── render          # Render tests
  └── website               # Source of the website
```


## Branching and Releasing Model

The `master` branch of a repo is the latest dev branch. It is used to publish the latest **beta** releases, e.g. `7.0.0-alpha.1`.

Each minor release branches off from master, e.g. `6.0-release`, `6.1-release`. **Important**: All production releases are built and published from respective release branches.

The website is built from the `<latest>-release` branch.

Only the `master` branch and the `<latest>-release` branch are actively maintained.

