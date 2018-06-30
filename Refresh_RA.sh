#!/bin/sh
#
# Script By Ethan Rector <EthanR12>
#

short=media/hakchi/games
for i in $(ls /$short); do
	grep -wril "name=ra saves" /$short/$i/*/CLV-S-*/*.desktop | while read match; do
		location=`echo $(dirname $match) | tail -c4`
		final=`find /$short/$i/$location -maxdepth 0 -type d`
		if [ ! -f /tmp/"$i"ra_cache ]; then cat /$short/$i/*/*/*.desktop | awk '/^Exec=/{print}' | grep "CLV" \
		| sed -n -e 's/^.*\(CLV-.-.\{5\}\/\)/\1/p' | awk '{print $1}' | sort -u > /tmp/"$i"ra_cache; fi
		mv $final/CLV-S-00000 /$short/CLV-S-00000
		find $final/* -maxdepth 0 -type d 2>/dev/null | while read rmloop; do
			if [[ "$rmloop" == $final/CLV-L-* ]] || [[ "$rmloop" == $final/CLV-S-* ]]; then :; else rm -rf $rmloop; fi
		done
		mv /$short/CLV-S-00000 $final/CLV-S-00000
		for j in $(ls /media/data/ra_savestates); do
			number=`echo $j | sed -n -e 's/^.*state//p'`
			game="${j%.*}"
			folder=`grep "$game" /tmp/"$i"ra_cache | sed 's/^\(.\{11\}\).*/\1/'`
			if [ ! -d $final/$folder ]; then
				find /$short/$i/*/$folder -maxdepth 0 -type d 2>/dev/null | while read copy; do
					cp -r $copy $final
				done
			fi
			if [ -f $final/$folder/*.desktop ]; then cat $final/$folder/$folder.desktop | \
			sed "/^Name=/ s/$/ ("$number")/" > tmpfile.txt && mv tmpfile.txt $final/$folder/$folder.desktop; fi
		done
	done
done
