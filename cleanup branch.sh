# cleanup.sh BRANCH_NAME
BRANCH_TO_DELETE="CU-86c6e3bk2_FEAT-110-Accessibility-Enhancements_John-Tomkins"
git checkout main
git pull
git branch -D "$BRANCH_TO_DELETE"        # delete local branch
git push origin --delete "$BRANCH_TO_DELETE"  # delete remote branch
