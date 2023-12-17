#!/bin/bash

# Get a list of all running windows with their titles
windows=$(wmctrl -lx | awk '{print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10}')

# Use rofi to select a window
selected_window=$(echo "$windows" | rofi -dmenu -i -p "Select a window")

# Extract the Window ID from the selected window
window_id=$(echo $selected_window | awk '{print $1}')

# Focus the selected window
wmctrl -i -a $window_id