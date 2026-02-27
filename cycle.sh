#!/bin/sh
# Array of display name
displays=$(xrandr | grep " connected " | awk '{ print$1 }')
echo $displays
RESOLUTION=1920x1080
if [ "$1" ]; then
  echo "Extending Displays--------------------------------------------------------"
  for display in displays; do
    xrandr --output HDMI-1 --auto --right-of eDP-1
  done
  echo "Done!"
else
  echo "Duplicating Displays--------------------------------------------------------"
  xrandr --listmonitors | sed -n '1!p' | sed -e 's/\s[0-9].*\s\([a-zA-Z0-9\-]*\)$/\1/g' | xargs -n 1 -- bash -xc 'xrandr --output $0 --mode '$RESOLUTION' --pos 0x0 --rotate normal'
  echo "Done!"
fi
