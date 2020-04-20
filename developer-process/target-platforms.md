# Target Platforms

vis.gl libraries are designed to tap into the power of recent generations of browsers and hardware. While they work best in an environment of relatively up-to-date hardware and software, support is provided on a selected range of less recent configuration.


## Browser Support

Active support is provided to the [mainstream versions](https://browserl.ist/) of "evergreen" browsers.
Automatic or manual testing is performed in these browsers before each release. If new issues emerge in the latest version of these browsers, we strive to address them as soon as possible.

* Desktop
  - Chrome
  - Firefox
  - Safari
  - Edge
* Mobile
  - Safari iOS
  - Android webview
  - Chrome for Android
  - Firefox for Android
* Node.js (non-visual features only)

Limited support is provided to the following browsers for user-base coverage. Issues in these browsers are looked into when they are reported by the community. PRs are accepted only if they are limited in scope (no architectural impact or changes that could affect supported systems).

* IE 11
* Opera
* Opera for Android
* Electron


## System Support

### GPU / OS support

We intend to support all WebGL-compliant platforms, which includes modern GPUs from major vendors, namely Nvidia, AMD and Intel running on latest macOS, Windows and popular distributions of Linux.

Historically we have seen many issues due to the inconsistent implementation of graphic card drivers. It is difficult to test all combinations of hardware and OS, especially when it comes to Linux. We rely on the help from the community to identify and test these solutions.


### Software Rendering

SwiftShader is supported and extensively tested via automated testing.

We intend to make software rendering under [Mesa](http://www.mesa3d.org/intro.html) a reliable option which could be used as a fallback for various Linux distributions and versions. Unit tests are already run under headless gl which uses a Mesa configuration on Travis CI, however there are no automated render tests in this environment.


### Virtual Machines

Except for software renderer based on Mesa, we generally do not support running WebGL-dependent features in virtual machines, although we will consider PRs if they are limited in scope.
