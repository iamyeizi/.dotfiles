#!/bin/sh
# eDP-1 2880 | HDMI-3 1920
xrandr --output eDP-1 --primary --mode 2880x1800 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --off --output HDMI-3 --mode 1920x1080 --pos 2880x0 --rotate normal
