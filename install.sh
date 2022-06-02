#!/bin/bash

cd ~
sudo pacman -Syy

# yay

sudo pacman -S --needed --noconfirm git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~

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