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
cp gitconfig ~/.gitconfig
cp tmux.conf ~/.tmux.conf
cp vim ~/.vim
cp vimrc ~/.vimrc
cp -R zshrc ~/.zshrc

echo "Updating submodules"
git submodule foreach git pull origin master --recurse-submodules

echo "All done. Biatch!"
