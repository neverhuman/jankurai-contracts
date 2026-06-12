#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/../.."

find schemas -name '*.json' -maxdepth 1 -print | sort | xargs -r -n1 jq empty
