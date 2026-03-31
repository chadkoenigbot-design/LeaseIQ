#!/bin/zsh
set -e
cd ~/Desktop/LeaseIQ2
if [ ! -d .git ]; then
  echo "This folder is not initialized as a git repo yet."
  exit 1
fi

git add .
if git diff --cached --quiet; then
  echo "No changes to publish."
  read -k 1 '?Press any key to close...'
  echo
  exit 0
fi

MSG="Update LeaseIQ site $(date '+%Y-%m-%d %H:%M:%S')"
git commit -m "$MSG"
echo
echo "Pushing to GitHub..."
git push -u origin main

echo
echo "Published. GitHub Pages should update shortly."
echo "Site: https://chadkoenigbot-design.github.io/LeaseIQ/"
read -k 1 '?Press any key to close...'
echo
