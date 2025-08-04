# AI Commands

My set of AI commands, primarily designed for Claude Code integration.

## Available Commands

### Git Workflow Commands

#### `/1-commit` - Git Commit
Creates new git commits with enhanced commit messages using the git-commit-enhancer agent.

- **Default behavior**: Requires staged changes before creating commit
- **With `--auto` flag**: Automatically stages appropriate files using `git add`, then prompts for confirmation

#### `/3-amend` - Git Commit Amend  
Improves the message of the most recent git commit using the git-commit-enhancer agent.

- **Default behavior**: Only amends commit message when no changes are staged
- **With `--force` flag**: Allows amending even when changes are staged, incorporating them into the amended commit

## Installation

To make these commands available globally in Claude Code, create individual symlinks to your global Claude commands folder:

```fish
ln -sf (pwd)/claude/1-commit.md ~/.claude/commands/1-commit.md
ln -sf (pwd)/claude/3-amend.md ~/.claude/commands/3-amend.md
```

This approach allows you to selectively install commands and mix commands from different locations.