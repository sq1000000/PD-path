#!/bin/bash

# Dependency: inotify-tools (for --watch mode)
# Install on Ubuntu/Debian: sudo apt-get install inotify-tools

rename_file() {
    local file="$1"
    # Skip processing if it's already in the correct format
    [[ "$file" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}_[0-9]{2}-[0-9]{2}-[0-9]{2}\.wav$ ]] && return

    base_name="${file%.wav}"
    standardized="${base_name/, /_}"
    standardized="${standardized//:/-}"

    IFS=_ read -r date_str time_str <<< "$standardized"
    
    # Process date
    IFS=- read -r year month day <<< "$date_str"
    printf -v new_date "%04d-%02d-%02d" "$year" "$month" "$day"
    
    # Process time
    IFS=- read -r hour minute second <<< "$time_str"
    printf -v new_time "%02d-%02d-%02d" "$hour" "$minute" "$second"
    
    new_filename="${new_date}_${new_time}.wav"
    
    if [[ "$file" != "$new_filename" ]]; then
        mv -v -- "$file" "$new_filename"
    fi
}

process_existing() {
    for file in *.wav; do
        rename_file "$file"
    done
}

watch_directory() {
    echo "Watching directory for new files..."
    inotifywait -m -e close_write --format "%f" . | while read -r file
    do
        if [[ "$file" == *.wav ]]; then
            rename_file "$file"
        fi
    done
}

# Main execution
if [[ "$1" == "--watch" ]]; then
    if ! command -v inotifywait &> /dev/null; then
        echo "Error: inotifywait (from inotify-tools) is required for watch mode"
        echo "Install with: sudo apt-get install inotify-tools"
        exit 1
    fi
    process_existing
    watch_directory
else
    process_existing
fi
