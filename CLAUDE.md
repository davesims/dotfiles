# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository containing shell configurations, editor settings, and development environment setup scripts for macOS. The repository is organized into directories by tool/service and uses symbolic linking to manage configuration files.

## Key Commands

### Initial Setup
- `./bootstrap` - Main setup script that creates symbolic links for all configuration files
- `./bootstrap --provision` - Runs the bootstrap script with initial system provisioning
- `./provision.sh` - Installs development tools and dependencies via Homebrew

### Development Tools & Aliases
Common aliases are defined in `zsh/aliases`:
- `reload` - Reloads zsh configuration
- `dotfiles` - Opens the dotfiles directory in vim
- `takeover` - Detaches all other tmux sessions
- `mux` - Shorthand for tmux
- `k` - Alias for kubectl
- `be` - Bundle exec for Ruby projects
- `ae` - asdf exec for version management

### Tmux Session Management
Tmuxinator configurations are available in `tmux/tmuxinator/` for various projects:
- `tmuxinator dotfiles` - Opens dotfiles session
- `tmuxinator hopin` - Project-specific session
- Other project sessions available in tmux/tmuxinator/*.yml

## Architecture & Structure

### Directory Organization
- `bootstrap` - Main setup script
- `provision.sh` - System provisioning with Homebrew
- `zsh/` - ZSH configuration, aliases, and custom scripts
- `tmux/` - Tmux configuration and session templates
- `nvim/` - Neovim configuration using AstroNvim
- `git/` - Git configuration and global ignore patterns
- `ruby/` - Ruby-specific configuration (pryrc, irbrc, gemrc)
- `ssh/` - SSH configuration
- `local/` - Local, non-versioned configuration overrides

### Configuration Management
- All configurations are symlinked from `~/bin/dotfiles/` to their expected locations
- Local overrides are stored in `local/` directory (local_aliases, local_env, local_scripts)
- The system uses Oh My Zsh with extensive plugins for development workflow

### Development Environment
- Uses `asdf` for version management of multiple languages
- Configured for Ruby (rbenv), Node.js (nvm), Python (pyenv) development
- Includes Docker, Kubernetes, AWS CLI, and other DevOps tools
- Tmux configured with custom powerline-style status bar and vim-like navigation

### Editor Configuration
- Neovim setup based on AstroNvim template
- Configuration in `nvim/lua/plugins/` for various plugins
- Includes LSP, treesitter, and other modern development features

## Important Notes

- Run `source ~/.zshrc` or `reload` after making changes to shell configuration
- The `bootstrap` script is idempotent and can be run multiple times
- Local customizations should go in `local/` directory files to avoid conflicts
- Tmux configuration includes battery status and system info in status bar
- SSH config and other sensitive files are managed but not committed to version control