#!/bin/bash
set -e

TASK_ID="CU-86c6e3bk2"
BRANCH="CU-86c6e3bk2_FEAT-110-Accessibility-Enhancements_John-Tomkins"
BASE="main"
STAMP=$(date +%Y%m%d-%H%M%S)

echo "== Resetting to $BASE and pulling latest =="
git checkout "$BASE"
git pull

echo "== (Re)creating branch $BRANCH =="

git checkout -B "$BRANCH"

echo "== Making a tiny, visible change =="
mkdir -p src/ui
echo "<!-- A11y tweak $STAMP -->" >> src/ui/dashboard.html
echo "# a11y audit $STAMP" >> src/ui/README_A11Y.md

git add src/ui/dashboard.html src/ui/README_A11Y.md


git commit -m "$TASK_ID: FEAT-110 Accessibility – demo change $STAMP" || \
git commit --allow-empty -m "$TASK_ID: FEAT-110 Accessibility – empty demo change $STAMP"

echo "== Pushing branch =="
git push -u origin "$BRANCH"

echo "DONE"
