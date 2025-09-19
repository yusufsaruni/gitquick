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

# Check if inside a git repo, offer to initialize if not
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "⚠️  Not inside a Git repository."
  read "ANSWER?Do you want to initialize a new git repository here? (y/N): "
  if [[ "$ANSWER" =~ ^[Yy]$ ]]; then
    git init
    echo "✅ Initialized new git repository."
  else
    echo "🚫 Aborted. No repository was initialized."
    exit 1
  fi
fi



if ! git rev-parse --quiet --verify HEAD >/dev/null 2>&1; then
  git commit --allow-empty -m "Initial commit (auto)"
  echo "✅ Created initial empty commit to initialize HEAD"
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

HAS_COMMITS=$(git rev-parse --quiet --verify HEAD >/dev/null 2>&1; echo $?)
# Commit
git commit -m "$COMMIT_MSG"
echo "✅ Commit created: $COMMIT_MSG"

if [ $HAS_COMMITS -ne 0 ]; then
  git push -u origin "$BRANCH"
else
  git push origin "$BRANCH"
fi

echo "🚀 Changes pushed to branch: $BRANCH"

