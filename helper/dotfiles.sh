#!/bin/bash

DOTFILES=(
    ".zshrc" ".aliases" ".tmux.conf"
)

function installDotfiles() {
    for DOTFILE in "${DOTFILES[@]}"; do
        if [ ! -d ~/.local/bin ]; then
          mkdir -p ~/.local/bin
          sudo ln -s /usr/bin/batcat ~/.local/bin/bat
        else
          sudo ln -s /usr/bin/batcat ~/.local/bin/bat
        fi

        echo -e "\nCopy: $(pwd)/""${DOTFILE}"" > ""${HOME}""\n"
        cp $(pwd)/"${DOTFILE}" "$HOME"
    done
}

function utility() {
  if [ ! -d ~/.config ]; then
    mkdir ~/.config
  fi

  cp -R $(pwd)/.config/neofetch ~/.config/
  touch $HOME/.hushlogin
}
