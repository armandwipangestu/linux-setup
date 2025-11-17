#!/bin/bash

DOTFILES=(
    ".zshrc" ".aliases" ".autostart" ".tmux.conf"
)

function installDotfiles() {
    for DOTFILE in "${DOTFILES[@]}"; do
        if [ ! -d ~/.local/bin ]; then
          mkdir -p ~/.local/bin
          sudo ln -s /usr/bin/batcat ~/.local/bin/bat
        else
          sudo ln -s /usr/bin/batcat ~/.local/bin/bat
        fi

        log "script" "INFO" "Copying '$(pwd)/${DOTFILE}' to '${HOME}'"
        cp $(pwd)/"${DOTFILE}" "$HOME"
    done
}

function utility() {
  if [ ! -d ~/.config ]; then
    mkdir ~/.config
  fi

  #cp -R $(pwd)/.config/neofetch ~/.config/
  touch $HOME/.hushlogin
}
