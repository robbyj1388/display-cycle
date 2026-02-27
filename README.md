# display-cycle
display-cycle is a simple Bash script that uses xrandr to automatically toggle between Extended and Duplicated display modes on Linux systems running **ONLY X11**.

It detects your current layout and switches to the opposite mode — no arguments required.

Designed for users who frequently connect laptops to external monitors, docks, or projectors and want a fast, no-terminal solution.

## Features

Toggle between Extend Displays and Duplicate Displays

Lightweight and fast

Uses native Linux display management via xrandr

Ideal for laptops connected to external monitors or projectors

## Requirements

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

## Usage

Simply run:
```
display-cycle
```
| Current Mode | Running display-cycle Will |
| :---: | :---: |
| Extended | Switch to Duplicate |
| Duplicate | Switch to Extended |

No flags or arguments needed.

## Installation

Clone or download this repository.

Make the script executable:

`chmod +x display-cycle`

**(Optional)** Move it to a directory in your $PATH:

`sudo mv display-cycle /usr/local/bin/`
