#!/bin/bash

NVCHAD_DEPENDENCY_PACKAGES=(
    gcc
)

function installNvChad() {
    echo -e "\nInstalling: neovim with snap\n"
    sudo snap install nvim --classic

    for ((i = 0; i < ${#NVCHAD_DEPENDENCY_PACKAGES[@]}; i++)); do
        echo -e "\nInstalling: ${NVCHAD_DEPENDENCY_PACKAGES[i]}\n"
        sudo apt-get install "${NVCHAD_DEPENDENCY_PACKAGES[i]}" -y
    done

    echo -e "\nCloning: https://github.com/NvChad/NvChad.git > ~/.config/nvim\n"
    git clone https://github.com/NvChad/NvChad.git ~/.config/nvim
    nvim
}
