#!/bin/bash

# Show invisible files. Need to restart OS
defaults write com.apple.finder AppleShowAllFiles TRUE

# Install Command Line Tools
xcode-select --install

# Create links
dotfiles_path=$(cd $(dirname $0) && pwd)
ln -sfn ${dotfiles_path}/fish ~/.config/fish
ln -sfn ${dotfiles_path}/.alias ~/.alias
ln -sfn ${dotfiles_path}/.Brewfile ~/.Brewfile
ln -sfn ${dotfiles_path}/.gitconfig ~/.gitconfig
ln -sfn ${dotfiles_path}/.gitignore ~/.gitignore

# Homebrew
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
which brew >/dev/null 2>&1 && brew doctor
which brew >/dev/null 2>&1 && brew update --verbose
which brew >/dev/null 2>&1 && brew bundle --global --verbose

# fish
which fish >/dev/null 2>&1 && fish fish.fish