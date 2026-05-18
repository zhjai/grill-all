# grill-all: source-aware plan review for Claude Code, Codex, and AI coding agents

[![Skill](https://img.shields.io/badge/skill-grill--all-blue)](./skills/grill-all/SKILL.md)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)

`grill-all` is a source-aware plan-review skill that helps Claude Code, Codex, and other AI coding agents pressure-test implementation plans. It routes unresolved questions to the right source: project docs, the codebase, human intent, or current web documentation.

Inspired by [`grill-me`](https://github.com/mattpocock/skills/blob/main/skills/productivity/grill-me/SKILL.md) and [`grill-with-docs`](https://github.com/mattpocock/skills/blob/main/skills/engineering/grill-with-docs/SKILL.md), `grill-all` helps an agent stress-test a coding plan while deciding where each answer should come from: the human, project docs, the codebase, or the web.

## Why this exists

Coding agents often fail in two opposite ways:

- They ask humans questions that docs or code could answer.
- They proceed through decisions that actually require human intent, taste, priority, or risk acceptance.

`grill-all` teaches the agent to route each unresolved question to the right source of truth.

## When to use it

Use `grill-all` when you want an agent to challenge a plan, design, refactor, migration, or feature before or during implementation.

It is especially useful when:

- you are vibe coding but still want the agent to stop for real product decisions;
- the project has docs, ADRs, OpenSpec files, issues, or code patterns the agent should inspect before asking you;
- the task may depend on current external facts such as SDK docs, API behavior, framework changes, or ecosystem guidance;
- you want `grill-me`-style questioning without being asked things the agent can verify itself.

## How it behaves

`grill-all` chooses its interaction mode from your prompt:

- **Grill-heavy:** if you ask to be grilled, challenged, pressure-tested, or repeatedly confirmed.
- **Autonomous:** if you ask for vibe coding, autonomous execution, or "don't ask unless blocked".
- **Ask once:** if your prompt does not say, the agent asks whether you prefer more confirmation questions or more autonomous source-checking.

Then it routes questions:

- project facts → docs, specs, ADRs, issues, README, OpenSpec;
- implementation facts → codebase, tests, types, call sites;
- human decisions → one question at a time, with a recommended answer;
- current external facts → official web docs and primary sources.

## Installation

This repo uses the common `skills/<skill-name>/SKILL.md` layout.

### Claude Code

Install the skill into your user skills directory:

```bash
mkdir -p ~/.claude/skills
cp -R skills/grill-all ~/.claude/skills/grill-all
```

Or install it into a project-specific skills directory if your setup loads project skills.

### Codex

Install the skill into your Codex skills directory:

```bash
mkdir -p ~/.agents/skills
cp -R skills/grill-all ~/.agents/skills/grill-all
```

If your Codex setup does not auto-load skills, paste `skills/grill-all/SKILL.md` into the session or reference it from your project instructions.

### Any coding agent

Copy or reference:

```text
skills/grill-all/SKILL.md
```

The skill is plain Markdown with YAML frontmatter, so it can be adapted to most agent systems.

## Example prompts

```text
Use grill-all to stress-test this auth redesign before implementation.
```

```text
Vibe code this feature. Use grill-all, but only ask me when docs/code/web cannot resolve a human decision.
```

```text
Use docs and codebase first. Ask me only for product trade-offs.
```

```text
Challenge this plan using the codebase, OpenSpec, and current framework docs.
```

More examples: [`examples/prompts.md`](./examples/prompts.md)

## Prior art

- [`grill-me`](https://github.com/mattpocock/skills/blob/main/skills/productivity/grill-me/SKILL.md): relentless one-question-at-a-time plan interrogation.
- [`grill-with-docs`](https://github.com/mattpocock/skills/blob/main/skills/engineering/grill-with-docs/SKILL.md): grilling against project language and documentation.

`grill-all` extends those ideas with source routing across humans, docs, code, and web research.

## License

MIT
