# Build the exclude options for rsync
exclude_options=""
for arg in "$@"; do
    exclude_options+="--exclude $arg "
done

# Specify source directory
src_dir="./HOME/"

# Destination directory is the home directory
dst_dir="$HOME"

# Get the current user
current_user=$(whoami)

echo "src_dir = $src_dir";
echo "dst_dir = $dst_dir";
echo "current_user = $current_user";
echo "exclude_options = $exclude_options";

echo "Syncing files in 1secs";

sleep 1; 

# Use rsync to sync files
rsync -r -avh --exclude '.git' $exclude_options $src_dir $dst_dir

# Change ownership of the copied files to the current user
chown -R $current_user $dst_dir

echo "reload leftwm settings.."

leftwm command SoftReload