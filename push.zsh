#!/bin/zsh

# Script: gitquick.zsh
# Usage:
#   ./gitquick.zsh <commit_message> [branch_name] [file1 file2 ... fileN]
#
# - If branch_name is not provided → use current branch
# - If no files are provided → stage all changes (git add .)

if [ $# -lt 1 ]; then
  echo "Usage: $0 <commit_message> [branch_name] [file1 file2 ... fileN]"
  exit 1
fi

COMMIT_MSG=$1
shift 1  # remove commit message

# Check if inside a git repo
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "❌ Not inside a Git repository."
  exit 1
fi

# Determine branch
if [ $# -gt 0 ] && git show-ref --verify --quiet "refs/heads/$1"; then
  BRANCH=$1
  shift 1
else
  BRANCH=$(git rev-parse --abbrev-ref HEAD)
  echo "ℹ️ No branch provided → using current branch: $BRANCH"
fi

# Stage changes
if [ $# -eq 0 ]; then
  git add .
  echo "✅ Staged all changes"
else
  for FILE_PATH in "$@"; do
    if [ -f "$FILE_PATH" ] || [ -d "$FILE_PATH" ]; then
      git add "$FILE_PATH"
      echo "✅ Staged: $FILE_PATH"
    else
      echo "⚠️ Skipping: '$FILE_PATH' not found"
    fi
  done
fi

# Commit
git commit -m "$COMMIT_MSG"
echo "✅ Commit created: $COMMIT_MSG"

# Push
git push origin "$BRANCH"
echo "🚀 Changes pushed to branch: $BRANCH"

