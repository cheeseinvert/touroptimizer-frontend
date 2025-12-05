#!/bin/bash
# inject-git-hash.sh
# Vercel runs this at build time with git env vars available

echo "🔧 Injecting git hash into index.html..."

# Vercel provides these environment variables automatically
GIT_SHA=${VERCEL_GIT_COMMIT_SHA:-"unknown"}
GIT_REF=${VERCEL_GIT_COMMIT_REF:-"main"}

echo "Git SHA: $GIT_SHA"
echo "Git Ref: $GIT_REF"

# Replace placeholders in index.html
sed -i "s/__VERCEL_GIT_COMMIT_SHA__/${GIT_SHA}/g" index.html
sed -i "s/__VERCEL_GIT_COMMIT_REF__/${GIT_REF}/g" index.html

echo "✅ Git hash injected successfully!"
