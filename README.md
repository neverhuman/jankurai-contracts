# jankurai-contracts

<!-- jankurai-badge:start -->
[![Jankurai score: 90/100](agent/jankurai-badge.svg)](agent/jankurai-badge.json)
<!-- jankurai-badge:end -->

Historical score from the committed [baseline report](agent/baselines/main.repo-score.json)
and [auditor metadata](agent/jankurai-badge.json).

JSON Schemas, artifact contracts, compatibility fixtures, and generated type
sources for the **jankurai** standard. This repository is one member of the
Jankurai split family; read [`SPLIT.md`](SPLIT.md) for the family contract and
[`AGENTS.md`](AGENTS.md) for agent routing rules.

## Contributor setup

This repository supplies artifact schemas and compatibility fixtures to
[Jankurai](https://github.com/neverhuman/jankurai). Start at the hub for binary
installation, your first audit, or the complete family build.

Install Node.js **24**, Git, and `jq`, then validate the schemas and CI controls:

```sh
bash scripts/ci-local.sh required
```

The complete [quality lane](ops/ci/github-check.sh) also needs the pinned auditor
and security tools installed by [CI setup](ops/ci/github-setup.sh). It runs schema
validation, accepted-contract drift checks, security scans and the audit against
the protected baseline. See [testing](docs/testing.md) and the [Justfile](Justfile).

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
