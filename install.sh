sudo pacman --noconfirm -S xorg-server xorg-xinit i3 mesa vlc alacritty feh
cp ./.bashrc ~/.bashrc
source ~/.bashrc
cp ./xinitrc ~/.xinitrc
cp ./i3.config ~/.config/i3/config
cp ./i3status.config ~/.config/i3status/config
