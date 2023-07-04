#!/bin/bash

DOTFILES=(
    ".zshrc"
)

function installDotfiles() {
    for DOTFILE in "${DOTFILES[@]}"; do
        echo -e "\nCopy: $(pwd)/""${DOTFILE}"" > ""${HOME}""\n"
        cp $(pwd)/"${DOTFILE}" "$HOME"
    done
}
