#!/bin/bash

# Function to process files and directories
process_folder() {
    local path="$1"
    local flag=2

    # Check if the path is a directory
    if [[ -d "$path" && "$path" != "$(pwd)/toberemoved" ]]; then
        # Recursively process each file and subdirectory
        for file in "$path"/*; do
            process_folder "$file"
        done
    elif [[ -f "$path" ]]; then
        # Process the file
        local full
        local hour
        local min
        local duration

        full=$(mediainfo --Inform="General;%Duration/String3%" "$path")
        hour=$(echo "$full" | sed 's/[:.]//g' | awk '{print $1}')
        min=$(echo "$full" | sed 's/[:.]//g' | awk '{print $2}')
        duration=$((hour * 60 + min))

        echo -e "file: $path\nDuration: $duration"

        # Move files shorter than the flag duration
        if (( duration < flag )); then
            mkdir -p "$(pwd)/toberemoved"
            mv "$path" "$(pwd)/toberemoved/"
        fi
    fi
}

# Start processing from the current directory
process_folder "$(pwd)"
