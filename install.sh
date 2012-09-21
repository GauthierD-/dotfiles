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
ln -s gitconfig ~/.gitconfig
ln -s tmux.conf ~/.tmux.conf
ln -s vim ~/.vim
ln -s vimrc ~/.vimrc
ln -s zshrc ~/.zshrc

echo "Updating submodules"
git submodule foreach git pull origin master --recurse-submodules

echo "All done. Biatch!"
