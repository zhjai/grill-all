# grill-all

A source-aware grilling skill for Codex, Claude Code, Hermes, and other vibe-coding agents.

`grill-all` extends the ideas behind `grill-me` and `grill-with-docs`: before interrupting the human, decide whether the answer should come from the human, project docs, the codebase, or the web.

## Why

Vibe coding agents often fail in two opposite ways:

- They ask humans too many questions that could be answered from docs or code.
- They proceed autonomously through decisions that actually require human intent, taste, or risk acceptance.

`grill-all` teaches the agent to route each unresolved question to the right source of truth.

## Install

### Claude Code

Copy the skill directory into a Claude Code skills directory:

```bash
mkdir -p ~/.claude/skills
cp -R skills/grill-all ~/.claude/skills/grill-all
```

Or copy it into a project-local skills directory if your Claude Code setup loads project skills.

### Codex and other agents

Copy `skills/grill-all/SKILL.md` into your agent's skills directory, or paste it as an instruction guide for the session.

### Hermes Agent

Install from the raw `SKILL.md` URL after this repo is published:

```bash
hermes skills install https://raw.githubusercontent.com/<owner>/grill-all/main/skills/grill-all/SKILL.md
```

You can also copy `skills/grill-all` into your Hermes skills directory manually.

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

## Default behavior

If the user does not specify whether they want lots of questions or autonomous execution, `grill-all` asks one upfront preference question:

> Do you want me to grill you with confirmation questions, or should I proceed autonomously by checking docs/code/web and only ask when a human decision is required? I recommend autonomous unless this is a high-stakes design.

## License

MIT
