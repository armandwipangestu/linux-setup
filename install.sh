#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
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
    "logging" "packages" "clone" "dotfiles"
    "nvchad"
)

for HELPER in "${HELPERS[@]}"; do
    source "${SCRIPT_DIR}/helper/${HELPER}.sh"
done

function main() {
    log "script" "INFO" "Running: Update & Upgrade"
    #sudo apt update && sudo apt upgrade
    sudo apt update
    installDependencyPackage
    cloneRepositoryZsh
    installCustomThemes
    installDotfiles
    utility

    log "script" "INFO" "Change Shell to ZSH!"
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

    log "script" "INFO" "Installation Done!"
}

main
