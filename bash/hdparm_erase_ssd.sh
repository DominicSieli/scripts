#!/usr/bin/env bash

read -p "Drive: " drive
read -p "Password: " password

umount $drive
hdparm --user-master u --security-set-pass $password $drive
hdparm --user-master u --security-erase-enhanced $password $drive
hdparm --user-master u --security-unlock $password $drive
hdparm --user-master u --security-disable $password $drive
