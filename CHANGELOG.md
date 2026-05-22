# Changelog

## v0.1.1 - 2026-05-22

- Fix Codex marketplace layout by pointing `.agents/plugins/marketplace.json` to `plugins/grill-all`.
- Add `plugins/grill-all/.codex-plugin/plugin.json` so the Codex plugin package is discoverable.
- Update README install commands for Codex and Claude Code.
- Prefer explicit HTTPS for Claude Code marketplace installation.
- Clarify Codex user skill location: `${CODEX_HOME:-$HOME/.codex}/skills`.
- Add Claude marketplace description metadata.
- Tighten durable-decision documentation rules: write only with authorization; suggest notes in review-only mode.
- Add `SECURITY.md` and packaging verification script.

## v0.1.0 - 2026-05-22

- Initial preview release of `grill-all`.
