#!/bin/bash

Folder() {
	path="$1"
	if [[ -d "$path" ]] && [[ $path != "toberemoved" ]]; then
		for file in "$path/"*; do
			Folder "$file"
		done
	elif [ -f "$path" ]; then
		flag=2
		full=$(mediainfo --Inform="General;%Duration/String3%" "$path")
		hour=$(echo "$full" | sed s/[:\.]/' '/g | awk '{print $1}')
		min=$(echo "$full" | sed s/[:\.]/' '/g | awk '{print $2}')
		duration=$((hour * 60 + min))
		echo "file: $path\nDuration: $duration"
		if [ "$duration" -lt "$flag" ]; then
			mkdir -p "toberemoved"
			mv "$path" "toberemoved"
		fi
	fi
}
Folder "$(pwd)"
