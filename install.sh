#!/bin/bash

# Install all dependencies
pacman -S --needed base-devel \
    linux-headers linux-lts-headers \
    nvidia-utils nvidia-settings nvidia-dkms \
    git zsh nvim less tree \
    rustup nvm lua \
    opencode \
    ttf-meslo-nerd ttf-fira-code

# Install the lastest stable version of rust
rustup default stable
# Install the latest stable version of NodeJS
nvm install --lts
nvm alias default "lts/*"

# TODO: add paru compilation steps here later...


yay -S brave-bin wezterm-git


# TODO git clone where is my sddm theme
# setup sddm, theme & x11 configs


