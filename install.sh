#!/bin/bash

# Install all dependencies
pacman -S --needed base-devel linux-headers linux-lts-headers \
    nvidia-utils nvidia-settings mesa-utils nvidia-dkms \
    xorg-server xorg-xinit sddm \
    qt6-base qt6-declarative qt6-tools \
    qt6-svg qt6-wayland qt6-translations \
    zsh nvim less tree yazi zip unzip \
    rustup nvm lua \
    git github-cli cava opencode \
    ttf-meslo-nerd ttf-fira-code

# sudo pacman -S sddm xorg-server xorg-xinit

# sudo pacman -S qt6-base qt6-declarative qt6-tools qt6-svg qt6-translations qt6-wayland

# Install the lastest stable version of rust
rustup default stable
# Install the latest stable version of NodeJS
nvm install --lts
nvm alias default "lts/*"

# TODO: add proper pushd steps
git clone https://aur.archlinux.org/paru.git
cd paru # replace with pushd
makepkg -si
# TODO: add proper popd & clean up steps

paru -S brave-bin


# TODO: automate everything else...


