# SQLRooms

This is a proposal to transfer SQLRooms to vis.gl, an OpenJS Foundation project within the Open Visualization Collaboration Space.

## Applicant

Ilya Boyandin

## Project description

SQLRooms is a framework and runtime for building local-first data analytics applications with DuckDB and React. It supports multiple execution modes: fully in-browser analytics with DuckDB-WASM, local-first applications with persistent browser storage, and applications backed by native DuckDB in a local or shared session backend.

The project provides components and patterns for data loading, SQL editing, query execution, data visualization, panel layouts, dashboards, and analytics workflows. It enables developers to build sophisticated JavaScript and TypeScript applications for interactive data exploration, business intelligence, privacy-focused data processing, and AI-assisted analysis.

SQLRooms treats DuckDB not only as an embedded query engine, but as an analytical runtime for portable workspaces. A SQLRooms application can combine data, queries, visualizations, dashboard state, and application-specific UI into a cohesive analytics experience that can run locally, in the browser, or with an optional backend when collaboration, native performance, or larger datasets are needed.

## Statement on alignment with OpenJS Foundation charter's mission

SQLRooms is an open source project built with JavaScript and TypeScript, directly aligning with the OpenJS Foundation's mission of supporting sustainable and open web technologies. The project follows the Foundation's principles of transparency, openness, collaboration, and ethical development.

By joining the OpenJS Foundation, SQLRooms aims to:

- Accelerate adoption by leveraging the Foundation's reach and support.
- Create synergies with other data visualization and web application projects in the OpenJS and vis.gl ecosystems.
- Foster a strong, collaborative open source community around browser-based analytics tools.
- Establish best practices for client-side data processing applications in the JavaScript ecosystem.

## Impact and users of the project

SQLRooms addresses the growing need for privacy-focused, local-first analytics tools. By combining DuckDB, React, and modern JavaScript application patterns, SQLRooms expands what data applications can do without requiring heavyweight backend infrastructure. It can run fully client-side for private browser-based workflows, while also supporting native DuckDB backends for larger local datasets, desktop applications, and shared analytical sessions.

The project is intended for web developers and data professionals building:

- Interactive data exploration and analysis tools.
- Custom business intelligence dashboards.
- Self-contained and portable analytics applications.
- Local-first desktop or browser-based data applications.
- Privacy-focused workflows where data remains local or under the user's control.
- AI-powered data analysis workflows that can inspect data, run queries, and create visualizations.

SQLRooms has the potential to become a foundational framework for local-first analytics applications in the JavaScript ecosystem. While there are libraries for individual parts of this stack, such as charting, tables, SQL editors, and embedded databases, SQLRooms integrates data management, querying, visualization, workspace state, and application UI into a cohesive framework.

## Link to current Code of Conduct

- [SQLRooms Code of Conduct](https://github.com/sqlrooms/sqlrooms/blob/main/CODE_OF_CONDUCT.md)

## Sponsor from TSC

TBD

## Project license

- `sqlrooms` - MIT license

## Source control

- [SQLRooms organization on GitHub](https://github.com/sqlrooms)
- [SQLRooms main repository on GitHub](https://github.com/sqlrooms/sqlrooms)
- [SQLRooms packages on npm](https://www.npmjs.com/org/sqlrooms)
- [SQLRooms organization on PyPi](https://pypi.org/org/sqlrooms/)

## Issue tracker

- [SQLRooms issues](https://github.com/sqlrooms/sqlrooms/issues)

## External dependencies

All dependencies are managed through npm/pnpm and listed in the project's `package.json` files. Major dependencies include:

- `@duckdb/duckdb-wasm`
- `duckdb` native DuckDB bindings for backend/runtime integrations
- `react`
- `tailwindcss`
- Visualization and analytics libraries
  \*\*
  Dependencies are expected to use MIT or similarly permissive licenses.

## Release methodology and mechanics

- [SQLRooms contributing guidelines](https://github.com/sqlrooms/sqlrooms/blob/main/CONTRIBUTING.md)

## Names of initial committers, if different from those submitting proposal

TBD

## Briefly describe the project's leadership team and decision-making process

The current leadership team consists of:

- [Ilya Boyandin](https://github.com/ilyabo)
- [Xun Li](https://github.com/lixun910)

Leadership membership is based on significant contributions and will be decided through a transparent process that is formalized as the project grows. Individuals outside the leadership team can propose changes via pull requests on GitHub. Contributors who demonstrate consistent, high-quality contributions may be granted commit access after review by the leadership team.

SQLRooms is committed to establishing an open governance model and will work with the OpenJS Foundation to formalize governance during the incubation process. PRs are expected to follow [vis.gl TSC guidelines](https://github.com/visgl/tsc/tree/master/developer-process).

## Link to any documented governance practices

Formal governance guidelines will be established as part of the onboarding process.

- [SQLRooms contributing guidelines](https://github.com/sqlrooms/sqlrooms/blob/main/CONTRIBUTING.md)

## Preferred maturity level

Incubating

After incubation, SQLRooms aims to become an At-Large Project.

## List of project's official communication channels

- [SQLRooms GitHub Discussions](https://github.com/sqlrooms/sqlrooms/discussions)
- [Slack Channel](https://sqlrooms.org/join-slack)

## Link to project's website

- [SQLRooms documentation and examples](https://sqlrooms.org)

## Links to social media accounts

- [YouTube channel](https://www.youtube.com/@sqlrooms)

## Security policy

SQLRooms will establish a formal security policy as part of the onboarding process. Currently, security issues can be reported through GitHub issues or directly to the maintainers.

## Existing financial sponsorship

The project is currently funded by Ilya Boyandin and the development is partially supported by Foursquare.

## Infrastructure needs or requests

No immediate infrastructure requests. Technical, financial, or promotional support would be appreciated.

## Domains

The following domain will be transferred to the OpenJS Foundation upon successful graduation from the incubation phase:

- [sqlrooms.org](https://sqlrooms.org)
