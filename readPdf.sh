#!/usr/bin/env bash

# Daniel Mendoza
# Robotics Engineer


# Notify-send will display the folder and file that you select!

IFS=$'\n'
declare -a pdfs
pdfs=($(du -a ~/Downloads | grep ".pdf" | cut -f2-)) # Replace ~/Dowloads to any directory where you save or store your pdf files.

# Replace font with one of your preference, try monospace in case any font is working.
choice=$(printf "%s\n" "${pdfs[@]##*/}" | \
	dmenu -l 20 -nf "#4D6784" -nb "#08111C" \
    -fn "Iosevka:size=16" \
    -p "BOOK: " -sf "#00AAAD" -sb "#004953" -i)
if [[ ! -z $choice ]]
then
	for i in "${!pdfs[@]}" ; do
		if [[ $choice == "${pdfs[$i]##*/}" ]] ; then
			_bookType="${pdfs[$i]%/*}"
            # comment next 3 lines if you do not have installed libnotify pkg.
			notify-send "$(echo -e "${_bookType##*/}\n" \
                | tr '[:lower:]' '[:upper:]')" "$choice" \
				-i $(echo "${PWD}/pdf.png")
			zathura "${pdfs[$i]}" &
			break
		fi
	done
fi
