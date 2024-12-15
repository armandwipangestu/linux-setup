#!/bin/bash

HELPERS=(
    "packages" "clone" "dotfiles"
    "nvchad"
)

for HELPER in "${HELPERS[@]}"; do
    source $(pwd)/helper/"${HELPER}".sh
done

function main() {
    echo -e "Running: Update & Upgrade\n"
    #sudo apt update && sudo apt upgrade
    sudo apt update
    installDependencyPackage
    cloneRepositoryZsh
    installCustomThemes
    installDotfiles
    utility

    echo -e "Change Shell to ZSH!"
    sudo chsh -s $(which zsh) "$USER"

    read -p "Install Neovim with NvChad? [y/n] " SWITCH_CASE

    case "$SWITCH_CASE" in
    y | Y)
        installNvChad
        ;;
    n | N)
        exit
        ;;
    *)
        exit
        ;;
    esac

    echo -e "\nInstallation Done :)\n"
}

main
