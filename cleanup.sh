#!/bin/bash
set -e
BRANCH_TO_DELETE="CU-86c6e3bk2_FEAT-110-Accessibility-Enhancements_John-Tomkins"

echo "== Cleanup $BRANCH_TO_DELETE =="
git checkout main
git pull
git branch -D "$BRANCH_TO_DELETE" 2>/dev/null || echo "Local branch already gone."
git push origin --delete "$BRANCH_TO_DELETE" 2>/dev/null || echo "Remote branch already gone."
echo "== Done =="
