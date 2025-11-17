#!/bin/bash

DEPENDENCY_PACKAGES=(
    "git" "fzf" "zsh" "bat" "eza"
    "neofetch" "tmux" "xclip" "nmap"
    "ncdu" "btop"
)

function installDependencyPackage() {
    for ((i = 0; i < ${#DEPENDENCY_PACKAGES[@]}; i++)); do
        log "script" "INFO" "Installing dependency package '${DEPENDENCY_PACKAGES[i]}'"
        sudo apt-get install "${DEPENDENCY_PACKAGES[i]}" -y
    done
}
