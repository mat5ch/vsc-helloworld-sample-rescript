#!/bin/bash

fullpath="$1"
filename=$(basename "$fullpath")
dirpath=$(dirname "$fullpath")
parentpath=$(dirname "$dirpath")

# Check if the folder exists, create it if not
if [[ ! -d "$parentpath/out" ]]; then
    mkdir "$parentpath/out"
fi

# Rename and move ReScript file to "out" folder
if [[ "$filename" == "Extension.mjs"* ]]; then
    newfilename="extension.js"
    mv "$fullpath" "$parentpath/out/$newfilename"
    echo "Renamed '$filename' to '$newfilename'"
fi