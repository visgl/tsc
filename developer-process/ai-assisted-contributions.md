# AI-Assisted Contributions

vis.gl projects are hosted by the OpenJS Foundation. The Foundation's
[Policy on Use of AI Coding Assistants](https://ai-coding-assistants-policy.openjsf.org/),
adopted by its Board on March 27, 2026, applies to submissions to vis.gl repositories: "By making a
submission to a project hosted by OpenJS Foundation, the submitter agrees to all of the terms of this
policy, whether or not their project requires the sign-off on a Developers Certificate of Origin
(DCO)." This page describes how vis.gl projects apply that policy in practice. It applies equally to
maintainers and to first-time contributors.

The policy does not forbid AI tools. Several vis.gl repositories publish guidance for agents
(`AGENTS.md`, skills, `llms.txt`). It asks that people stay responsible for what they submit and say
how it was made.

## What the Foundation policy says

- **Responsibility.** "[E]very code submitter remains responsible for their submission, regardless
  of the manner or degree to which they employ AI Assistants."
- **Licensing.** "All AI-assisted submissions must comply with the licensing requirements of the
  project to which the submission is made."
- **DCO.** "AI Assistants must not add Signed-off-by tags. Only humans can certify a DCO." (vis.gl
  repositories do not currently require sign-off; the rule still applies wherever a DCO is used.)
- **Duty of care.** "The human submitter is responsible for: reviewing AI Assistant-generated code;
  ensuring compliance with licensing requirements; adding their own Signed-off-by tag to certify the
  DCO where a DCO is required; taking responsibility for the submission."
- **Attribution (recommended).** Attribution is "strongly recommended for transparency as well as to
  help track the evolving role of AI in the development process. Submissions should therefore
  include an appropriate Assisted-by AI tag, identifying the AI Assistants used."

## How this applies in vis.gl projects

### 1. Disclose substantial assistance

Disclose when a contribution contains substantial AI-generated content. For code, "substantial"
means anything beyond single-line autocomplete: whole functions, tests, shaders, algorithms. For
documentation, anything more than a few words.

The pull request description is the disclosure of record: say which tool was used, what it did, and
what you did to verify the result. Tick the AI-assistance box where the repository's template has
one. Where commits are preserved, or when a maintainer writes the squash-merge message, also add a
trailer in the Foundation's recommended form, for example `Assisted-by: LLM` or
`Assisted-by: a coding agent`; naming the specific tool is welcome in the description and optional
in the commit message.

Disclosure is not penalized in review.

### 2. Understand and be able to defend the change

You must be able to explain the change in your own words: why it is needed, how it works, and what
it affects. Treat analysis produced by an AI tool as a hypothesis to verify against the source, not
as a fact. Answer review comments yourself; automated or pasted AI replies are not an acceptable way
to take part in review. If you cannot follow the review personally, close the pull request so that
someone else can take the work over.

### 3. Verify before asking for review

Run the relevant tests locally before marking a pull request ready. For rendering changes this
includes the render and browser tests, not only the unit tests: a change that typechecks is not a
change that renders. Do not remove or alter existing tests to make generated code pass without
understanding why they failed. If new tests were generated, verify that they test the intended
behaviour rather than restate how the implementation happens to behave.

### 4. Respect reviewer time

A contribution should be worth more to the project than the time it takes to review. Keep generated
changes small and scoped; split large changes into reviewable pull requests. Pull requests whose
author cannot explain them, has not tested them, or has misrepresented how they were made may be
closed without further review. Repeated or dishonest cases are referred to the steering committee
and handled under the Code of Conduct.

### 5. Leave newcomer issues to people

Do not use AI tools to fix issues labelled for newcomers (for example `good first issue`). Those
issues exist so that new human contributors can learn the codebase and the process.

### 6. No unattended automation

Pull requests and issues are opened by people. Automated agents may not open them on their own unless
the maintainers have approved that automation in advance, as they have for dependency-update bots
and reviewed GitHub workflows.

### 7. Issues, bug reports and reviews

Bug reports should include a reproduction the reporter has run. Reports and review comments produced
by a tool and not verified by the person posting them may be closed or hidden.

### 8. Communication

Write your own issues, comments and pull request descriptions. Tools for translation, spelling or
grammar are fine. A description drafted by an agent that you have edited, verified and disclosed is
acceptable; a description you have not read is not. Do not post generated text as your own reasoning.

### 9. Copyright and provenance

Using a tool to regenerate copyrighted material does not remove the copyright. You are responsible
for having the right to contribute what you submit under the repository's license, whether it was
written by hand, generated by a tool, or adapted from elsewhere. See the Linux Foundation's
[Guidance Regarding Use of Generative AI Tools](https://www.linuxfoundation.org/legal/generative-ai).

### 10. Working with agents

Repositories may provide an `AGENTS.md` with the commands, quality gates and conventions an agent
should follow. Agents are expected to follow it, and contributors using agents are expected to make
sure the disclosure above is present in what the agent prepares. Agents must never add
`Signed-off-by` tags.

## Why

Review time is the scarcest resource in these projects, and provenance matters for a
foundation-hosted codebase. This page follows the OpenJS Foundation policy and borrows practice from
the Node.js AI guidelines, the MapLibre AI policy, LLVM's AI tool policy and the Linux kernel's
guidance for coding assistants.

## References

- OpenJS Foundation, [Policy on Use of AI Coding Assistants](https://ai-coding-assistants-policy.openjsf.org/) (March 27, 2026)
- Linux Foundation, [Guidance Regarding Use of Generative AI Tools for Open Source Software Development](https://www.linuxfoundation.org/legal/generative-ai)
- Node.js, [AI use policy and guidelines](https://github.com/nodejs/node/blob/main/doc/contributing/ai-guidelines.md) (August 2026)
- MapLibre, [AI policy](https://github.com/maplibre/maplibre/blob/main/AI_POLICY.md) (December 2025; PR-template checkbox April 2026)
- LLVM, [AI tool policy](https://llvm.org/docs/AIToolPolicy.html)
- Linux kernel, [Coding assistants](https://www.kernel.org/doc/html/latest/process/coding-assistants.html) (`Assisted-by: LLM [TOOL]`)
- Kubernetes, [AI guidance for pull requests](https://github.com/kubernetes/community/blob/master/contributors/guide/pull-requests.md#ai-guidance) (disclosure in the PR description only; forbids trailers)
- A catalogue of open-source AI contribution policies: [melissawm/open-source-ai-contribution-policies](https://github.com/melissawm/open-source-ai-contribution-policies)
