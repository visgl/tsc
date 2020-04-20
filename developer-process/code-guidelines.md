# Code Guidelines


## Language Features

### JavaScript/ECMAScript version

* We use the latest JS standard from ES2018 and will move up to ES2019, ES2020 as long as features are supported in evergreen browsers and active Node LTS releases.
* We use pure/standard ECMAScript (stage-4 proposals) but no stage-1,2,3 proposals.
* We only use ECMAScript features that work without transpilation directly in **latest** Chrome and Node versions (this is essentially all stage-4 features).
* In rare justified cases, a library may specify exceptions.


### JSX

In React-based libraries, we avoid using JSX syntax if the amount of React included in the library is small. Instead, we use pure react api (`createElement` etc). This keeps the number of babel transforms to a minimum.

### Markdown

We use the github markdown dialect. We strive to make our docs highly readable (including working links) directly on github and handle any necessary changes for e.g. website publishing during HTML conversion.


## Coding Style

Prettier and eslint with Uber's standard config are used to enforce coding style, with a few exceptions:

* We allow longer line due to a preference for slightly more compact code (fewer lines).


## Exports

* We avoid placing excessive index.js files in every directory.
* We avoid `export *` constructions, favoring explicit exports at the top level.
* We prefer individual exports over exporting container objects to maximize tree-shakability.

* Experimental exports start with an underscore `_`.


### Flow/TypeScript

As a general rule, our stance is to avoid using type systems until a broader standard emerges. We want our source code to be easily cut-and-pastable for reuse into any project (whether pure ECMAScript, typescript or flow based). This is probably the principle most often questioned by well-meaning users who have found flow or typescript to be useful in their own projects. It has been extensively discussed, and will only change if the primary developers of each framework want it to change.

At the same time, it is fine for React-focused libraries (such as react-map-gl) to use flow since this is common in the Facebook ecosystem. Also if a new class framework is added to the vis.gl suite from an existing codebase that already includes one of these systems, and the maintainers want to keep it (e.g. nebula.gl) then that is also OK.

While we are holding back on using type systems inside our code bases, we are very interested in offering type definition files so that applications that use flow or typescript get the benefits of type checking when using our frameworks. However, as we don't use these systems we tend to be reliant on external help and PRs.


## Naming

* camelCase for identifiers
* PascalCase for classes
* dash-case for filenames
* file names and class names are carefully matched
* verbNoun naming for functions and methods: 'handleEvent', not 'handle'.
* always type out identifiers, no one letter of abbreviations. `array.map(element => element + 1)` instead of `array.map(e => e + 1)`;

As always, exceptions OK where it makes sense (e.g. `AnimationLoop.start` breaks the verbNoun rule).


## Logging

We use [probe.gl](https://uber-web.github.io/probe.gl) for all information printed to the console. The minimalist library allows us to manage formatting, repeated messages and log priority in one place.

* API deprecation and removal
* Warnings
* Errors
* Debug logs


## asserts

We use `assert`s to check that proper parameters are passed.

We typically do not include any helpful messages to the programmer. These bloat the library and provide little additional value beyond what the developer can glean from his program breaking in the assert.

Exceptions can be made if the particular condition being asserted against is a particular pitfall for programmers and/or dependent on input data (e.g. the failure to conform to the `[lng, lat]` convention in several of our libraries).

Our frameworks have local definitions of `assert`, to avoid bundlers injecting the bloated node polyfill.


## Transpiler

We use babel-preset-env to transpile code for publishing.

We use babel to transpile examples if needed.

