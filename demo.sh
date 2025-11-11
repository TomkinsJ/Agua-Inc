#!/bin/bash
# ============================================
# Demo script for ClickUp GitHub Integration
# Feature: FEAT-104 AI-Driven Alert Summariser
# Author: John Tomkins
# ============================================

# Fail fast if something goes wrong
set -e

echo "----------------------------------------"
echo "Creating new feature branch..."
git checkout -b "CU-86c6e3bbk_FEAT-104-AI-Driven-Alert-Summariser_John-Tomkins"

echo "----------------------------------------"
echo "Making small, realistic code changes..."

# Append a small log message to an API file
echo "# FEAT-104: Added alert summarisation logging" >> src/api/data_sync.py

# Add an HTML placeholder for the new AI summary widget
echo "<!-- FEAT-104 AI Summary section placeholder -->" >> src/ui/dashboard.html

# Show the last few lines of both files to prove the change
tail -n 3 src/api/data_sync.py
tail -n 3 src/ui/dashboard.html

echo "----------------------------------------"
echo "Staging and committing changes..."
git add src/api/data_sync.py src/ui/dashboard.html

git commit -m "CU-86c6e3bbk - FEAT-104 AI-Driven Alert Summariser"

echo "----------------------------------------"
echo "Pushing branch to GitHub..."
git push -u origin "CU-86c6e3bbk_FEAT-104-AI-Driven-Alert-Summariser_John-Tomkins"

echo "----------------------------------------"
echo "✅ Done! Branch pushed successfully."
echo "Now go to GitHub → open a Pull Request, using the same task ID and link to ClickUp:"
echo "https://app.clickup.com/t/86c6e3bbk"
echo "----------------------------------------"
