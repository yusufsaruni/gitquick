# gitquick

A small **zsh helper script** to speed up common git operations:  
`git add`, `git commit`, and `git push` — all in one command.

---

## 📦 Installation & Usage Guide

```bash
## Clone the repo
git clone https://github.com/yusufsaruni/gitquick.git
cd gitquick

## Make the script executable
chmod +x gitquick.zsh

## Add alias in ~/.zshrc
echo 'alias gitquick="$HOME/gitquick/gitquick.zsh"' >> ~/.zshrc

## Reload shell
source ~/.zshrc

## --- USAGE EXAMPLES ---

## 1. Commit all changes to the current branch
gitquick "Refactor controllers"

## 2. Commit specific files to the current branch
gitquick "Fix login bug" src/Login.java config/

## 3. Commit to a specific branch
gitquick "Hotfix deployment" hotfix-1.0 src/Server.java

