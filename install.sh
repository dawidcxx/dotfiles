sudo pacman --noconfirm -S xorg-server xorg-xinit
sudo pacman --noconfirm -S i3 --ignore i3lock 
sudo pacman --noconfirm -S i3lock-color mesa base-devel bc alacritty feh libnotify dunst dmenu
sudo pacman --noconfirm -S dmenu imagemagick xorg-xrandr xorg-xdpyinfo
sudo pacman --noconfirm -S flameshot alsa-utils man noto-fonts
sudo pacman --noconfirm -S vlc youtube-dl py3status ttf-joypixels
sudo pacman --noconfirm -S pulseaudio pulseaudio-alsa pasystray

cp ./.bashrc ~/.bashrc
source ~/.bashrc
cp ./.xinitrc ~/.xinitrc
cp ./i3.config ~/.config/i3/config
export PATH="$PATH:$HOME/.local/bin"

if [ ! -d "$HOME/.config/i3status" ] ; then
	mkdir -p ~/.config/i3status
fi
cp ./i3status.config ~/.config/i3status/config


if [ ! -d "$HOME/.config/dunst" ] ; then
	mkdir -p ~/.config/dunst
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
if [ -n "$DISPLAY" ]; then
	betterlock -u ~/Pictures/lockscreen.png 
else
	echo "Not setting betterlock, rerun this script with a running X session!"
fi

if [ ! -d "$HOME/Pictures/wallpapers" ] ; then
	mkdir -p ~/Pictures/wallpapers
fi
cp -r ./wallpapers ~/Pictures/
cp ./.fehbg ~/.fehbg
