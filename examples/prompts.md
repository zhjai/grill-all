# Example Prompts

## Grill-heavy design review

```text
Use grill-all to grill me on this design. Ask one question at a time, but first check the codebase and docs for anything factual.
```

```text
Challenge this migration plan. Use OpenSpec, ADRs, and the current implementation before asking me questions.
```

## Autonomous vibe coding

```text
Vibe code the new settings page. Use grill-all: inspect docs/code/web first, keep an assumptions log, and only ask me for product decisions or high-risk changes.
```

```text
Implement this feature autonomously. If you hit ambiguity, check project docs and code first; ask me only when it is genuinely a human trade-off.
```

## Docs-first work

```text
Use grill-all with docs-first behavior. Check OpenSpec, README, ADRs, and tests before asking me anything.
```

```text
Before coding, reconcile the proposal with existing docs and code. Ask me only about conflicts that affect scope or product intent.
```

## Web fallback

```text
Use grill-all for this SDK upgrade. Check local code and docs first, then use official web docs for current API behavior.
```

```text
Research the current best practice for this library, but do not let web results override our project docs unless you flag the conflict.
```

## Human decision point

```text
We need to choose between redirect-based login and modal re-auth. Use grill-all: inspect existing UX patterns, then ask me one recommendation-backed question.
```


## Review-only durable decision

```text
Use grill-all to review this plan. If I answer a product decision, suggest the doc note I should add, but do not edit files unless I explicitly ask you to.
```

## Private repository safety

```text
Use grill-all on this private codebase. Do not send source code or logs to web search; use web only for official public SDK docs and summarize any external evidence with URLs.
```
