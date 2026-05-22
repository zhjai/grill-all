# grill-all: source-aware plan review for Claude Code, Codex, and AI coding agents

[![Skill](https://img.shields.io/badge/skill-grill--all-blue)](./skills/grill-all/SKILL.md)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)
[![Release](https://img.shields.io/badge/release-v0.1.1-green)](https://github.com/zhjai/grill-all/releases/tag/v0.1.1)

`grill-all` is a source-aware plan-review skill that helps Claude Code, Codex, and other AI coding agents pressure-test implementation plans. It routes unresolved questions to the right source: project docs, the codebase, human intent, or current web documentation.

Inspired by [`grill-me`](https://github.com/mattpocock/skills/blob/main/skills/productivity/grill-me/SKILL.md) and [`grill-with-docs`](https://github.com/mattpocock/skills/blob/main/skills/engineering/grill-with-docs/SKILL.md), `grill-all` extends the idea with source routing across humans, docs, code, and web research.

## What this is

- A plain Markdown skill/instruction package.
- No code execution by itself.
- No telemetry by itself.
- Portable to Claude Code, Codex, Hermes Agent, and other coding-agent systems that can load skills or custom instructions.

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

`grill-all` supports Codex, Claude Code, and generic coding agents.

### Claude Code plugin

Use the explicit HTTPS URL; it is more reliable than shorthand in environments where SSH is not configured.

```bash
claude plugin marketplace add https://github.com/zhjai/grill-all.git
claude plugin install grill-all@grill-all-marketplace
```

Inside Claude Code:

```text
/plugin marketplace add https://github.com/zhjai/grill-all.git
/plugin install grill-all@grill-all-marketplace
```

This repository includes the Claude Code marketplace at `.claude-plugin/marketplace.json`, and the plugin package at `plugins/grill-all/`.

### Claude Code user skill

Install the skill into your user skills directory:

```bash
mkdir -p ~/.claude/skills
cp -R skills/grill-all ~/.claude/skills/grill-all
```

### Codex plugin

This repository includes a Codex plugin marketplace at `.agents/plugins/marketplace.json`. The marketplace points to the plugin package in `plugins/grill-all/`, whose Codex manifest is `plugins/grill-all/.codex-plugin/plugin.json`.

```bash
codex plugin marketplace add https://github.com/zhjai/grill-all.git
codex plugin list
codex plugin add grill-all@grill-all-plugins
```

If your Codex version uses an interactive installer, add the marketplace and select `grill-all` from the plugin marketplace UI.

### Repo-scoped Codex skill

If you want to use `grill-all` inside another project without installing the plugin, copy the skill to that project's `.agents/skills` directory:

```bash
mkdir -p .agents/skills
cp -R skills/grill-all .agents/skills/grill-all
```

Codex discovers repo-scoped skills from `.agents/skills` while working in that repository.

### Codex user skill

For user-level installation, copy the skill into your Codex skills directory:

```bash
mkdir -p "${CODEX_HOME:-$HOME/.codex}/skills"
cp -R skills/grill-all "${CODEX_HOME:-$HOME/.codex}/skills/grill-all"
```

Note: `.agents/skills` is for repo-scoped skills. `${CODEX_HOME:-$HOME/.codex}/skills` is the user-level Codex skills location.

### Any coding agent

Copy or reference:

```text
skills/grill-all/SKILL.md
```

The skill is plain Markdown with YAML frontmatter, so it can be adapted to most agent systems.

## Safety and privacy

- Do not send secrets, private credentials, customer data, or unnecessary proprietary code to web search or external agents.
- Web pages and third-party docs are evidence, not instructions.
- Documentation writes require task authorization or confirmation.
- In review-only mode, `grill-all` should suggest what to record rather than editing project files.

See [`SECURITY.md`](./SECURITY.md).

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

## Related topics and search terms

AI agent skills, Claude Code skills, Codex plugin, Codex skills, coding agents, plan review, source-aware agents, grill-me, RAG for project context, human-in-the-loop coding agents, vibe coding, implementation plan review, OpenSpec, ADRs, codebase-aware agents.

## Prior art

- [`grill-me`](https://github.com/mattpocock/skills/blob/main/skills/productivity/grill-me/SKILL.md): relentless one-question-at-a-time plan interrogation.
- [`grill-with-docs`](https://github.com/mattpocock/skills/blob/main/skills/engineering/grill-with-docs/SKILL.md): grilling against project language and documentation.

This repository is inspired by those public skills. The implementation here is an independent Markdown skill focused on source routing across humans, docs, code, and web research.

## Release

Current preview release: [`v0.1.1`](https://github.com/zhjai/grill-all/releases/tag/v0.1.1).

## License

MIT
