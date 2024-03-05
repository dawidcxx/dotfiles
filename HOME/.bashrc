vimo() {
    local search_dir="${1:-.}"  # Use the passed-in directory or default to current directory
    local result=$(find "$search_dir" -type f | fzf)
    if [ -n "$result" ]; then
        vim "$result"
    fi
}

h() {
    selected_history_entry=$(history | fzf --tac | awk '{$1=""; print $0}' | sed 's/^[[:space:]]*//')
    echo -en "> '$selected_history_entry'\n"
    echo -n $selected_history_entry | xclip -selection primary 
    eval "$selected_history_entry"
}