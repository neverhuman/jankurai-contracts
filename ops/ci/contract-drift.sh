#!/usr/bin/env bash
# Contract-drift lane: detect breaking changes in the published contract surface.
#
# This repository is the source of truth for the family's JSON Schemas and
# OpenAPI/contract sources, so an accidental rename or removal of a schema is a
# breaking API change for every downstream consumer. This lane runs an
# openapi-diff-style comparison: it computes the current contract inventory and
# compares it against the committed baseline, failing on any removed contract.
# The same lane runs locally via `just drift`.
set -euo pipefail
export LC_ALL=C
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"
cd "$REPO_ROOT"

mkdir -p target
baseline="contracts/contract-inventory.txt"
current="target/contract-inventory.txt"
accepted="target/accepted-contract-inventory.txt"

log "contract-drift: openapi-diff over schemas/ and contracts/"
find schemas contracts -type f -name '*.json' | sort > "$current"

if [[ -f "$baseline" && ! -L "$baseline" && -s "$baseline" ]]; then
  # Compare sets under the same locale. The committed inventory's historical
  # ordering must not turn existing proof schemas into apparent removals.
  sort "$baseline" > "$accepted"
  # openapi-diff semantics: a contract present in the baseline but missing now is
  # a breaking removal.
  removed="$(comm -23 "$accepted" "$current")"
  if [ -n "$removed" ]; then
    printf '[ci] breaking contract removal detected:\n%s\n' "$removed" >&2
    exit 1
  fi
  log "contract-drift: no breaking removals versus baseline"
else
  printf '[ci] contract-drift requires a nonempty regular accepted inventory\n' >&2
  exit 1
fi
