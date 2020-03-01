sudo pacman --noconfirm -S xorg-server xorg-xinit i3 mesa vlc alacritty feh dunst i3lock-color --ignore i3lock
cp ./.bashrc ~/.bashrc
source ~/.bashrc
cp ./xinitrc ~/.xinitrc
cp ./i3.config ~/.config/i3/config
if [ ! -d "~/.config/i3status" ] ; then
	mkdir ~/.config/i3status
fi
cp ./i3status.config ~/.config/i3status/config

if [ ! -d "~/.local/bin" ] ; then
	mkdir -p ~/.local/bin
fi
cp -r ./bin ~/.local/bin

