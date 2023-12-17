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
Drag&Drop File (Scratchpad Util)
Osu (Rythm Game)
Switch Audio Output
Open Code Project
Kill App (via pkill)
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
    'Drag&Drop File (Scratchpad Util)')
        leftwm command "ToggleScratchPad Pcmanfm" &;;
    'Pavucontrol (Audio Control)')
        pavucontrol & ;;
    'KeepassXc (Password Manager)')
        leftwm command "ToggleScratchPad Keepassxc" &;;
    'PCManFM (File Manager)')
        GDK_SCALE=2 pcmanfm &;;
    'Osu (Rythm Game)')
        display=$(xrandr --query | grep ' connected' | cut -d ' ' -f1)
        highest_rate=$(xrandr --query | grep -oP '[0-9]+\.[0-9]+' | sort -nr | head -n 1)
        resolution=$(xrandr --current | grep '*' | uniq | awk '{print $1}')
        xrandr --output $display --mode $resolution --rate $highest_rate
        osu\! &;;
    'Open Code Project')
        bash ~/.config/leftwm/open-project.sh & ;;
    'Alacritty (Terminal / Command Line Interface)')
        alacritty & ;;
    'Kill App (via pkill)')
        sh ~/.config/leftwm/killapp.sh & ;;
    'Switch Audio Output')
        sink_options=$(pactl list short sinks)
        sink_choice=$(echo -e "$sink_options" | rofi -dmenu -i -p 'Pick sink: ')
        sink_choice_pid=$(echo $sink_choice | awk '{print $1}')
        pactl set-default-sink $sink_choice_pid 
        notify-send "Audio output switched '${sink_choice_pid}'"
        ;;
    'Quit')
        echo "Program terminated." ;;
    *)
        echo "Invalid option. Program terminated." ;;
esac