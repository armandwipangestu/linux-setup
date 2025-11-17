#!/bin/bash

SKIP_INTERACTION=false

for arg in "$@"; do
    case $arg in
        --skip-interaction|-y)
            SKIP_INTERACTION=true
            shift
            ;;
        *)
            ;;
    esac
done

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

    if [ "$SKIP_INTERACTION" = true ]; then
        SWITCH_CASE="y"
    else
        read -r -p "Install Neovim with NvChad? [y/n] " SWITCH_CASE
    fi

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
