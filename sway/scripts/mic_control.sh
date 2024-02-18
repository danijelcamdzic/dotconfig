#!/bin/bash

# Get the current mute state of the default source
MUTE_STATE=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')

if [ "$MUTE_STATE" = "yes" ]; then
    # If muted, unmute and turn off the LED
    pactl set-source-mute @DEFAULT_SOURCE@ 0
    echo 0 > /sys/class/leds/platform::micmute/brightness
else
    # If unmuted, mute and turn on the LED
    pactl set-source-mute @DEFAULT_SOURCE@ 1
    echo 1 > /sys/class/leds/platform::micmute/brightness
fi
