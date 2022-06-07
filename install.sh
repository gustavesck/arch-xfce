#!/usr/bin/env bash
#   ____   ____  
#  / ___| | __ )
# | |  _  |  _ \   Gustavo Borges (Gustavesck)
# | |_| | | |_) |  https://www.github.com/gustavesck
#  \____| |____/ 
#
# Arch xfce configuration script

read -p "Would you like to install NVIDIA drivers? (y/n) " nvidia

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

if [ "$nvidia" -eq "y" ]; then
	sudo pacman -S --needed --noconfirm nvidia nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader
fi

# programs

sudo pacman -S --needed --noconfirm firefox vlc keepassxc chromium file-roller qbittorrent p7zip \
gnome-disk-utility libreoffice jdk-openjdk gvfs simple-scan xfce4-goodies gnome-calculator \
xreader drawing rhythmbox gnome-screenshot celluloid xed mtpfs gvfs-mtp

yay -S --noconfirm xviewer onlyoffice pfetch vscodium-bin

# themes

sudo pacman -S --noconfirm papirus-icon-theme pop-icon-theme

yay -S --noconfirm all-repository-fonts nordic-wallpapers-git juno-theme-git

# lightdm

sudo pacman -S --noconfirm lightdm-slick-greeter 
cd ~/arch-xfce/lightdm
sudo cp * /etc/lightdm 

# Config

cd ~/arch-xfce
cp .bashrc ~
cp -r .config ~

# Installation done

echo -e "\033[0;32mAll done! Please reboot the computer.\033[0m"
