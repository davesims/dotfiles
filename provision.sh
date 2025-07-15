#!/bin/bash

# Modern macOS Development Environment Setup
# This script sets up a modern development environment using Homebrew and asdf

set -e  # Exit on error

echo "🚀 Starting modern macOS development environment setup..."

# Install Homebrew if not already installed
if ! command -v brew &> /dev/null; then
    echo "📦 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "✅ Homebrew already installed"
fi

# Update Homebrew
echo "🔄 Updating Homebrew..."
brew update

# Install packages from Brewfile
echo "📦 Installing packages from Brewfile..."
brew bundle --file=~/bin/dotfiles/Brewfile

# Install Oh My Zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "🐚 Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "✅ Oh My Zsh already installed"
fi

# Install asdf plugins and set up version management
echo "🔧 Setting up asdf version management..."

# Add asdf plugins
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git 2>/dev/null || true
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git 2>/dev/null || true
asdf plugin add python https://github.com/asdf-vm/asdf-python.git 2>/dev/null || true
asdf plugin add terraform https://github.com/asdf-community/asdf-terraform.git 2>/dev/null || true

# Install latest versions
echo "📚 Installing latest language versions..."
asdf install nodejs latest
asdf install ruby latest
asdf install python latest
asdf install terraform latest

# Set global versions
asdf global nodejs latest
asdf global ruby latest
asdf global python latest
asdf global terraform latest

# Install essential gems
echo "💎 Installing essential Ruby gems..."
gem install bundler rails puma-dev

# Install essential npm packages
echo "📦 Installing essential npm packages..."
npm install -g @anthropic-ai/claude-code typescript eslint prettier

# Install essential Python packages
echo "🐍 Installing essential Python packages..."
pip install --upgrade pip
pip install powerline-shell awscli aws-mfa

# Install Ollama for local AI models
echo "🤖 Installing Ollama for local AI models..."
if ! command -v ollama &> /dev/null; then
    curl -fsSL https://ollama.ai/install.sh | sh
    echo "✅ Ollama installed"
else
    echo "✅ Ollama already installed"
fi

# Download essential AI models
echo "📥 Downloading essential AI models..."
ollama pull codellama:7b
ollama pull gemma:7b
ollama pull mistral:7b

# Configure services
echo "🔧 Configuring services..."

# Start PostgreSQL
brew services start postgresql@15

# Start Redis
brew services start redis

# Start MySQL
brew services start mysql

# Set up MySQL user (if not exists)
mysql -u root -e "CREATE USER IF NOT EXISTS 'davesims'@'localhost';" 2>/dev/null || true
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'davesims'@'localhost';" 2>/dev/null || true

# Create AWS credentials structure
mkdir -p ~/.aws
if [ ! -f ~/.aws/credentials ]; then
    echo "☁️ Creating AWS credentials template..."
    cat > ~/.aws/credentials << 'EOL'
[default-long-term]
aws_access_key_id = YOUR_ACCESS_KEY_ID
aws_secret_access_key = YOUR_SECRET_ACCESS_KEY
EOL
fi

if [ ! -f ~/.aws/config ]; then
    echo "☁️ Creating AWS config..."
    cat > ~/.aws/config << 'EOL'
[default]
region = us-west-2
output = json
EOL
fi

# Set up zsh enhancements
echo "🐚 Setting up modern shell enhancements..."

# Create .zshrc additions for modern tools
cat >> ~/.zshrc << 'EOL'

# Modern shell enhancements
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

if command -v zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
fi

if command -v direnv &> /dev/null; then
    eval "$(direnv hook zsh)"
fi

# Modern aliases
if command -v eza &> /dev/null; then
    alias ls="eza --icons"
    alias ll="eza -la --icons"
    alias lt="eza --tree --icons"
fi

if command -v bat &> /dev/null; then
    alias cat="bat"
fi

if command -v fd &> /dev/null; then
    alias find="fd"
fi

if command -v rg &> /dev/null; then
    alias grep="rg"
fi

EOL

# Set up FZF integration
echo "🔍 Setting up FZF integration..."
$(brew --prefix)/opt/fzf/install --all --no-bash --no-fish

# Create .tool-versions file
echo "📋 Creating .tool-versions file..."
cat > ~/bin/dotfiles/.tool-versions << 'EOL'
nodejs 22.11.0
ruby 3.3.0
python 3.12.0
terraform 1.9.0
EOL

# Install tmux plugin manager
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "📺 Installing tmux plugin manager..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "✅ Modern development environment setup complete!"
echo ""
echo "Next steps:"
echo "1. Run './bootstrap' to symlink configuration files"
echo "2. Restart your terminal or run 'source ~/.zshrc'"
echo "3. Open Neovim and run ':Lazy sync' to install plugins"
echo "4. In tmux, press prefix + I to install tmux plugins"
echo "5. Configure your AWS credentials in ~/.aws/credentials"
echo "6. Set up AI integrations:"
echo "   - Ollama models are already downloaded and ready"
echo "   - Add GEMINI_API_KEY to local/local_env for Gemini integration"
echo "   - Claude Code works with your existing CLI setup"
echo ""
echo "🎉 Happy coding with AI assistance!"