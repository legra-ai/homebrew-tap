#!/bin/bash

set -u

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)" || {
  printf 'ERROR: cannot resolve tap repository root\n' >&2
  exit 1
}
FORMULA="$REPO_ROOT/Formula/legra.rb"
WORKFLOW="$REPO_ROOT/.github/workflows/update-formula.yml"
README="$REPO_ROOT/README.md"

require_text() {
  local file="$1"
  local text="$2"
  if grep -Fq -- "$text" "$file"; then
    return
  fi
  printf 'ERROR: %s does not contain: %s\n' "$file" "$text" >&2
  exit 1
}

reject_text() {
  local file="$1"
  local text="$2"
  if grep -Fq -- "$text" "$file"; then
    printf 'ERROR: %s still contains removed text: %s\n' "$file" "$text" >&2
    exit 1
  fi
}

if [[ ! -f "$FORMULA" ]]; then
  printf 'ERROR: Legra formula is missing: %s\n' "$FORMULA" >&2
  exit 1
fi
if [[ -e "$REPO_ROOT/Formula/wwkg.rb" ]]; then
  printf 'ERROR: obsolete WWKG formula still exists\n' >&2
  exit 1
fi

require_text "$FORMULA" 'class Legra < Formula'
require_text "$FORMULA" 'homepage "https://legra.ai"'
require_text "$FORMULA" 'https://releases.legra.ai/builds/'
for binary in legra legra-host legra-gateway legra-custodian legra-worker legra-licensor; do
  require_text "$FORMULA" "\"$binary\""
done
reject_text "$FORMULA" 'post_install'
reject_text "$FORMULA" 'wwkg'
reject_text "$FORMULA" 'WWKG'

require_text "$WORKFLOW" 'Formula/legra.rb'
require_text "$WORKFLOW" 'class Legra < Formula'
require_text "$WORKFLOW" 'https://releases.legra.ai/builds/'
reject_text "$WORKFLOW" 'Formula/wwkg.rb'
reject_text "$WORKFLOW" 'releases.wwkg.io'

require_text "$README" 'brew install legra-ai/tap/legra'
reject_text "$README" 'brew install dataroadinc/tap/wwkg'
reject_text "$README" 'wwkg.io'

printf 'Homebrew formula contract OK\n'
