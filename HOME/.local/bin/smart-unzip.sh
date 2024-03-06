
# Function to check if a directory exists
directory_exists() {
    if [ -d "$1" ]; then
        return 0
    else
        return 1
    fi
}

# Function to unzip the file
unzip_file() {
    unzip -qq "$1" -d "${2:-.}"
    notify-send "Unzipped '$1'"
}

# Main script
if [ $# -ne 1 ]; then
    echo "Usage: $0 <zipfile>"
    exit 1
fi

zipfile="$1"
basename="$(basename "$zipfile" .zip)"

# Check if the zipfile contains a single folder
first_dir=$(unzip -l "$zipfile" | awk 'NR==4 {print $4}')
if directory_exists "$first_dir"; then
    unzip_file "$zipfile"
else
    mkdir -p "$basename"
    unzip_file "$zipfile" "$basename"
fi
