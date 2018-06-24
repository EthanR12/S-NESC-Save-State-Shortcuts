#!/bin/sh
#
# Script By Ethan Rector <EthanR12>
#

short=media/hakchi/games
for i in $(ls /$short); do
	grep -wril "name=ra saves" /$short/$i/*/CLV-S-*/*.desktop | while read match; do
		location=`echo $(dirname $match) | tail -c4`
		final=`find /$short/$i/$location -maxdepth 0 -type d`
		if [ -f /tmp/"$i"ra_cache ]; then
			:
		else
			cat /$short/$i/*/*/*.desktop | awk '/^Exec=/{print}' | grep "CLV" | sed -n -e 's/^.*\(CLV-.-.\{5\}\/\)/\1/p' | awk '{print $1}' > /tmp/"$i"ra_cache
		fi
		mv $final/CLV-S-00000 /$short/CLV-S-00000
		find $final/* -maxdepth 0 -type d 2>/dev/null | while read rmloop; do
			if [[ "$rmloop" == $final/CLV-L-* ]] || [[ "$rmloop" == $final/CLV-S-* ]]; then :; else rm -rf $rmloop; fi
		done
		mv /$short/CLV-S-00000 $final/CLV-S-00000
		for j in $(ls /media/data/ra_savestates); do
			game="${j%.*}"
			grep "$game" /tmp/"$i"ra_cache | sed -n -e 's/^\(.\{11\}\).*/\1/p'| while read folder; do
				find /$short/$i/*/$folder -maxdepth 0 -type d 2>/dev/null | while read copy; do
					if [ -d $final/$folder ]; then :; else cp -r $copy $final; fi
				done
			done
		done
	done
done
