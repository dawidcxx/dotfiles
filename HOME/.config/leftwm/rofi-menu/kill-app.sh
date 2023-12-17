#!/bin/bash

# Get a list of all running GUI applications
apps=$(wmctrl -lp | awk '{print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10}')

# Use rofi to select an application
selected_app=$(echo "$apps" | rofi -dmenu -i -p "Select an application to kill")

if [ -z "$selected_app" ]; then
    exit 0
fi

# Extract the PID from the selected application
pid=$(echo $selected_app | awk '{print $3}')

# Kill the selected application
kill $pid

notify-send "Application killed" 
