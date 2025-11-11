#!/bin/bash

# Fail fast if something goes wrong
set -e

echo "----------------------------------------"
echo "Creating new feature branch..."
git checkout -b "CU-86c6e3bk2_FEAT-110-Accessibility-Enhancements_John-Tomkins"

echo "----------------------------------------"
echo "Developer making code changes..."
echo "# changes" >> src/api/data_sync.py
echo "<!-- changes -->" >> src/ui/dashboard.html


tail -n 3 src/api/data_sync.py
tail -n 3 src/ui/dashboard.html

echo "----------------------------------------"
echo "Staging and committing changes..."
git add src/api/data_sync.py src/ui/dashboard.html

git commit -m "CU-86c6e3bk2 - FEAT-110 Accessibility Enhancements"

echo "----------------------------------------"
echo "Pushing branch to GitHub..."
git push -u origin "CU-86c6e3bk2_FEAT-110-Accessibility-Enhancements_John-Tomkins"

echo "----------------------------------------"
echo "✅ Done! Branch pushed successfully."
echo "----------------------------------------"
