#!/bin/bash

while read -r file; do
    file_type="$(file -b "$file")"
    if ([[ "$file_type" == *"document"* ]] || [[ "$file_type" == *"image"* ]])
    then
        echo "$file"
    fi
done < "$1"