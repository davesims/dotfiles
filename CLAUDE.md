# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a modern macOS dotfiles repository that sets up a comprehensive development environment using Homebrew, asdf version management, and modern CLI tools. The configuration emphasizes modern replacements for traditional Unix tools and integrates AI development capabilities.

## Development Commands

### Setup & Bootstrap
```bash
# Full environment setup (new machine)
./bootstrap --provision

# Just symlink configurations (existing setup)
./bootstrap

# Update all packages
brew bundle --file=Brewfile
```

### Package Management
```bash
# Install/update packages via Homebrew
brew bundle --file=Brewfile

# Language version management via asdf
asdf install nodejs latest
asdf install ruby latest
asdf install python latest
asdf install terraform latest
```

### Neovim Configuration
```bash
# Open Neovim and sync plugins
nvim
:Lazy sync

# Edit user plugins
nvim nvim/lua/plugins/user.lua
```

### Shell Configuration
```bash
# Reload shell configuration
source ~/.zshrc

# Edit aliases
vim zsh/aliases

# Edit local overrides (not tracked in git)
vim local/local_aliases
vim local/local_env
vim local/local_scripts
```

## Architecture & Structure

### Core Components

- **bootstrap**: Main setup script that symlinks all configuration files
- **provision.sh**: Comprehensive environment provisioning with packages and tools
- **Brewfile**: Declarative package management for Homebrew
- **.tool-versions**: Language version specifications for asdf

### Configuration Organization

- **nvim/**: Complete AstroNvim v5+ configuration with modern plugins
  - Claude Code integration via nvim plugin
  - Trouble.nvim for diagnostics
  - Modern search/replace with nvim-spectre
- **zsh/**: Shell configuration with aliases and environment setup
- **git/**: Git configuration and global gitignore
- **tmux/**: Terminal multiplexer with tmuxinator project templates
- **local/**: User-specific overrides (not version controlled)

### Language & Tool Management

Uses **asdf** for version management:
- Node.js 22.11.0
- Ruby 3.3.0  
- Python 3.12.0
- Terraform 1.9.0

### Modern CLI Replacements

The setup includes modern alternatives to traditional Unix tools:
- `ripgrep` (rg) → grep
- `fd` → find
- `bat` → cat
- `eza` → ls
- `zoxide` → cd
- `starship` → prompt

### AI Integration

- **Ollama**: Local AI model runner with pre-configured models (codellama, gemma, mistral)
- **Claude Code**: Integrated via Neovim plugin with keybindings
- **Gemini**: API integration support via environment variables

### Database Services

Auto-configured services via Homebrew:
- PostgreSQL 15
- Redis
- MySQL

### Key File Locations

- Shell config: `zshrc` (copied to ~/.zshrc)
- Neovim: `nvim/` (symlinked to ~/.config/nvim)
- Git config: `git/config` (symlinked to ~/.gitconfig)
- Local overrides: `local/local_*` files

## Development Workflow

1. Use `./bootstrap --provision` for initial setup
2. Language versions managed via asdf and `.tool-versions`
3. Package management via Brewfile
4. Local customizations go in `local/` directory
5. Neovim plugins managed via Lazy.nvim
6. Shell aliases and functions in `zsh/aliases`