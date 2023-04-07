#!/bin/bash

if [ "$(uname)" == 'Darwin' ]; then
    # Show invisible files. Need to restart OS
    defaults write com.apple.finder AppleShowAllFiles TRUE

    # Install Command Line Tools
    xcode-select --install
fi

# Create links
dotfiles_path=$(cd $(dirname $0) && pwd)
if [ ! -d ~/.config ]; then
    mkdir  ~/.config
fi

ln -sfn ${dotfiles_path}/fish ~/.config/fish
ln -sfn ${dotfiles_path}/zsh/.zshrc ~/.zshrc
ln -sfn ${dotfiles_path}/zsh/.zshenv ~/.zshenv
ln -sfn ${dotfiles_path}/.alias ~/.alias
ln -sfn ${dotfiles_path}/.Brewfile ~/.Brewfile
ln -sfn ${dotfiles_path}/.gitconfig ~/.gitconfig
ln -sfn ${dotfiles_path}/.gitignore ~/.gitignore

# Homebrew
if [ "$(uname)" == 'Linux' ]; then
    sudo apt-get install build-essential curl file git
    export PATH="/home/linuxbrew/.linuxbrew/sbin:/home/linuxbrew/.linuxbrew/bin:$PATH"
fi
which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
which brew >/dev/null 2>&1 && brew doctor
which brew >/dev/null 2>&1 && brew update --verbose
which brew >/dev/null 2>&1 && brew bundle --global --verbose

# fish
which fish >/dev/null 2>&1 && fish fish.fish
