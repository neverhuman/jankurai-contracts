# jankurai-contracts

[![ci](https://img.shields.io/badge/ci-green.svg)](.github/workflows/ci.yml)
[![jankurai score](https://img.shields.io/badge/jankurai--score-pass-brightgreen.svg)](docs/release.md)

JSON Schemas, artifact contracts, compatibility fixtures, and generated type
sources for the **jankurai** standard. This repository is one member of the
Jankurai split family; read [`SPLIT.md`](SPLIT.md) for the family contract and
[`AGENTS.md`](AGENTS.md) for agent routing rules.

## Stack

The jankurai family standard targets a Rust core, a TypeScript/React/Vite
product surface, and a PostgreSQL truth store with generated contracts. This
particular repository is the data and contract member of that stack: it ships no
service code, only the JSON Schemas under [`schemas/`](schemas/) and the contract
sources under [`contracts/`](contracts/) that the Rust and TypeScript family
repos validate against. The proof loop here is schema validation plus the
jankurai self-audit; see [`docs/architecture.md`](docs/architecture.md).

## Quick start

```bash
# One-command setup / validation.
just setup

# Deterministic fast lane (schema validation + self-audit).
just fast

# Full local check: fast lane plus the jankurai audit lane.
just check
```

The full command surface lives in the root [`Justfile`](Justfile). Continuous
integration runs the same lanes under
[`.github/workflows/ci.yml`](.github/workflows/ci.yml).

## Layout

| Path | Role |
| --- | --- |
| `schemas/` | JSON Schemas for the jankurai auditor's artifacts |
| `contracts/` | OpenAPI / JSON Schema / protobuf contract sources |
| `agent/` | machine-readable owner, test, and generated-zone maps |
| `docs/` | architecture, testing, boundaries, release, and exception docs |
| `ops/` | pinned CI script entrypoints |
| `scripts/` | local CI helpers |

## Documentation

- [Architecture](docs/architecture.md)
- [Boundaries](docs/boundaries.md)
- [Testing](docs/testing.md)
- [Release process](docs/release.md)
- [Agent exceptions and overrides](docs/exceptions.md)

## Versioning

The current version is recorded in [`VERSION`](VERSION) and the change history in
[`CHANGELOG.md`](CHANGELOG.md). Release mechanics are documented in
[`docs/release.md`](docs/release.md).

## License

See [`LICENSE`](LICENSE).
