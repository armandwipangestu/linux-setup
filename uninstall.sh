#!/bin/bash

chsh -s /bin/bash
sudo apt purge fzf zsh -y
rm -rf ~/.zshrc ~/.oh-my-zsh
