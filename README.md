⚡ gitquick
A small zsh helper script to speed up common git operations: git add, git commit, and git push—all in one command.

📦 Installation
Clone the repo:

Bash

git clone https://github.com/yourusername/gitquick.git
cd gitquick
Make the script executable:

Bash

chmod +x gitquick.zsh
Add an alias in your ~/.zshrc (or ~/.bashrc if you use bash):

Bash

alias gitquick="$HOME/gitquick/gitquick.zsh"
Reload your shell:

Bash

source ~/.zshrc
🚀 Usage
Commit all changes to the current branch

Bash

gitquick "Refactor controllers"
Commit specific files to the current branch

Bash

gitquick "Fix login bug" src/Login.java config/
Commit to a specific branch

Bash

gitquick "Hotfix deployment" hotfix-1.0 src/Server.java
⚙️ Behavior
If no files are provided, the script runs git add . (stages everything).

If no branch is provided, it uses the current branch.

The script always runs:

git add

git commit -m "message"

git push origin branch

📝 Example Session
Bash

# Stage all, commit, and push to the current branch
gitquick "Update README"

# Stage specific files, commit, and push to main
gitquick "Fix typo" main README.md
🛠 Notes
Requires zsh.

Works best with the alias setup shown above.

For a cleaner setup, you can also rename the script to gitquick, put it in ~/bin or ~/.local/bin, and skip the alias.
