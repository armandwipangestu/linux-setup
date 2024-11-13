#!/bin/bash

DEPENDENCY_PACKAGES=(
    "git" "fzf" "zsh" "bat" "eza"
    "neofetch" "tmux"
)

function installDependencyPackage() {
    for ((i = 0; i < ${#DEPENDENCY_PACKAGES[@]}; i++)); do
        echo -e "\nInstalling: ${DEPENDENCY_PACKAGES[i]}\n"
        sudo apt-get install "${DEPENDENCY_PACKAGES[i]}" -y
    done
}
