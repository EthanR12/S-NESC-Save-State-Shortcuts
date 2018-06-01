#!/bin/sh
#
# Script By Ethan Rector <EthanR12>
#

system=`ls /media/hakchi/games`
home="ENTER SAVES FOLDER NUMBER HERE"
final="/media/hakchi/games/$system/$home"
grep -ril "name=saves" /media/hakchi/games/$system/000 | while read match; do
	folder="$(dirname -- "$match")"
	location=`echo $folder | tail -c4`
	final="$(find /media/hakchi/games/*/ -name "$location")"
	mv $final/CLV-S-00000 /media/hakchi/games/$system/000/CLV-S-00000
	rm -rf $final
	mkdir $final
	mv /media/hakchi/games/$system/000/CLV-S-00000 $final/CLV-S-00000
	find /media/hakchi/saves -name "*.sram" | while read file; do
		base="$(dirname -- "$file")"
		found="$(basename "$base")"
			find /media/hakchi/games/$system/*/$found -type d | while read copy; do
				cp -r "$copy" $final
			done
	done
done
