#!/usr/bin/env bash

TOUCHPAD_ID=10

if ! xinput list | grep -q "id=$TOUCHPAD_ID"; then
	echo "Touchpad not found."
	exit 1
fi

ENABLED=$(xinput list-props "$TOUCHPAD_ID" | grep "Device Enabled" | awk '{print $NF}')

if [ "$ENABLED" -eq 1 ]; then
	xinput disable "$TOUCHPAD_ID"
	notify-send "Touchpad disabled."
else
	xinput enable "$TOUCHPAD_ID"
	notify-send "Touchpad enabled."
fi
