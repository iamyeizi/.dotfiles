#!/bin/sh
# LVDS-1 1280 | HDMI-1 1920
xrandr --output LVDS-1 --primary --mode 1280x800 --pos 0x0 --rotate normal --output DP-2 --off --output DP-1 --off --output HDMI-1 --mode 1920x1080 --pos 1280x0 --rotate normal --output VGA-1 --off
