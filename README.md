# Modern macOS Development Environment

Personal dotfiles for macOS development with modern tools and efficient workflows.

## Quick Start

```bash
git clone <your-repo-url> ~/bin/dotfiles
cd ~/bin/dotfiles
./bootstrap --provision
```

## What's Included

- **Shell**: ZSH with Oh My Zsh and Starship prompt
- **Editor**: Neovim with AstroNvim and LSP support
- **Languages**: Node.js 22.11.0, Ruby 3.3.0, Python 3.12.0, Terraform 1.9.0
- **Tools**: Docker, kubectl, AWS CLI, PostgreSQL, Redis, MySQL
- **Modern CLI**: ripgrep, fd, bat, eza, zoxide, fzf

## Usage

```bash
# Full setup with packages
./bootstrap --provision

# Just symlink configs
./bootstrap

# Update packages
brew bundle --file=Brewfile
```

## Key Features

- **Brewfile** for declarative package management
- **asdf** for language version management
- **Modern CLI replacements** with better UX
- **Comprehensive LSP** setup for development
- **Local overrides** in `local/` directory

## Customization

- **Packages**: Edit `Brewfile`
- **Languages**: Update `.tool-versions`
- **Neovim**: Add plugins to `nvim/lua/plugins/user.lua`
- **Shell**: Add aliases to `zsh/aliases`
- **Local**: Use `local/local_*` files for personal configs

## Troubleshooting

**Command not found**: Run `source ~/.zshrc` or restart terminal  
**Docker issues**: Remove conflicting completions with `rm -f /opt/homebrew/etc/bash_completion.d/docker*`  
**MySQL errors**: Restart with `brew services restart mysql`

---

For detailed configuration and advanced usage, see the project wiki.