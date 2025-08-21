#!/bin/zsh

# Navigate to the script's directory to ensure git commands run in the correct repository
# This is crucial for the script to find the .git directory of your vault.
cd "$(dirname "$0")"

# Check if there are any changes to commit.
# The 'git status --porcelain' command outputs a list of modified files.
# If the output is empty, it means there are no changes.
if [[ -z $(git status --porcelain) ]]; then
  # No changes detected, so we exit quietly.
  exit 0
fi

# If there are changes, proceed to stage them.
echo "Changes detected, running autopush..."
git add .

# Commit with a message including the current date and time.
git commit -m "Obsidian vault auto-commit: $(date '+%Y-%m-%d %H:%M:%S')"

# Push the changes to the remote repository.
git push

