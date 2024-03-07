# Find all projects in ~/Code
projects=$(find ~/Code -maxdepth 4 -type d -name .git -printf '%h\n')

# Create a menu using rofi
choice=$(echo -e "$projects" | rofi -dmenu -i -p 'Select Project: ')

# Take action based on the choice
if [ -n "$choice" ]; then
    {
        # Change directory to the project
        cd "$choice";

        if [ -f "shell.nix" ]; then
            notify-send "Opening '$choice' within nix-shell"
            nix-shell shell.nix --run "code ."
        else
            notify-send "Opening '$choice'"
            code .
        fi
    }
fi