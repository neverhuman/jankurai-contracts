#!/usr/bin/env bash
# Required lane: the lightweight gate that must pass on every push.
# Validates that every committed schema under schemas/ is well-formed JSON.
set -euo pipefail
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"
cd "$REPO_ROOT"

log "required lane: complete hosted job inventory and workflow mutation controls"
require_tool node
node --test scripts/ci-aggregate.test.mjs scripts/contract-drift.test.mjs

log "required lane: jq empty schemas/*.json"
jq empty schemas/*.json
