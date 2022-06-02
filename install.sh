#!/bin/bash

cd ~
sudo pacman -Syy

# yay

sudo pacman -S --needed --noconfirm git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ~

# printer

sudo pacman -S --noconfirm cups
sudo systemctl enable --now cups
sudo usermod -aG lp $USER
sudo pacman -S --noconfirm system-config-printer hplip

# nvidia

sudo pacman -S --needed --noconfirm nvidia nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader

# programs

sudo pacman -S --noconfirm firefox vlc keepassxc chromium file-roller qbittorrent p7zip gnome-disk-utility \
libreoffice jdk-openjdk gvfs simple-scan xfce4-goodies gnome-calculator xreader drawing rhythmbox

yay -S --noconfirm all-repository-fonts nordic-wallpapers-git mint-themes mint-y-icons xcursor-dmz \
xviewer onlyoffice

# lightdm

sudo pacman -S --noconfirm lightdm-slick-greeter 
yay -S --noconfirm lightdm-settings

# Config

cd ~
mkdir Documents
mkdir Downloads
mkdir Music
mkdir Pictures
mkdir Videos

cd arch-xfce/.config
cp -r * ~/.config

# Installation done

echo "All done! Please reboot the computer."
