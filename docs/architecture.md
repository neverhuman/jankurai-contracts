# jankurai-contracts Architecture

jankurai-contracts is the data and contract member of the Jankurai split family.
It holds the machine-readable surfaces that every other family repo validates
against:

```text
JSON Schemas (schemas/) + contract sources (contracts/) + generated type source
```

This repository contains no product service, no Rust crate, no web surface, and
no database. Its only "code" is the validation and audit lanes in `ops/ci/` and
`scripts/`. New schemas and contracts are added as data, validated as data, and
released as immutable tagged artifacts.

## Canonical surfaces

| Path | Role |
| --- | --- |
| `schemas/` | JSON Schemas for the jankurai auditor's artifacts (the product) |
| `contracts/` | OpenAPI / JSON Schema / protobuf contract sources |
| `docs/` | architecture, boundaries, testing, release, and exception docs |
| `agent/` | machine-readable owner, test, and generated-zone maps |
| `ops/` | pinned CI script entrypoints |
| `scripts/` | local CI helpers |

## Proof model

The narrowest proof loop is `just fast`: validate that every schema under
`schemas/` is well-formed JSON (`jq empty schemas/*.json`), then run the
jankurai self-audit which writes `repo-score` artifacts under `target/`. CI runs
the identical lanes via `ops/ci/fast.sh` and `ops/ci/audit.sh`.

Agents should prefer [`agent/owner-map.json`](../agent/owner-map.json) and
[`agent/test-map.json`](../agent/test-map.json) to find the owner and proof lane
for a path, then route to the smallest lane that covers their change.

## Related documents

- [`docs/boundaries.md`](boundaries.md) — what is and is not in scope here.
- [`docs/testing.md`](testing.md) — how the schema and contract surface is proven.
- [`docs/release.md`](release.md) — version source, integrity, SBOM, and rollback.
- [`docs/exceptions.md`](exceptions.md) — the agent-friendly exception pattern.
- [`docs/artifact-contracts.md`](artifact-contracts.md) — the schema/guard index.
- [`docs/generated-zones.md`](generated-zones.md) — generated-output rules.
