#!/bin/bash

Folder()
{
	path="$1"
	
	if [[ -d "$path" ]] && [[ $path != "toberemoved" ]] ; then
		for file in "$path/"*
		do
			Folder "$file"
		done
	elif [ -f "$path" ] ; then
		x=2
		duration=$(mediainfo --Inform="General;%Duration/String3%" "$path" | sed s/[:\.]/' '/g | awk '{print $2}')
		if [ "$duration" -lt "$x" ]
		then
			if [ ! -d "toberemoved"  ] ; then
				mkdir "toberemoved"
			fi

			if [ -d "toberemoved"  ] ; then
				mv "$path" "toberemoved"
			fi
		fi
	fi


}

dir=$(pwd)
Folder "$dir"
