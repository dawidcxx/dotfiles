# Specify source directory
src_dir="./HOME"

# Destination directory is the home directory
dst_dir="$HOME"

# Use rsync to sync files
rsync -avh --exclude '.git' $src_dir $dst_dir

# Get the current user
current_user=$(whoami)

# Change ownership of the copied files to the current user
chown -R $current_user:$current_user $dst_dir