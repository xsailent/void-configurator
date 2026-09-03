if (( EUID != 0 )); then
    echo "Ошибка: запустите скрипт с правами root." >&2
    exit 1
else
	xbps-install -Syu linux-firmware-intel mesa-dri xorg vulkan-loader mesa-vulkan-intel libva-intel-driver qtile git rofi firefox alacritty python python-pip lightdm nvim vim
	git clone https://github.com/xsailent/qtile-dotfiles
	cd qtile-dotfiles/in\ .config
	cp -r * ~/.config
	cd ..
	cd for\ runit
	cat in\ etc\\rc.local >> /etc/rc.local
	cd in\ usr\\local\\bin
	cp -r * /usr/local/bin
	cd ../..
	cd in\ \~\ directory/create\ directory\ with\ name\ .xsalothemes
	mkdir ~/.xsalothemes
	cp -r * ~/.xsalothemes
	ln -s /etc/sv/lightdm /var/service
	reboot
fi

