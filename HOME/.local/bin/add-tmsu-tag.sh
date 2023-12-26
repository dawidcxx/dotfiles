echo "Tagging file: $1";

if [ -z "$1" ]; then
    echo "Error: FILE is not defined"
    exit 1
fi

TAGS=$(tmsu tags "$1" | tr ' ' '\n' | tail -n +2)
TAGS=$(echo "$TAGS" | rofi -dmenu -p "Add tag")


tmsu tag "$1" $TAGS