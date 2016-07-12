#!/bin/bash

#
# Linux Shell Environment Configuration
#

# make symlinks to .dotfiles

dotfiles=(".zshrc" ".vimrc" ".tmux.conf")

for dotfile in "${dotfiles[@]}"
do
    ln -sf ${PWD}/${dotfile} ${HOME}/${dotfile}
    echo "${dotfile} symlink created"
done

# install zsh and others

sudo apt-get -yqq install zsh tmux autojump htop vim curl

# change default shell to zsh if it is not already set

[ ${SHELL} != "/bin/zsh" ] && sudo chsh -s /bin/zsh

# install ohmyzsh if needed

[ ! -d "${HOME}/.oh-my-zsh" ] && sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" 

    
ln -sf ${PWD}/.oh-my-zsh/lib/alias.zsh ${HOME}/.oh-my-zsh/lib/

# install Vundle

[ ! -r "${HOME}/.vim/bundle/Vundle.vim" ] && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

source ${HOME}/.zshrc

echo "Done"
