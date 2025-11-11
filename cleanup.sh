#!/bin/bash
# cleanup.sh – deletes the local and remote branch used in the demo

BRANCH_TO_DELETE="CU-86c6e3bk2_FEAT-110-Accessibility-Enhancements_John-Tomkins"

echo "Cleaning up branch: $BRANCH_TO_DELETE"

# Switch to main
git checkout main || exit 1
git pull

# Delete local branch
git branch -D "$BRANCH_TO_DELETE" 2>/dev/null || echo "Local branch not found or already deleted."

# Delete remote branch
git push origin --delete "$BRANCH_TO_DELETE" 2>/dev/null || echo "Remote branch not found or already deleted."

echo "Cleanup complete."
