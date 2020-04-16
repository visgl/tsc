# Test Setup Explained

## Test Suite

Using `tape`.


## Node tests

```bash
npm run test node     # run node tests against source
npm run test dist     # run node tests against transpiled code
```

These are supposed to work identically. The only difference being that one runs the test directly on the ES6 source and one runs the tests on the transpiled ES5 version of the library, just to make doubly sure the transpilation doesn't cause any issues. 

### About JSDom

Firstly, we should absolutely not import jsdom in just one of these two tests. They should both have the same setup, either neither or both should import it.

Secondly, a strong preference would be that we find a way to avoid including jsdom in node tests. The big problem is that the introduction of jsdom hides an important class of problems - i.e. we will no longer catch issues that happen under node in apps that don't include jsdom - which are very common (stray references to window and document etc). Thus, importing jsdom defeats an important part of the purpose of the node tests.

The existing jsdom import into the node test script was introduced during the push to increase coverage, which also saw the addition of the sinon dependency.
If we absolutely need to include jsdom we might need to create a third node test script for node (test/node-no-jsdom.js?) that runs at least some tests without jsdom included.

### Testing WebGL shaders

Unit tests are generally designed to test JavaScript and do not work with GLSL shader source. We use luma.gl's `Transform` class to run unit tests on shader modules in WebGL-enabled environments, and `@luma.gl/debug` to run unit tests on transpiled shader modules under node. See [examples](https://www.github.com/visgl/deck.gl/test/modules/core/shaderlib/project).


## Browser based tests

We use Puppeteer to run the same node test suite in the browser.

### Browser test

```bash
npm run test browser  # run browser tests against source
npm run test browser-headless  # run headless browser tests against source
```

Debugging in the browser much easier than debugging in node, with the Chrome debugger.

Additionally, certain tests (e.g. webworker, WebGL2) only work in the browser. These tests are currently not included in the coverage metrics, but still important for validating the functionalities of the code.

The headless version is automatically run in CI.


### Render test

WebGL is inheritedly difficult to test. The vis.gl render tests are integration tests based on the submodule `@probe.gl/test-utils`. It renders to a canvas in a Puppeteer instance, takes screenshots and compare them to pre-approved "golden images."

These tests are essential to ensuring the visual integrity of the library and preventing regressions.


### Interaction test

Use the render test techniques to test behaviors in response to user interaction, e.g. controllers & picking.


## Git hooks and CI

For pre-push, CI, publish, we want to run everything we got: the linter, run an error-free build, run multiple tests on node etc. Basically, we want to cast the widest possible net to prevent bugs from making their way into master and into the published packages.

That said, for quick iteration of tests during development, it will be frustrating if too many tests are run each time. Since making sure that e.g. CI etc use all tests typically requires adding all the tests to the main package.json "test" script, in many modules we only run test-fast script for pre-commit hooks.
