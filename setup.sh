#!/bin/sh

#
# Linux Shell Environment Configuration
#

# install zsh and others

sudo apt-get install zsh tmux autojump htop vim curl

# change default shell to zsh if it is not already set

[ ${SHELL} != "/bin/zsh" ] && sudo chsh -s /bin/zsh

# install ohmyzsh if needed

[ ! -d "${HOME}/.oh-my-zsh" ] && sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# install Vundle

[ ! -r "${HOME}/.vim/bundle/Vundle.vim" ] &&  $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

echo "Done"
