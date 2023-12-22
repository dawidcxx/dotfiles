# Find all projects in ~/Code
projects=$(find ~/Code -maxdepth 4 -type d -name .git -printf '%h\n')

# Create a menu using rofi
choice=$(echo -e "$projects" | rofi -dmenu -i -p 'Select Project: ')

# Take action based on the choice
if [ -n "$choice" ]; then
    {

        notify-send "Opening $choice"
        # Change directory to the project
        cd "$choice";
        
        # Run code
        code .
    }
fi