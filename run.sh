#!/usr/bin/env bash
set -euo pipefail
sudo apt-get update
sudo apt-get install -y git
WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT
cd "$WORK"
git init -q
git config user.name "DevOps Lab"
git config user.email "devops-lab@example.com"
echo "Version 1" > app.txt
git add app.txt
git commit -qm "Version 1"
echo "Version 2" > app.txt
git add app.txt
git commit -qm "Version 2"
echo "=== COMMIT HISTORY ==="
git log --oneline
git checkout HEAD~1 -- app.txt
echo "=== RESTORED FILE ==="
cat app.txt
git add app.txt
git commit -qm "Restore previous version"
echo "=== FINAL HISTORY ==="
git log --oneline
echo "RESULT: Version tracking and restoration completed"
