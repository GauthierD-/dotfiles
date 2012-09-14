#!/usr/bin/env bash

echo "initializing submodules"
git submodule init
git submodule update

echo "move old file in ~/oldDotfiles/"
mkdir ~/oldDotfiles
mv ~/.gitconfig ~/oldDotfiles/gitconfig
mv ~/.tmux.conf ~/oldDotfiles/tmux.conf
mv ~/.vim ~/oldDotfiles/vim
mv ~/.vimrc ~/oldDotfiles/vimrc
mv ~/.zshrc ~/oldDotfiles/zshrc

echo "Symlinking files"
ln -s ~/Github/dotfiles/gitconfig ~/.gitconfig
ln -s ~/Github/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/Github/dotfiles/vim ~/.vim
ln -s ~/Github/dotfiles/vimrc ~/.vimrc
ln -s ~/Github/dotfiles/zshrc ~/.zshrc

echo "Updating submodules"
git submodules foreach git pull origin master --recurse-submodules

echo "All done. Biatch!"
