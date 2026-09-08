#!/usr/bin/env bash
# Tool-adoption evidence lane.
#
# jankurai replaces a fleet of ad-hoc review tools (manual repo scoring, manual
# contract-drift review, manual launch checklists, manual authz/cost/agent-tool
# review) with first-class subcommands. For this JSON-schema repository the
# adopted replacement is the ratchet audit: it scores the repo, detects contract
# drift against the accepted baseline, and emits the repo-score evidence that the
# audit, contract-drift, release-readiness, cost-budget, authz-matrix,
# agent-tool-supply, and proof-routing checks all consume. This lane runs that
# command in CI and writes its evidence under target/jankurai/ and .jankurai/.
# The matching artifacts are uploaded by the workflow's upload-artifact step.
set -euo pipefail
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"
cd "$REPO_ROOT"

mkdir -p target/jankurai .jankurai

# contract-drift / proof-routing / authz-matrix / agent-tool-supply /
# release-readiness / cost-budget all adopt the ratchet audit command.
log "tool-adoption: ratchet audit"
jankurai audit . --mode ratchet --baseline target/jankurai/accepted-baseline.json --json target/jankurai/repo-score.json --md target/jankurai/repo-score.md --repair-queue-jsonl target/jankurai/repair-queue.jsonl --full
# Adopted artifacts: .jankurai/repo-score.json .jankurai/repo-score.md
# target/jankurai/repair-queue.jsonl
cp -f target/jankurai/repo-score.json .jankurai/repo-score.json
cp -f target/jankurai/repo-score.md .jankurai/repo-score.md

# proof-routing consumes the repair queue the ratchet audit emits.
assert_artifact .jankurai/repo-score.json
assert_artifact target/jankurai/repair-queue.jsonl
