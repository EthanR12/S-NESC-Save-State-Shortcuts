#!/bin/sh
#
# Script By Ethan Rector <EthanR12>
#

if [ -d /media/hakchi ]; then media=media; else media=var/lib; fi
if [ -d /media/hakchi ]; then savesloc=media/hakchi/saves; else savesloc=var/lib/clover/profiles/0; fi
for i in $(ls /$media/hakchi/games); do
	grep -wril "name=saves" /$media/hakchi/games/$i/*/CLV-S-*/*.desktop 2>/dev/null | while read match; do
		location=`echo $(dirname $match) | tail -c4`
		final=`find /$media/hakchi/games/$i/$location -maxdepth 0 -type d`
		mv $final/CLV-S-00000 /$media/hakchi/games/CLV-S-00000
		find $final/* -maxdepth 0 -type d 2>/dev/null | while read rmloop; do
			if [[ "$rmloop" == $final/CLV-L-* ]] || [[ "$rmloop" == $final/CLV-S-* ]]; then :; else rm -rf $rmloop; fi
		done
		mv /$media/hakchi/games/CLV-S-00000 $final/CLV-S-00000
		find /$savesloc -maxdepth 2 -name "*.sram" 2>/dev/null | while read file; do
			found="$(basename $(dirname $file))"
			find /$media/hakchi/games/$i/*/$found -maxdepth 0 -type d 2>/dev/null | while read copy; do
				if [ -d $final/$found ]; then :; else cp -r $copy $final; fi
			done
		done
	done
done
