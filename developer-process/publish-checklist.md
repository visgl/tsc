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

4. Test the branch by running `npm run test` and website examples.

5. Update CHANGELOG.md, making sure all commits and PRs merged after the last release are recorded properly. **Only commits that affect the published content on NPM should be included**, for example changes to the source code, transpile configurations, and package.json.
<div align="center">
  <div>
    <img src="https://raw.github.com/visgl/deck.gl-data/master/images/dev-docs/publish-guideline/image4.png" />
    <p><i>Image Text</i></p>
  </div>
</div>

6. Make sure you are using the correct NPM profile, then run the publish script:
  ```bash
  git add .
  npm run publish prod
  ```
  Double check the version numbers before confirming to publish.


## Beta release

1. Switch to the master branch.
  ```bash
  git checkout master
  git pull
  ```

2. Test the branch by running `npm run test` and website examples.

3. Update CHANGELOG.md, making sure all commits and PRs merged after the last release are recorded properly. **Only commits that affect the published content on NPM should be included**, for example changes to the source code, transpile configurations, and package.json.

4. Only if this is the first pre-release of a new version: open `lerna.json`, change the `version` field to `<version>-alpha.0` or `<version>-beta.0`.

5. Make sure you are using the correct NPM profile, then run the publish script:
  ```bash
  git add .
  npm run publish beta
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
  npm run update-release-branch <X.x>
  ```
3. Push to upstream:
  ```bash
  git push
  ```

### Build and test the website

4. Under the release branch:
 ```bash
 cd website
 yarn
 yarn build # build website
 yarn serve # test website locally
 ```

### Pre-release checks

5. The files inside `website/dist` or `website/public` are the production build of the website. Stage the website on a static server (e.g. your personal GitHub pages) to test in all supported OS and browsers.

6. Test the branch by running `npm run test` and website examples.

7. Check all the bug/feature tickets under the current github milestone. Make sure they are properly listed in What's New (`/docs/whats-new.md`) and Upgrade Guide (`/docs/upgrade-guide.md`). Open a PR to update these pages.

8. Update CHANGELOG.md.

9. Make sure you are using the correct NPM profile, then run the publish script:
  ```bash
  git add .
  npm run publish prod
  ```
  Double check the version numbers before confirming to publish.


### Publish the website

In the website directory, run:
```bash
yarn deploy
```

## Useful Tricks

### Website staging

For [`Gastby`](https://www.gatsbyjs.org/) generated websites, the `index.html` refers to the absolute paths of the generated files under `PATH_PREFIX` (specified in `website/gatsby-config.js`). 
So the deployed path needs to match `PATH_PREFIX`. i.e. if you'd like to deploy `loaders.gl` to `<personal>.github.io/loaders.gl` then `PATH_CONFIG` should be set to `/loaders.gl`. 
**Note: this is for staging and testing purpose, you should not be commit to production** 
