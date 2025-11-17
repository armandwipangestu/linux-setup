#!/bin/bash

NVCHAD_DEPENDENCY_PACKAGES=(
    gcc
)

function installNvChad() {
    log "script" "INFO" "Installing neovim with snap"
    sudo snap install nvim --classic

    for ((i = 0; i < ${#NVCHAD_DEPENDENCY_PACKAGES[@]}; i++)); do
        log "script" "INFO" "Installing dependency package '${NVCHAD_DEPENDENCY_PACKAGES[i]}'"
        sudo apt-get install "${NVCHAD_DEPENDENCY_PACKAGES[i]}" -y
    done

    log "script" "INFO" "Cloning 'https://github.com/NvChad/starter' to '~/.config/nvim'"
    git clone https://github.com/NvChad/starter ~/.config/nvim
    nvim
}
