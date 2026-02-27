# display-cycle
display-cycle is a simple Bash script that uses xrandr to quickly switch between extended and duplicated (mirrored) display modes on Linux systems running X11.

It’s designed for users who frequently connect to external monitors and want a fast, no-frills way to change display configurations from the terminal.

##Features

Toggle between Extend Displays and Duplicate Displays

Lightweight and fast

Uses native Linux display management via xrandr

Ideal for laptops connected to external monitors or projectors

##Requirements

Linux with X11

xrandr installed

Most distributions include xrandr by default. If not, install it using your package manager:
```
# Debian / Ubuntu
sudo apt install x11-xserver-utils
```
```
# Arch
sudo pacman -S xorg-xrandr
```
```
# Fedora
sudo dnf install xrandr
```

##Usage

###Extend Displays

Extends your desktop across connected monitors:
```
display-cycle extend
```

###Duplicate Displays

Mirrors your primary display to other connected monitors:
```
display-cycle
```

##Installation

Clone or download this repository.

Make the script executable:

`chmod +x display-cycle`

(Optional) Move it to a directory in your $PATH:

`sudo mv display-cycle /usr/local/bin/`
