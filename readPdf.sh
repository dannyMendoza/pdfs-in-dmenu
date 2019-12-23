#!/usr/bin/env bash

# Daniel Mendoza
# Robotics Engineer


# Notify-send display the folder and file that you select!

IFS=$'\n'
declare -a pdfs
pdfs=($(du -a ~/Desktop/Books/ | grep ".pdf" | cut -f2-))
choice=$(printf "%s\n" "${pdfs[@]##*/}" | \
	dmenu -l 20 -nf "#4D6784" -nb "#08111C" \
	-fn "xos4 Terminus:style=Bold:pixelsize=20" \
	-p "" -sf "#00AAAD" -sb "#004953" -i)
if [[ ! -z $choice ]]
then
	for i in "${!pdfs[@]}" ; do
		if [[ $choice == "${pdfs[$i]##*/}" ]] ; then
			_bookType="${pdfs[$i]%/*}"
			notify-send "$(echo -e "${_bookType##*/}\n" \
				| tr '[:lower:]' '[:upper:]')" "$choice" \
				-i $(echo "${PWD}/pdf.png")
			zathura "${pdfs[$i]}" &
			break
		fi
	done
fi
