#!/usr/bin/env bash
#   ____   ____  
#  / ___| | __ )
# | |  _  |  _ \   Gustavo Borges (Gustavesck)
# | |_| | | |_) |  https://www.github.com/gustavesck
#  \____| |____/ 
#
# Arch xfce configuration script

read -p "Would you like to install NVIDIA drivers? (y/N) " nvidia

cd ~
sudo pacman -Syyu --noconfirm

# Yay

sudo pacman -S --needed --noconfirm git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ~

# Printer

sudo pacman -S --noconfirm cups
sudo systemctl enable --now cups
sudo usermod -aG lp $USER
sudo pacman -S --noconfirm system-config-printer hplip

# Nvidia

if [ "$nvidia" -eq "y" ]; then
	sudo pacman -S --needed --noconfirm nvidia nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader
fi

# Gaming

sudo pacman -S --needed --noconfirm lutris wine lib32-alsa-plugins lib32-libpulse lib32-openal

# Programs

sudo pacman -S --needed --noconfirm vlc keepassxc file-roller qbittorrent p7zip \
gnome-disk-utility jdk-openjdk simple-scan xfce4-goodies gnome-calculator \
xreader drawing gnome-screenshot celluloid xed

yay -S --noconfirm onlyoffice pfetch vscodium-bin brave-bin

# Some tools

sudo pacman -S --needed --noconfirm gvfs mtpfs gvfs-mtp android-tools nodejs npm

yay -S --needed --noconfirm mugshot

# Themes

sudo pacman -S --noconfirm papirus-icon-theme pop-icon-theme

yay -S --noconfirm all-repository-fonts qogir-gtk-theme-git nordic-wallpapers-git

# Multimedia codecs

sudo pacman -S --needed --noconfirm jasper lame libdca libdv gst-libav libtheora libvorbis libxv wavpack x264 xvidcore dvd+rw-tools \
dvdauthor dvgrab libmad libmpeg2 libdvdcss libdvdread libdvdnav exfat-utils fuse-exfat a52dec faac faad2 flac

# Lightdm

sudo pacman -S --noconfirm lightdm-slick-greeter 
cd ~/arch-xfce/lightdm
sudo cp * /etc/lightdm 

# Config

cd ~/arch-xfce
cp .bashrc ~
cp -r .config ~

# Installation done

echo -e "\033[0;32mAll done! Please reboot the computer.\033[0m"
