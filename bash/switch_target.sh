#!/usr/bin/env bash

read -p "tty or gui? " target

if [ ${target} = 'gui' ]; then
	sudo systemctl set-default graphical.target
	sudo reboot now
fi

if [ ${target} = 'tty' ]; then
	sudo systemctl set-default multi-user.target
	sudo reboot now
fi
