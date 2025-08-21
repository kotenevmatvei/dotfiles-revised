#!/bin/zsh

cd "/Users/matveikotenev/Documents/obsidian"

if [[ -z $(git status --porcelain) ]]; then
  exit 0
fi

echo "Changes detected, running autopush..."
git add .

git commit -m "Obsidian vault auto-commit: $(date '+%Y-%m-%d %H:%M:%S')"

git push

