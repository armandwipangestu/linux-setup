#!/bin/bash

REPOSITORY_LINK=(
    "https://github.com/robbyrussell/oh-my-zsh"
    "https://github.com/zsh-users/zsh-syntax-highlighting"
    "https://github.com/zsh-users/zsh-autosuggestions"
    "https://github.com/joshskidmore/zsh-fzf-history-search"
    "https://github.com/jimeh/tmux-themepack"
)

OMZ_PATH="${HOME}/.oh-my-zsh"
OMZ_CUSTOM_PLUGIN_PATH="${OMZ_PATH}/custom/plugins"
OMZ_CUSTOM_THEME_PATH="${OMZ_PATH}/custom/themes"

REPOSITORY_PATH=(
    "${OMZ_PATH}"
    "${OMZ_CUSTOM_PLUGIN_PATH}/zsh-syntax-highlighting"
    "${OMZ_CUSTOM_PLUGIN_PATH}/zsh-autosuggestions"
    "${OMZ_CUSTOM_PLUGIN_PATH}/zsh-fzf-history-search"
    "$HOME/.tmux-themepack"
)

function cloneRepositoryZsh() {
    for ((i = 0; i < ${#REPOSITORY_LINK[@]}; i++)); do
        echo -e "\nCloning: ${REPOSITORY_LINK[i]} > ${REPOSITORY_PATH[i]}\n"
        git clone "${REPOSITORY_LINK[i]}" "${REPOSITORY_PATH[i]}"
    done
}

function installCustomThemes() {
    cp $(pwd)/ohmyzsh-themes/* "${OMZ_CUSTOM_THEME_PATH}"
}
