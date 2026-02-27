#!/bin/bash

# Install all dependencies
pacman -S --needed base-devel \
    linux-headers linux-lts-headers \
    nvidia-utils nvidia-settings nvidia-dkms \
    sddm xorg-server xorg-xinit \
    qt6-declarative qt5-declarative qt6-5compat \
    qt5-graphicaleffects qt5-quickcontrols2 \
    git zsh nvim less tree opencode \
    rustup nvm \
    yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick \
    ttf-meslo-nerd

# Install the lastest stable version of rust
rustup default stable
# Install the latest stable version of NodeJS
nvm install --lts
nvm alias default node

# TODO: add paru compilation steps here later...


paru -S brave-bin wezterm-git


# TODO git clone where is my sddm theme
# setup sddm, theme & x11 configs


