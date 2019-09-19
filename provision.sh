# Basic installation dependencies, python & pip
brew install python3
pip3 install powerline-shell
# tmux & zsh
brew install tmux
brew install zsh zsh-completions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# ruby & rbenv stuff
brew install rbenv
rbenv init
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
rbenv install 2.5.1
rbenv global 2.5.1
rbenv rehash

# tmuxinator 
rbenv exec gem install tmuxinator
tmuxinator doctor

# postgres
brew install postgres
brew services start postgresql

# pgcli & pgvm
pip3 install pgcli
curl -s -L https://raw.github.com/guedes/pgvm/master/bin/pgvm-self-install | bash

# redis
brew install redis
brew services start redis

# frameworks
brew install yarn
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
nvm install node

# general tooling
brew install htop
brew install tig
brew install the_silver_searcher

# AWS stuff
pip3 install awscli --upgrade --user
curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-07-26/bin/darwin/amd64/aws-iam-authenticator
chmod +x ./aws-iam-authenticator
mv aws-iam-authenticator /usr/local/bin

# k8s stuff
brew install kubernetes-cli

# AWS
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
rm -rf awscli-bundle
rm -f awscli-bundle.zip
