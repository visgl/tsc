# hubble.gl

This is a proposal to transfer hubble.gl to vis.gl, a OpenJS Foundation project within the Open Visuaization Collaboration Space (formerly the Urban Computing Foundation).

> Note: This proposal was originally accepted by the Urban Computing Foundation (UCF) Technical Advisory Committee (TAC) on 2020-12-22.

## Project description

Hubble.gl streamlines the creation of high quality 3d video animations within a web browser for applications built with vis.gl visualization libraries, such as deck.gl and kepler.gl. From its inception, hubble.gl’s mission has been to develop deeper integrations with the vis.gl ecosystem so that the thousands of motion designers, engineers, and GIS scientists already using these tools can seamlessly collaborate on presentations and video assets, much like Uber Elevate has done on dozens of occasions, including the Uber Elevate Summit Keynotes in 2018 and 2019.


## Statement on alignment with Foundation charter's mission

The UCF charter's mission statement: "The mission of the Project is to enable widespread adoption and help accelerate development of open source urban computing and a surrounding ecosystem."

The current goals of the project include development of a direct UI integration with kepler.gl and tighter integrations with other vis.gl modules a part of the Urban Computing Foundation (UCF). We’re also looking to expand the number of contributors and users coming from the growing vis.gl community. Integrations are a huge effort to undertake and require two-way changes between libraries. Members of the UCF are interested in encouraging the development of these integrations, but have expressed concerns that without a consolidation of efforts the UCF Technical Steering Committee may hesitate due to its inability to ensure long term alignment with the hubble.gl half of the integration. 

Transferring to an open source foundation will bring in strong technical leadership to Hubble.gl and increase the appeal for high effort collaborations between itself and other vis.gl projects.

## Link to current Code of Conduct

- [hubble.gl](https://github.com/uber/hubble.gl/blob/master/CODE_OF_CONDUCT.md)

## Sponsor from TAC

Shan He

## Project license

- `hubble.gl` - MIT license

## Source control

Hubble.gl is in GitHub:

- [hubble.gl](https://github.com/uber/hubble.gl)

## Issue tracker

All issues are currently managed on GitHub:

- [hubble.gl](https://github.com/uber/hubble.gl/issues)

## External dependencies

- `deck.gl`, `luma.gl`, `loaders.gl` (MIT)
- `popmotion` (MIT)
- `downloadjs` (MIT)
- `react` (MIT)
- `webm-writer` (WTFPL)
- `turf.js` (MIT)
- `styled-components` (MIT)

## Release methodology and mechanics

- [hubble.gl developer guidelines](https://github.com/uber/hubble.gl/blob/master/CONTRIBUTING.md)

## Names of initial committers, if different from those submitting proposal

- Chris Gervang (Uber)
- Raymond Wu

## Briefly describe the project's leadership team and decision-making process

- Chris Gervang (Uber) - current tech lead at Uber Elevate

Currently decisions are made by Chris Gervang. PRs are expected to follow [vis.gl tsc guidelines](https://github.com/visgl/tsc/tree/master/developer-process).

## Link to any documented governance practices

None

## Preferred maturity level

At Large stage

## List of project's official communication channels

-  Currently no official channel. We would like to create a channel in the [deck.gl public Slack](https://deckgl.slack.com) since we already unofficially use it.

## Link to project's website

- [hubble.gl](https://hubble.gl)

## Links to social media accounts

None

## Existing financial sponsorship

Uber

## Infrastructure needs or requests

- Domain registration
    + hubble.gl
- Mapbox Access Token
    + for hubble.gl documentation website
- Continuous Integration
    + Travis CI or equivalent