#!/bin/bash
set -e

# Script to update config.js files with the correct protocol commit
# Reads from .deploy-config.json to determine mode

# Read deployment configuration
MODE=$(jq -r '.mode' .deploy-config.json)

if [ "$MODE" == "manual" ]; then
  # Use manually specified commit
  PROTOCOL_COMMIT=$(jq -r '.manualCommit' .deploy-config.json)
  echo "📌 Using manual commit from .deploy-config.json: $PROTOCOL_COMMIT"
else
  # Use current commit (auto mode)
  PROTOCOL_COMMIT="${GITHUB_SHA}"
  # For PRs, use the head commit
  if [ "${GITHUB_EVENT_NAME}" == "pull_request" ]; then
    PROTOCOL_COMMIT="${PR_HEAD_SHA}"
  fi
  echo "🔄 Using auto mode with current commit: $PROTOCOL_COMMIT"
fi

# Export for other steps (only in GitHub Actions environment)
if [ -n "$GITHUB_ENV" ]; then
  echo "PROTOCOL_COMMIT=$PROTOCOL_COMMIT" >> $GITHUB_ENV
fi

# Update both config.js files to use the determined commit
echo "Updating config.js files..."
sed -i "s|/[a-f0-9]\{7,40\}/peds-protocol-|/${PROTOCOL_COMMIT}/peds-protocol-|g" peds-protocol-combined/ui-changes/src/config.js
sed -i "s|/[a-f0-9]\{7,40\}/peds-protocol-|/${PROTOCOL_COMMIT}/peds-protocol-|g" peds-protocol-questionnaires/ui-changes/src/config.js

echo "✓ Updated config.js files to use commit: $PROTOCOL_COMMIT"
echo ""
echo "Combined protocol config:"
grep githubSrc peds-protocol-combined/ui-changes/src/config.js
echo ""
echo "Questionnaires protocol config:"
grep githubSrc peds-protocol-questionnaires/ui-changes/src/config.js