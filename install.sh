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
ln -s -i gitconfig ~/.gitconfig
ln -s -s tmux.conf ~/.tmux.conf
cp -r vim ~/ && mv ~/vim ~/.vim
ln -s -i vimrc ~/.vimrc
ln -s -i zshrc ~/.zshrc

echo "Updating submodules"
git submodule foreach git pull origin master --recurse-submodules

echo "All done. Biatch!"
