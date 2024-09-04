#!/bin/bash

toberemoved="$(pwd)/toberemoved"
mkdir -p "$toberemoved"

process() {
	for filename in "$1"/*;do
		if [[ -d $filename && $filename!="toberemoved" ]];then
			process "$filename"
		elif [[ -f "$filename" && ( "$filename" == *.mp3 || "$filename" == *.opus ) ]]; then
			durationString=$(mediainfo --Inform="General;%Duration/String3%" "$filename")
			echo "file: $filename; duration: $durationString"
			hours=$(echo "$durationString" | awk -F ':' '{print $1}')
			minutes=$(echo "$durationString" | awk -F ':' '{print $2}')
			seconds=$(echo "$durationString" | awk -F ':' '{print $3}i')
			echo "HH:MM:SS: $hours:$minutes:$seconds"
			# Perform the calculation with floating-point precision
			total=$(echo "$hours * 60 * 60 + $minutes * 60 + $seconds" | bc)

			# Print the result
			echo "Total time in seconds: $total"

			if (( $(echo "$total < 121" | bc -l) )); then
				mv "$filename" "$toberemoved"
			fi
		fi
	done
}

process "$(pwd)"
