# Framework publish checklist


## Create NPM account

1. Get an account at [npm](https://npmjs.com).
2. Ask framework owners to be added to the proper organizations.
3. If you have multiple npm profiles, [npmrc](https://www.npmjs.com/package/npmrc) is recommended to manage them.


## Patch release

1. Switch to the latest release branch.
  ```bash
  git checkout <X.x>-release
  git pull
  git log
  ```
2. Check all the bug/feature tickets under the current github milestone. Make sure the PRs are all cherry-picked to the release branch.

3. If there were several conflicts in cherry-pick process and you have to make several changes in process of selecting partial changes from a PR, create a PR, get teams review, otherwise just push all changes into release branch directly.

4. Test the branch by running `yarn test browser` and website examples.

5. Update CHANGELOG.md, making sure all commits and PRs merged after the last release are recorded properly. **Only commits that affect the published content on NPM should be included**, for example changes to the source code, transpile configurations, and package.json.
<div align="center">
  <div>
    <img src="https://raw.github.com/visgl/deck.gl-data/master/images/dev-docs/publish-guideline/image4.png" />
    <p><i>Image Text</i></p>
  </div>
</div>

6. Make sure you have **no untracked changes**, except for the modified CHANGELOG.md
  ```bash
  git add CHANGELOG.md
  git status --porcelain
  ```
  
7. Run the publish script, the actual publish will then happen via a [Github workflow](https://github.com/visgl/deck.gl/blob/master/.github/workflows/release.yml):
  ```bash
  yarn publish-prod
  ```
  Double check the version numbers before confirming to publish.


## Beta release

1. Switch to the master branch.
  ```bash
  git checkout master
  git pull
  ```

2. Test the branch by running `yarn test browser` and website examples.

3. Update CHANGELOG.md, making sure all commits and PRs merged after the last release are recorded properly. **Only commits that affect the published content on NPM should be included**, for example changes to the source code, transpile configurations, and package.json.

4. Only if this is the first pre-release of a new version: open `lerna.json`, change the `version` field to `<version>-alpha.0` or `<version>-beta.0`.

5. Make sure you have **no untracked changes**, except for the modified CHANGELOG.md
  ```bash
  git add CHANGELOG.md
  git status --porcelain
  ```
  
6. Run the publish script, the actual publish will then happen via a [Github workflow](https://github.com/visgl/deck.gl/blob/master/.github/workflows/release.yml):
  ```bash
  yarn publish-beta
  ```
  Double check the version numbers before confirming to publish.


## Major/Minor release

### Cut the release branch

1. The latest release branch should be created by duplicating the master branch:
  ```bash
  git checkout master
  git pull
  git checkout -b <X.x>-release
  ```
2. Update the links in documentation and website to point to the current branch:
  ```bash
  yarn update-release-branch <X.x>
  ```
3. Push to upstream:
  ```bash
  git push
  ```

4. Review branch protection rules, e.g. https://github.com/visgl/deck.gl/settings/branches - it may be necessary to a new rule for the newly created branch.

5. Follow the standard [patch release](./publish-checklist.md#patch-release) process to do the release

## Building the website

The website is built and [published automatically](https://github.com/visgl/deck.gl/blob/master/.github/workflows/website.yml) from the newest release branch

## Tips

### Generate CHANGELOG entries

Add the following git alias in `~/.gitconfig` to easily generate entries since the last release:
```bash
cl = !git log $(git describe --tags --abbrev=0)..HEAD --abbrev-commit --pretty=format:'- %s'
```

With clipboard support for OSX:

```bash
cl = !git log $(git describe --tags --abbrev=0)..HEAD --abbrev-commit --pretty=format:'- %s'| pbcopy && git log $(git describe --tags --abbrev=0)..HEAD --abbrev-commit --pretty=format:'- %s'
```
