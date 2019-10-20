#!/usr/bin/env bash

# Daniel Mendoza
# Robotics Engineer

IFS=$'\n'
declare -a pdfs
pdfs=($(ls /mnt/ehdd/Books/* | grep ".pdf" ))
choice=$(printf "%s\n" "${pdfs[@]##*/}" | dmenu -l 20 -y 6 -nf "#43888E" -nb "#001F24" -fn "xos4 Terminus:style=Bold:size=18" -p "" -sf "#8ABDC7" -sb "#001F24" -i -f)
notify-send "$choice" -i /usr/share/icons/HALODARK/apps/scalable/pdfshuffler.svg
for i in "${!pdfs[@]}" ; do
    if [[ $choice == "${pdfs[$i]##*/}" ]] ; then
	zathura "${pdfs[$i]}"
    fi
done
