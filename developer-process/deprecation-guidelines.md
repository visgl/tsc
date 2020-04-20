# Deprecation Guidelines

Deprecated APIs generally go through the following stages:

1. Long-tail. During this phase, the API is marked as "deprecated." Code referencing it continues to work, but a warning is logged to the console that asks developers to upgrade their usage.
2. End-of-life. The API no longer works, and if it's referenced, an error is logged to the console that asks developers to upgrade their usage.
3. Removed. Legacy usage is no longer monitored and will fail without a warning.

Each phase change must be reflected in the "Upgrade Guide" of the release.

General rules for deprecation:

- No deprecation in patch releases.
- A feature can enter phase 1 (long-tail) in a new minor release.
- A feature can move from phase 1 (long-tail) to phase 2 (end-of-life) in a new major release. Important features (widely used in examples and likely used by most users) should remain in phase 1 for at least a full major release.
- A feature can move from phase 2 (end-of-life) to phase 3 (removed) in a new major release.
- Features clearly marked as experimental (both via naming convention and documentation) can be directly removed in a new minor release.

## Example

Option `dashed: <bool>` is intended to be replaced by `dashedArray: <number[]>`. The new feature is first released in v 3.1. In this version, any code using `dashed` will see it continued to work with the following warning:

<div style="color:yellow;background:orange;">`dashed` is deprecated. Use `dashedArray` instead.</div>

The behavor will continue throughout v4.x. In v5.0, any code using `dashed` will not see any effect, with the following error:

<div style="color:red;">`dashed` is removed. Use `dashedArray` instead.</div>

The behavor will continue throughout v5.x. In v6.0, any code using `dashed` will not see any effect, with no warning or error.
