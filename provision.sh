# First, homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/davidsims/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Basic installation dependencies, python & pip
brew update
brew install python3
pip3 install powerline-shell
brew install pyenv
# tmux & zsh
brew install tmux
brew install zsh zsh-completions
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# ruby, rails & rbenv stuff
sudo asdf install ruby latest
gem install rails
brew install puma/puma/puma-dev
# imagemagick...still
brew install imagemagick

# doppler
brew install gnupg
brew install dopplerhq/cli/doppler

# heroku
brew tap heroku/brew && brew install heroku

# gecko 
brew install geckodriver

# tmuxinator 
brew install tmuxinator
tmuxinator doctor

# postgres
brew install postgres
brew services start postgresql

# mysql 
brew install mysql
brew install mycli
brew services start mysql  
mysql -u root -e "CREATE USER 'davesims'@'localhost'"
mysql -u root -e "GRANT ALL PRIVILEGES ON * . * TO 'davesims'@'localhost';"

# pgcli & pgvm
brew install pgcli
curl -s -L https://raw.github.com/guedes/pgvm/master/bin/pgvm-self-install | bash

# redis
brew install redis
brew services start redis

# frameworks
brew install yarn
brew install node@16
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
nvm install node
npm -g install typescript

# general tooling
brew install htop
brew install tig
brew install watch
brew install the_silver_searcher
brew install asdf
brew install wget
brew install urlencode
brew install tmate
brew install chamber
brew install jq
brew install w3m


# AWS stuff
pip3 install awscli --upgrade --user
curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-07-26/bin/darwin/amd64/aws-iam-authenticator
chmod +x ./aws-iam-authenticator
mv aws-iam-authenticator /usr/local/bin

## Install aws-mfa
pip3 install aws-mfa
mkdir ~/.aws/ 2>/dev/null 
## https://console.aws.amazon.com/iam/home?#/security_credentials
cat <<EOT >> ~/.aws/credentials
[default-long-term]
aws_access_key_id = XXXXXXXXXXXXX
aws_secret_access_key = xxxxxxxxxxxxx
EOT

cat <<EOT >> ~/.aws/config
[default]
region = eu-west-1
EOT

# export MFA_DEVICE=arn:aws:iam::<account_id>:mfa/<iam_username> 
export PATH="$PATH:$HOME/.local/bin"  # Add aws-mfa binary to path
export PATH="$PATH:$HOME/Library/Python/3.8/bin" # if installed with Python 3 

# Terragrunt
brew install terragrunt

# Terraform
brew tap hashicorp/tap
brew install hashicorp/tap/terraform

# Flux
brew install fluxcd/tap/flux

# k8s stuff
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl"
brew install kubernetes-cli
brew install kind

# AWS
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip -a awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
rm -rf awscli-bundle
rm -f awscli-bundle.zip

# Java & friends
brew install sbt
brew install gradle
curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | bash && . ~/.jabba/jabba.sh
brew install flyway 
