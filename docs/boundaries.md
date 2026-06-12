# Boundaries

This repository is a single-purpose data and contract workspace: the JSON
Schemas and contract sources for the jankurai standard. There is no Rust crate,
no web surface, no PostgreSQL database, and no Python AI/data service committed
here, so those arms of the family stack standard are not applicable.

## Domain

The "domain" of this repo is the set of machine-readable contracts:

- `schemas/` holds the JSON Schemas that other family repos validate their
  artifacts against. These are the product.
- `contracts/` holds the upstream contract sources (OpenAPI, JSON Schema,
  protobuf) from which clients and bindings are generated elsewhere.

Handwritten generated clients, bindings, and product truth do not belong in this
repository. Generated outputs live only under paths declared in
[`agent/generated-zones.toml`](../agent/generated-zones.toml).

## Generated zones

Generated output is never hand-edited. The only generated zone in this repo is
`target/` (the jankurai self-audit's `repo-score` artifacts), declared in
[`agent/generated-zones.toml`](../agent/generated-zones.toml). It is regenerated
by the audit lane and is not committed.

## Ownership and proof

- [`agent/owner-map.json`](../agent/owner-map.json) assigns an owner to every
  top-level path that exists in this repo.
- [`agent/test-map.json`](../agent/test-map.json) routes each owned path to a
  deterministic proof command: `schemas/` to `jq empty schemas/*.json`, the rest
  to the required lane.
- Every proof command runs in this repo alone; there are no sibling-repo
  dependencies in committed manifests.

## Reclassification

If a future change adds a code service (a Rust crate, a web surface, a database,
or a Python service), add the matching boundary declaration, owner, test, and
proof entries before landing the code, and update this document.
