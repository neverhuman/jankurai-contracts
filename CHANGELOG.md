# Changelog

All notable changes to jankurai-contracts are documented in this file. The
format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and
this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
The authoritative version string lives in [`VERSION`](VERSION).

## [Unreleased]

### Added

- Root `Justfile` command surface with `setup`, `fast`, `check`, `lint`, `test`,
  and `audit` lanes for one-command setup and validation.
- GitHub Actions CI (`.github/workflows/ci.yml`) with a deterministic fast lane
  (schema validation) and a jankurai audit job, all third-party actions pinned
  to commit SHAs.
- Agent-readable documentation: `README.md`, `docs/architecture.md`,
  `docs/boundaries.md`, `docs/testing.md`, `docs/release.md`, and
  `docs/exceptions.md`.
- `agent/audit-policy.toml` with scan exclusions scoped to this repo's transient
  output paths.

### Changed

- Re-scoped `agent/owner-map.json`, `agent/test-map.json`, and
  `agent/generated-zones.toml` to the paths that exist in this schema and
  contract repository.

## [1.7.0] - 2026-06-12

### Added

- Initial split-family extraction of the jankurai JSON Schemas and artifact
  contracts.
