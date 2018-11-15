brew install python3
pip3 install powerline-shell
brew install tmux
brew install zsh zsh-completions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
brew install rbenv
rbenv init
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
rbenv install 2.5.1
rbenv global 2.5.1
rbenv rehash
rbenv exec gem install tmuxinator
tmuxinator doctor
pip3 install pgcli
curl -s -L https://raw.github.com/guedes/pgvm/master/bin/pgvm-self-install | bash
brew install tig

