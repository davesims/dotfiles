# Modern macOS Development Environment

A comprehensive dotfiles setup for macOS development with modern tools, efficient workflows, and powerful configurations.

## 🚀 Quick Start

```bash
# Clone the repository
git clone <your-repo-url> ~/bin/dotfiles
cd ~/bin/dotfiles

# Full setup with provisioning
./bootstrap --provision

# Or just symlink configs (if already provisioned)
./bootstrap
```

## 📦 What's Included

### Core Tools & Languages
- **Shell**: ZSH with Oh My Zsh and Starship prompt
- **Editor**: Neovim with AstroNvim configuration
- **Terminal**: iTerm2 with Tmux session management
- **Version Management**: asdf for Node.js, Ruby, Python, Terraform
- **Package Management**: Homebrew with Brewfile

### Modern CLI Replacements
- `ripgrep` (better grep)
- `fd` (better find)
- `bat` (better cat)
- `eza` (better ls)
- `zoxide` (smart cd)
- `fzf` (fuzzy finder)
- `starship` (modern prompt)

### Development Tools
- **Languages**: Node.js 22.11.0, Ruby 3.3.0, Python 3.12.0, Terraform 1.9.0
- **Databases**: PostgreSQL 15, Redis, MySQL
- **Cloud**: AWS CLI, kubectl, Helm, Terraform, Terragrunt
- **Containers**: Docker, Docker Compose, Kind
- **Git**: Enhanced with Fugitive and custom aliases

## 🛠 Installation

### Prerequisites
- macOS (tested on macOS 13+)
- Xcode Command Line Tools: `xcode-select --install`

### Setup Process

1. **Clone and setup**:
   ```bash
   git clone <your-repo-url> ~/bin/dotfiles
   cd ~/bin/dotfiles
   chmod +x bootstrap
   ./bootstrap --provision
   ```

2. **Reload shell**:
   ```bash
   source ~/.zshrc
   ```

3. **Configure Neovim**:
   ```bash
   nvim
   # Run :Lazy sync to install plugins
   ```

4. **Setup tmux plugins**:
   ```bash
   # In tmux: prefix + I
   ```

## 📁 Directory Structure

```
~/bin/dotfiles/
├── bootstrap           # Main setup script
├── provision.sh        # Package installation
├── Brewfile            # Homebrew packages
├── .tool-versions       # asdf version specifications
├── README.md           # This file
├── git/                # Git configuration
├── nvim/               # Neovim configuration (AstroNvim)
├── tmux/               # Tmux and tmuxinator configs
├── zsh/                # Shell configuration
├── ruby/               # Ruby-specific configs
├── starship/           # Starship prompt config
└── local/              # Local overrides (not tracked)
```

## 🔧 Configuration

### Shell Features
- **Starship prompt** with Git, language, and cloud info
- **Modern aliases** for common commands
- **Kubernetes utilities** (klog, kshell, kenv)
- **Git enhancements** with custom aliases
- **Directory navigation** with zoxide

### Neovim Features
- **AstroNvim** base configuration
- **LSP servers** for major languages
- **Formatters & linters** via Mason
- **Claude Code integration** for AI assistance
- **Modern plugins**: Trouble, Spectre, Fugitive

### Key Aliases
```bash
# Modern replacements
ls → eza --icons
cat → bat
grep → ripgrep
find → fd

# Development shortcuts
k → kubectl
be → bundle exec
ae → asdf exec
mux → tmux
reload → source ~/.zshrc
```

## 🎯 Keybindings

### Neovim
- `<C-,>` - Toggle Claude Code
- `<leader>xx` - Open Trouble diagnostics
- `<leader>S` - Toggle Spectre (search/replace)

### Tmux
- `prefix + I` - Install plugins
- `prefix + r` - Reload config

## 🗂 Customization

### Local Overrides
Add personal configurations without affecting version control:

```bash
# Local environment variables
~/bin/dotfiles/local/local_env

# Local aliases
~/bin/dotfiles/local/local_aliases

# Local scripts
~/bin/dotfiles/local/local_scripts
```

### Adding New Tools
1. **Homebrew packages**: Add to `Brewfile`
2. **Language versions**: Update `.tool-versions`
3. **Neovim plugins**: Add to `nvim/lua/plugins/user.lua`
4. **Shell aliases**: Add to `zsh/aliases`

## 🔄 Updating

```bash
# Update Homebrew packages
brew bundle --file=~/bin/dotfiles/Brewfile

# Update language versions
asdf install

# Update Neovim plugins
nvim -c "Lazy sync"
```

## 🚨 Troubleshooting

### Common Issues

**Command not found after install**:
```bash
source ~/.zshrc
# or restart terminal
```

**Docker installation fails**:
```bash
# Remove conflicting completions
rm -f /opt/homebrew/etc/bash_completion.d/docker*
brew install --cask docker
```

**MySQL service error**:
```bash
brew services stop mysql
brew services start mysql
```

**Missing kubectl**:
```bash
brew install kubernetes-cli
```

## 🏗 Architecture

### Package Management
- **Homebrew** for system packages and GUI applications
- **asdf** for language version management
- **npm/gem/pip** for language-specific packages

### Configuration Management
- **Symbolic links** for dotfiles
- **Modular organization** by tool/service
- **Local overrides** for non-versioned customizations

## 📊 Services

The setup automatically configures and starts:
- **PostgreSQL** (port 5432)
- **Redis** (port 6379)  
- **MySQL** (port 3306)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Test your changes with `./bootstrap --provision`
4. Submit a pull request

## 📄 License

This project is licensed under the MIT License.

## 🙏 Acknowledgments

- [AstroNvim](https://astronvim.com/) for the excellent Neovim configuration
- [Oh My Zsh](https://ohmyz.sh/) for the ZSH framework
- [Starship](https://starship.rs/) for the beautiful prompt
- [Homebrew](https://brew.sh/) for package management

---

**Happy coding!** 🎉

For issues or questions, please open an issue on GitHub.