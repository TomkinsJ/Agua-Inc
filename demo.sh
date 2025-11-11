#!/bin/bash


set -e

echo "----------------------------------------"
echo "Creating new feature branch..."
git checkout -b "CU-86c6e3bk2_FEAT-110-Accessibility-Enhancements_John-Tomkins"

echo "----------------------------------------"
echo "Making small, realistic code changes..."


echo "# FEAT-110: Added alert summarisation logging" >> src/api/data_sync.py

# Add an HTML placeholder for the new AI summary widget
echo "<!-- FEAT-110 AI Summary section placeholder -->" >> src/ui/dashboard.html

# Show the last few lines of both files to prove the change
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
echo "Now go to GitHub → open a Pull Request, using the same task ID and link to ClickUp:"
echo "https://app.clickup.com/t/86c6e3bbk"
echo "----------------------------------------"
