#!/usr/bin/env bash

set -euo pipefail



SECURE_FILE="/tmp/master.sha256"

if (( "$#" == 0 || "$#" == 1 )); then
	echo "Usage: $0 init/checl/-check/update file/dir"
	exit 1
fi


if [[ "$1" != "init" && "$1" != *"check" && "$1" != "update" ]]; then
	echo "Usage: $0 init/check/-check/update file/dir"
	exit 1
fi


if [[ "$1" = "init" ]]; then	
	if [[ -f "$2" ]]; then
		sha256sum "$2" >> "$SECURE_FILE" 
	elif [[ -d "$2" ]]; then
		find "$2" -type f -exec sha256sum {} + >> "$SECURE_FILE"
	else
		echo "Usage: $0 init/check/-check/update file/dir"
        	exit 1
	fi
fi


			
