#!/bin/bash

# Define a list of programs with descriptions
declare -a options=("Firefox (Web Browser)
Brave (Web Browser)
VSCode (Text Editor)
Alacritty (Terminal / Command Line Interface)
KeepassXc (Password Manager)
PCManFM (File Manager)
ARandr (Manage displays)
Redshift - ON (Enable Night light)
Redshift - OFF (Enable Day light)
Discord (Chatting App)
Slack (Chatting App)
Pavucontrol (Audio Control)
Quit")

# Create a menu using rofi
choice=$(echo -e "${options[@]}" | rofi -dmenu -i -p 'Run Program: ')

# Take action based on the choice
case $choice in
    'Firefox (Web Browser)')
        firefox & ;;
    'Brave (Web Browser)')
        brave & ;;
    'Redshift - ON (Enable Night light)')
        redshift -O 3000 ;;
    'Redshift - OFF (Enable Day light)')
        redshift -x ;;
    'ARandr (Manage displays)')
        arandr & ;;
    'Discord (Chatting App)')
        discord & ;;
    'VSCode (Text Editor)')
        code & ;;
    'Pavucontrol (Audio Control)')
        pavucontrol & ;;
    'KeepassXc (Password Manager)')
        keepassxc & ;;
    'PCManFM (File Manager)')
        GDK_SCALE=2 pcmanfm &;;
    'Alacritty (Terminal / Command Line Interface)')
        alacritty & ;;
    'Quit')
        echo "Program terminated." ;;
    *)
        echo "Invalid option. Program terminated." ;;
esac