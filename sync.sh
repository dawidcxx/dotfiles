# Specify source directory
src_dir="./HOME/"

# Specify destination directory
dst_dir="$HOME"

# Get the current user
current_user=$(whoami)

#  Sync all by default
if [ $# -eq 0 ]
then
    include_pattern='*'
else
    include_pattern=$1
fi

echo "src_dir = $src_dir";
echo "dst_dir = $dst_dir";
echo "current_user = $current_user";
echo "include_pattern = $include_pattern";

echo "Syncing files in 1 sec";

# Include parent directories of matching files
include_dirs="${include_pattern%/*}"

echo "include_dirs = '$include_dirs'";

sleep 1;


{
    cd $src_dir;
    find . -name "$include_pattern" -type f -exec rsync -R -v {} $dst_dir \;
}

# Change ownership of the copied files to the current user
# chown -R $current_user "$dst_dir"

echo "reload leftwm settings.."

leftwm command SoftReload