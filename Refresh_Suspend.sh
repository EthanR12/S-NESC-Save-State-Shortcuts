#!/bin/sh
#
# Script By Ethan Rector <EthanR12>
#

if [ -d /media/hakchi ]; then media=media; else media=var/lib; fi
if [ -d /media/hakchi ]; then savesloc=media/hakchi/saves; else savesloc=var/lib/clover/profiles/0; fi
find /$savesloc -maxdepth 2 \( -name "*.sram*" -o -name "*.png" -o -name "suspend*" -type d \) 2>/dev/null > /tmp/saves.txt
for i in $(ls /$media/hakchi/games); do
	if echo $i | grep -q "^s"; then cat /tmp/saves.txt | grep "suspend" | grep -o "CLV-.-.\{5\}" | sort -u > \
	/tmp/folder.txt; else cat /tmp/saves.txt | grep "png" | grep -o "CLV-.-.\{5\}" | sort -u > /tmp/folder.txt; fi
	grep -wril "name=suspend saves" /$media/hakchi/games/$i/*/CLV-S-*/*.desktop 2>/dev/null | while read match; do
		location=`echo $(dirname $match) | tail -c4`
		final=`find /$media/hakchi/games/$i/$location -maxdepth 0 -type d`
		mv $final/CLV-S-00000 /$media/hakchi/games/CLV-S-00000
		find $final/* -maxdepth 0 -type d 2>/dev/null | while read rmloop; do
			if [[ "$rmloop" == $final/CLV-L-* ]] || [[ "$rmloop" == $final/CLV-S-* ]]; then :; else rm -rf $rmloop; fi
		done
		mv /$media/hakchi/games/CLV-S-00000 $final/CLV-S-00000
		cat /tmp/folder.txt | while read j; do
			find /$media/hakchi/games/$i/*/$j -maxdepth 0 -type d 2>/dev/null | while read copy; do
				if grep -ql " (#)(" $copy/$j.desktop; then :; else if [ -d $final/$j ]; then :; else cp -rv $copy $final; fi; fi
			done
		done
	done
done
