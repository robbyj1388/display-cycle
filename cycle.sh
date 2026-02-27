#!/usr/bin/env bash

set -euo pipefail

# Ensure user is running X11
if [ "${XDG_SESSION_TYPE:-}" != "x11" ]; then
    echo "Error: This script requires x11."
    exit 1
fi

# Get connected displays
mapfile -t DISPLAYS < <(xrandr --query | awk '/ connected/ {print $1}')

if [ "${#DISPLAYS[@]}" -lt 2 ]; then
    echo "Only one display detected. Nothing to toggle."
    exit 0
fi

PRIMARY="${DISPLAYS[0]}"

# Detect current mode
# If multiple monitors share position 0x0 then assume duplicate
DUPLICATE_COUNT=$(xrandr --query | grep " connected" | grep "+0+0" | wc -l)

if [ "$DUPLICATE_COUNT" -gt 1 ]; then
    CURRENT_MODE="duplicate"
else
    CURRENT_MODE="extend"
fi

echo "Current mode: $CURRENT_MODE"

# Toggle Mode
if [ "$CURRENT_MODE" = "duplicate" ]; then
    echo "Switching to EXTENDED mode..."

    xrandr --output "$PRIMARY" --auto --primary
    PREV="$PRIMARY"

    for ((i=1; i<${#DISPLAYS[@]}; i++)); do
        CURRENT="${DISPLAYS[$i]}"
        xrandr --output "$CURRENT" --auto --right-of "$PREV"
        PREV="$CURRENT"
    done

else
    echo "Switching to DUPLICATE mode..."

    xrandr --output "$PRIMARY" --auto --primary

    for ((i=1; i<${#DISPLAYS[@]}; i++)); do
        CURRENT="${DISPLAYS[$i]}"
        xrandr --output "$CURRENT" --auto --same-as "$PRIMARY"
    done
fi

echo "Done!"
