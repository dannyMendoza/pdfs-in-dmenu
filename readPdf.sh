#!/usr/bin/env bash

# Daniel Mendoza
# Robotics Engineer

IFS=$'\n'
declare -a pdfs
pdfs=($(du -a ~/Desktop/Books/ | grep ".pdf" | cut -f2-))
choice=$(printf "%s\n" "${pdfs[@]##*/}" | \
	dmenu -l 20 -nf "#4D6784" -nb "#08111C" \
	-fn "xos4 Terminus:style=Bold:pixelsize=20" \
	-p "" -sf "#00AAAD" -sb "#004953" -i)
for i in "${!pdfs[@]}" ; do
    if [[ $choice == "${pdfs[$i]##*/}" ]] ; then
		notify-send "$choice" -i /home/danny/Pictures/1200px-PDF_file_icon.svg
		zathura "${pdfs[$i]}" &
		exit 0
    fi
done
