#!/bin/bash
set -euo pipefail

USER_HOME="$HOME"
USER_NAME="$(id -un)"

if (( EUID != 0 )); then
	su
	xbps-install -Syu elogind dbus linux-firmware-intel mesa-dri xorg vulkan-loader mesa-vulkan-intel libva-intel-driver qtile git rofi firefox alacritty python python-pip sddm nvim vim stow
	xbps-install -S $(xbps-query -Rs "ttf-" | awk '{print $2}')
	ln -s /etc/sv/elogind /var/service
	ln -s /etc/sv/dbus /var/service
	git clone https://github.com/xsailent/qtile-dotfiles
	mkdir $USER_HOME/.dotfiles
	cp qtile-dotfiles/* $USER_HOME/.dotfiles
	cd $USER_HOME/.dotfiles
	exit
	stow .
	loginctl reboot
fi

