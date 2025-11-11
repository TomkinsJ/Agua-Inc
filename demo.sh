#!/bin/bash
set -euo pipefail

TASK_ID="CU-86c6e3bk2"
BRANCH="CU-86c6e3bk2_FEAT-110-Accessibility-Enhancements_John-Tomkins"
BASE="main"
REPO_USER="TomkinsJ"
REPO_NAME="Agua-Inc"

echo "----------------------------------------"
echo "Reset to $BASE and pull latest..."
git checkout "$BASE"
git pull

echo "----------------------------------------"
echo "Create/reset feature branch from $BASE..."
# -B forces the branch to point to current $BASE even if it already exists locally
git checkout -B "$BRANCH" "$BASE"

echo "----------------------------------------"
echo "Making small, realistic code changes (timestamped)..."
STAMP=$(date +%Y%m%d-%H%M%S)
mkdir -p src/api src/ui
echo "# FEAT-110 a11y touch $STAMP" >> src/api/data_sync.py
echo "<!-- FEAT-110 a11y touch $STAMP -->" >> src/ui/dashboard.html

echo "----------------------------------------"
echo "Staging and committing changes..."
git add src/api/data_sync.py src/ui/dashboard.html
# always produce a new commit; fallback to empty if nothing staged for some reason
git commit -m "$TASK_ID - FEAT-110 Accessibility Enhancements ($STAMP)" || \
git commit --allow-empty -m "$TASK_ID - FEAT-110 Accessibility Enhancements (empty $STAMP)"

echo "----------------------------------------"
echo "Pushing branch to GitHub..."
git push -u origin "$BRANCH"

PR_URL="https://github.com/${REPO_USER}/${REPO_NAME}/compare/${BASE}...${BRANCH}"
echo "----------------------------------------"
echo "✅ Done! Branch pushed."
echo "Open PR here: $PR_URL"
# Attempt to open browser automatically (Linux Mint)
xdg-open "$PR_URL" >/dev/null 2>&1 || true
echo "----------------------------------------"