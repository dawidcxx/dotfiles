sudo pacman --noconfirm -S xorg-server xorg-xinit
sudo pacman --noconfirm -S i3 --ignore i3lock 
sudo pacman --noconfirm -S i3lock-color mesa vlc alacritty feh libnotify dunst
sudo pacman --noconfirm -S imagemagick xorg-xrandr xorg-xdpyinfo
sudo pacman --noconfirm -S flameshot alsa-utils man noto-fonts

cp ./.bashrc ~/.bashrc
source ~/.bashrc
cp ./xinitrc ~/.xinitrc
cp ./i3.config ~/.config/i3/config

if [ ! -d "$HOME/.config/i3status" ] ; then
	mkdir ~/.config/i3status
fi
cp ./i3status.config ~/.config/i3status/config


if [ ! -d "$HOME/.config/dunst" ] ; then
	mkdir ~/.config/dunst
fi

cp ./dunstrc ~/.config/dunst/dunstrc


if [ ! -d "$HOME/.local/bin" ] ; then
	mkdir -p ~/.local/bin
fi
cp -r ./bin ~/.local/

if [ ! -d "$HOME/Pictures" ] ; then
	mkdir -p ~/Pictures
fi

cp lockscreen.png ~/Pictures/lockscreen.png
betterlock -u ~/Pictures/lockscreen.png 


if [ ! -d "$HOME/Pictures/wallpapers" ] ; then
	mkdir -p ~/Pictures/wallpapers
fi

cp ./.fehbg ~/.fehbg
