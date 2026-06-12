# Copilot instructions

This is a thin adapter. Read the canonical agent routing in
[`../AGENTS.md`](../AGENTS.md) and the split-family contract in
[`../SPLIT.md`](../SPLIT.md) first.

- This repository ships JSON Schemas (`schemas/`) and contract sources
  (`contracts/`), not service code.
- The proof loop is `just fast` (schema validation + jankurai self-audit).
- Do not hand-edit generated artifacts listed in
  [`../agent/generated-zones.toml`](../agent/generated-zones.toml).
- Owner and proof routing live in
  [`../agent/owner-map.json`](../agent/owner-map.json) and
  [`../agent/test-map.json`](../agent/test-map.json).
