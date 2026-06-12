# Agent exceptions and overrides

This document defines the agent-friendly exception pattern for
jankurai-contracts: how an agent or maintainer requests, records, and bounds an
override of a standard rule. Exceptions are the only sanctioned way to deviate
from the audit baseline.

## Principle

The default answer is "follow the standard." An exception is a dated, owned,
expiring waiver for a specific rule on a specific path. Exceptions are data, not
prose: they live next to the contracts they govern and are reviewed on every
audit.

## How to request an exception

1. Identify the exact `rule_id` and `path` the exception applies to (from the
   audit JSON `findings[]` in `.jankurai/repo-score.json`).
2. Add an entry to the relevant `agent/*.toml` manifest, or to the
   `[scan]` exclusion list in
   [`agent/audit-policy.toml`](../agent/audit-policy.toml) when a transient or
   vendored path must be excluded from the scan.
3. Every exception entry MUST carry:
   - `owner` — the team or person accountable.
   - `classification` — e.g. `brownfield`, `temporary`, `vendor`.
   - `expires` — an ISO date after which the exception is invalid and the audit
     fails again.
   - `migration_path` — the concrete plan to remove the exception.

## Example

A temporary exclusion of a vendored fixture tree would be recorded in
[`agent/audit-policy.toml`](../agent/audit-policy.toml):

```toml
[scan]
# owner = "standard"; classification = "vendor"; expires = "2026-12-31";
# migration_path = "Replace vendored fixtures with generated ones, then remove."
extra_excluded_paths = ["contracts/vendor"]
```

## Override review

- Every exception is re-evaluated on each `just audit` run.
- An expired exception is treated as a hard finding, not a pass.
- Removing an exception requires deleting its entry and proving the underlying
  rule now passes on its own.

## What is never excepted

Malformed schemas, removal of a published contract without a rollback path, and
hand-edits to generated zones are never granted exceptions. Fix the underlying
cause instead.
