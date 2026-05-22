#!/usr/bin/env bash
set -euo pipefail

python3 - <<'PY'
import json, pathlib, re, yaml, hashlib
root = pathlib.Path('.')
json_paths = [
  '.codex-plugin/plugin.json',
  'plugins/grill-all/.codex-plugin/plugin.json',
  '.agents/plugins/marketplace.json',
  '.claude-plugin/marketplace.json',
  'plugins/grill-all/.claude-plugin/plugin.json',
]
for path in json_paths:
    json.loads((root / path).read_text())

skill_paths = [
  'skills/grill-all/SKILL.md',
  '.agents/skills/grill-all/SKILL.md',
  '.codex-plugin/skills/grill-all/SKILL.md',
  'plugins/grill-all/skills/grill-all/SKILL.md',
]
hashes = []
for path in skill_paths:
    text = (root / path).read_text()
    assert text.startswith('---'), path
    m = re.search(r'\n---\s*\n', text[3:])
    assert m, path
    fm = yaml.safe_load(text[3:m.start()+3])
    assert fm['name'] == 'grill-all', path
    assert fm['description'], path
    hashes.append(hashlib.sha256(text.encode()).hexdigest())
assert len(set(hashes)) == 1, hashes
print('json ok; skill frontmatter ok; skill copies in sync')
PY

if command -v claude >/dev/null 2>&1; then
  claude plugin validate .claude-plugin/marketplace.json >/tmp/grill-all-claude-marketplace.txt
  claude plugin validate plugins/grill-all >/tmp/grill-all-claude-plugin.txt
  echo 'claude plugin validate ok'
fi

if command -v codex >/dev/null 2>&1; then
  TMP_HOME=$(mktemp -d)
  HOME="$TMP_HOME" codex plugin marketplace add "$(pwd)" >/tmp/grill-all-codex-add.txt
  HOME="$TMP_HOME" codex plugin list >/tmp/grill-all-codex-list.txt
  grep -q 'grill-all' /tmp/grill-all-codex-list.txt
  rm -rf "$TMP_HOME"
  echo 'codex marketplace discovery ok'
fi
