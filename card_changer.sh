#!/bin/bash

TARGET_FILE="/etc/pve/lxc/100.conf"

# Find reference file (card0 or card1)
REFERENCE_FILE=$(ls /dev/dri | grep -E '^card[01]$' | head -n 1)

# Validate reference file
if [[ -z "$REFERENCE_FILE" ]]; then
    echo "No valid reference file (card0 or card1) found."
    exit 1
fi

# Determine replacement string
NEW_STRING=$REFERENCE_FILE

# Perform substitution in the target file
sed -i "s/card[01]/$NEW_STRING/g" "$TARGET_FILE"

#echo "Substitution complete: Replaced occurrences with '$NEW_STRING' in $TARGET_FILE"
