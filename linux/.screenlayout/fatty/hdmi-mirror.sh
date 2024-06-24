#!/bin/sh
# Mirror LVDS-1 1280
xrandr --output LVDS-1 --mode 1280x800 --pos 0x0 --rotate normal --output DP-2 --off --output DP-1 --off --output HDMI-1 --primary --mode 1280x800 --pos 0x0 --rotate normal --output VGA-1 --off
