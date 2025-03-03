#!/bin/bash

#Check if the filename is provided
if [ -z "$1" ]; then
echo "Usage: $0 <filename>"
exit 1
fi

fullpath="$1"
filename=$(basename "$fullpath")
dirpath=$(dirname "$fullpath")

if [[ "$filename" == "Extension.mjs"* ]]; then
    newfilename="extension.js"
    parentpath=$(dirname "$dirpath")
    mv "$fullpath" "$parentpath/out/$newfilename"
    echo "Renamed '$filename' to '$newfilename'"
fi