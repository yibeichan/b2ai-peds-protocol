#!/bin/bash
set -e

# Build script for a single protocol
# Usage: ./build-protocol.sh <protocol_slug> <protocol_title> <ui_commit_hash>

PROTOCOL_SLUG=$1
PROTOCOL_TITLE=$2
UI_COMMIT_HASH=$3

echo "Building protocol: $PROTOCOL_SLUG"

# Extract and setup reproschema-ui
unzip -q ${UI_COMMIT_HASH}.zip
mv reproschema-ui-* ui-${PROTOCOL_SLUG}

# Copy UI changes
cd ui-${PROTOCOL_SLUG}
cp -r ../${PROTOCOL_SLUG}/ui-changes/. .

# Update title in index.html
sed -i "s/<title>.*<\/title>/<title>${PROTOCOL_TITLE}<\/title>/" public/index.html

# Install dependencies and build
npm install --silent
npm run build

cd ..
echo "✓ Built $PROTOCOL_SLUG"