#!/bin/bash

# Define a list of programs with descriptions
declare -a options=("Firefox (Web Browser)
Brave (Web Browser)
Chromium (Web Browser)
VSCode (Text Editor)
Alacritty (Terminal / Command Line Interface)
KeepassXc (Password Manager)
Btop (System Monitor)
PCManFM (File Manager)
ARandr (Manage displays)
Joplin (Notes)
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
Wine (Windows Emulator)
Clipboard
Power
Quit")

# Create a menu using rofi
choice=$(echo -e "${options[@]}" | rofi -dmenu -i -p 'Run Program: ')

# Take action based on the choice
case $choice in
    'Firefox (Web Browser)')
        firefox & ;;
    'Chromium (Web Browser)')
        chromium & ;;
    'Brave (Web Browser)')
        brave & ;;
    'Btop (System Monitor)')
        alacritty -e btop & ;;
    'Redshift - ON (Enable Night light)')
        if [ -x "$(command -v light)" ]; then
            light -S 10        
        fi
        redshift -O 3000 ;;
    'Redshift - OFF (Enable Day light)')
        if [ -x "$(command -v light)" ]; then
            light -S 70        
        fi
        redshift -x ;;
    'ARandr (Manage displays)')
        arandr & ;;
    'Joplin (Notes)')
        joplin-desktop & ;;
    'Discord (Chatting App)')
        vesktop & ;;
    'Slack (Chatting App)')
        slack & ;;
    'VSCode (Text Editor)')
        code & ;;
    'Clipboard')
        clipboard_entry=$(greenclip print | rofi -dmenu -i -p 'Clipboard:')
        echo -n $clipboard_entry | xclip -selection clipboard &
    ;;
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
        PIPEWIRE_LATENCY=64/48000 osu\! &;;
    'Open Code Project')
        sh ~/.config/leftwm/rofi-menu/open-project.sh & ;;
    'Alacritty (Terminal / Command Line Interface)')
        alacritty & ;;
    'Kill App (via pkill)')
        sh ~/.config/leftwm/killapp.sh & ;;
    'Wine (Windows Emulator)')
        # Get a list of Wine executables
        wine_executables=$(find ~/Wine -type f -iname "*.exe")

        # Use rofi to create a menu for selecting a Wine executable
        wine_choice=$(echo "$wine_executables" | rofi -dmenu -p "Select a Wine executable")

        case "$wine_choice" in
            '')
                echo "No option selected." ;;
            *)
                cd $(dirname "$wine_choice")
                notify-send "Running '$wine_choice'"
                WINEPREFIX="$HOME/.wine" wine "$wine_choice"  ;;
        esac
    ;;
    'Switch Audio Output')
        sink_options=$(pactl list short sinks)
        sink_choice=$(echo -e "$sink_options" | rofi -dmenu -i -p 'Pick sink: ')
        sink_choice_pid=$(echo $sink_choice | awk '{print $1}')
        pactl set-default-sink $sink_choice_pid 
        notify-send "Audio output switched '${sink_choice_pid}'"
        ;;
    'Power') 
        declare -a power_options=("Shutdown/Off\nReboot\nClose leftwm\nCancel")
        power_choice=$(echo -e "${power_options[@]}" | rofi -dmenu -i -p 'Power option: ')
        case $power_choice in
            'Shutdown/Off')
                systemctl poweroff ;;
            'Reboot')
                systemctl reboot ;;
            'Close leftwm')
                pkill leftwm ;;
            *)
                echo "Invalid option. Program terminated." ;;
        esac ;;
    'Quit')
        echo "Program terminated." ;;
    '')
        echo "No option selected." ;;
    *)
        notify-send "Runnig '$choice'"
        exec $choice & ;;
esac