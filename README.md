# gitquick

A small **zsh helper script** to speed up common git operations:  
`git add`, `git commit`, and `git push` — all in one command.

---

## 📦 Installation

1. Clone the repo:
   ```bash
   git clone https://github.com/yusufsaruni/gitquick.git
   cd gitquick
Make the script executable:

bash
Copy code
chmod +x gitquick.zsh
Add an alias in your ~/.zshrc (or ~/.bashrc if you use bash):

bash
Copy code
alias gitquick="$HOME/gitquick/gitquick.zsh"
Reload your shell:

bash
Copy code
source ~/.zshrc
🚀 Usage
1. Commit all changes to the current branch
bash
Copy code
gitquick "Refactor controllers"
2. Commit specific files to the current branch
bash
Copy code
gitquick "Fix login bug" src/Login.java config/
3. Commit to a specific branch
bash
Copy code
gitquick "Hotfix deployment" hotfix-1.0 src/Server.java
⚙️ Behavior
If no files are provided → git add . (stage everything).

If no branch is provided → uses the current branch.

Always runs:

git add

git commit -m "message"

git push origin branch

📝 Example session
bash
Copy code
# Stage all, commit and push to current branch
gitquick "Update README"

# Stage specific files, commit and push to main
gitquick "Fix typo" main README.md
🛠 Notes
Requires zsh.

Works best with the alias setup shown above.

For a cleaner setup, you can also rename the script to gitquick, put it in ~/bin or ~/.local/bin, and skip the alias.
