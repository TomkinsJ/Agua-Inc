#!/bin/bash
# Usage: ./cleanup.sh <branch-name>
# Example: ./cleanup.sh CU-86c6e3bk2_FEAT-110-Accessibility-Enhancements_John-Tomkins

BRANCH_TO_DELETE="$1"

if [ -z "$BRANCH_TO_DELETE" ]; then
  echo "Usage: ./cleanup.sh <branch-name>"
  exit 1
fi

echo "Cleaning up branch: $BRANCH_TO_DELETE"

# Switch to main branch
git checkout main || exit 1
git pull

# Delete local branch
git branch -D "$BRANCH_TO_DELETE" 2>/dev/null || echo "Local branch not found or already deleted."

# Delete remote branch
git push origin --delete "$BRANCH_TO_DELETE" 2>/dev/null || echo "Remote branch not found or already deleted."

echo "Cleanup complete."
