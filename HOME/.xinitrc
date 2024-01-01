# Max out the refreshrate/resolution
display=$(xrandr --query | grep ' connected' | cut -d ' ' -f1)
highest_rate=$(xrandr --query | grep -oP '[0-9]+\.[0-9]+' | sort -nr | head -n 1)
resolution=$(xrandr --current | grep '*' | uniq | awk '{print $1}')
echo "display: $display highest_rate: $highest_rate resolution: $resolution"
xrandr --output $display --mode $resolution --rate $highest_rate

# D-Bus stuff
if test -z "$DBUS_SESSION_BUS_ADDRESS"; then
	eval $(dbus-launch --exit-with-session --sh-syntax)
fi
systemctl --user import-environment DISPLAY XAUTHORITY
if command -v dbus-update-activation-environment >/dev/null 2>&1; then
        dbus-update-activation-environment DISPLAY XAUTHORITY
fi

# Clean up previous session
pkill greenclip
pkill polybar

greenclip clear && greenclip daemon &

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

~/.fehbg &

xdg-mime default pcmanfm.desktop inode/directory

exec leftwm 



