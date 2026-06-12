# Ops Guidance

Owns the pinned CI lane entrypoints under `ops/ci/` and the git hooks under
`ops/git-hooks/`.

- Owns: `ops/ci/*.sh` (required, fast, security, audit, tool-adoption,
  quality-gates), `ops/git-hooks/pre-push`.
- Forbidden: inlining real commands into `.github/workflows/*.yml`. Workflows
  must stay thin and delegate to `bash ops/ci/<lane>.sh` so local runs and CI
  execute the exact same commands (see `scripts/ci-local.sh`).
- Required: every third-party GitHub Action `uses:` reference must carry a full
  40-character commit SHA so the CI supply chain stays fixed.
- Proof lane: `bash scripts/ci-local.sh gates` runs required -> fast -> audit.

Read `AGENTS.md` at the repo root first for split-family routing rules.
