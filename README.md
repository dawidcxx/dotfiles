# About

Custom autorice for archlinux. 

# Programs used

- [i3](https://i3wm.org/docs/) window manager
- [flameshot](https://flameshot.js.org/#/) screenshot tool
- [alacritty](https://github.com/alacritty/alacritty) terminal emulator
- [dunst](https://dunst-project.org/) desktop notifications
- [betterlock](https://github.com/pavanjadhaw/betterlockscreen)/[i3lock-color](https://github.com/PandorasFox/i3lock-color) screen locker 
- [youtube-dl](https://github.com/ytdl-org/youtube-dl)
- [vlc](https://www.videolan.org/vlc/index.pl.html) 

# Installation

```sh
pacman -Syu # update your system
./install.sh # run the installation script
```  

# Post installation

Currently the script will not install a browser. To install brave browser (recommended):

```sh
aur_get https://aur.archlinux.org/packages/brave-bin/
cd brave-bin
makepkg -sri
```

FIXME: this will be fixed once brave is added to offical repos. 

# User guide


## Adding a wallpaper. 

- Add a new image to `~/Pictures/wallpapers`. Wallpapers are picked at random. If you want a constant background just make sure there is only one image in `~/Pictures/wallpapers`

## Most frequently used keybindings

`$mod` is set to `WinKey`.

`$mod+Tab` - start browser
`$mod+Shift+Tab` - start browser incognito mode
`$mod+Enter` - start terminal
`$mod+o` - screenlock

Window moving, workspace switching etc is done using i3 defaults. 