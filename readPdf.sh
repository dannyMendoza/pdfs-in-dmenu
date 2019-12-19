#!/usr/bin/env bash

# Daniel Mendoza
# Robotics Engineer

IFS=$'\n'
declare -a pdfs
pdfs=($(du -a /mnt/ehdd/Books/ | grep ".pdf" | cut -f2-))
choice=$(printf "%s\n" "${pdfs[@]##*/}" | dmenu -l 20 -nf "#4D6784" -nb "#08111C" -fn "xos4 Terminus:style=Bold:pixelsize=20" -p "" -sf "#00AAAD" -sb "#004953" -w 900 -i -f)
notify-send "$choice" -i /usr/share/icons/candy-icons/apps/scalable/zathura.svg
for i in "${!pdfs[@]}" ; do
    if [[ $choice == "${pdfs[$i]##*/}" ]] ; then
		zathura "${pdfs[$i]}" &
		exit 0
    fi
done
