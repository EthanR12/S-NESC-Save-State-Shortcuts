#!/bin/sh
#
# Script By Ethan Rector <EthanR12>
#

if [ -d /media/hakchi ]; then media=media; else media=var/lib; fi
if [ -d /media/hakchi ]; then savesloc=media/hakchi/saves; else savesloc=var/lib/clover/profiles/0; fi
system=`ls /$media/hakchi/games`
match=`grep -wril "name=saves" /$media/hakchi/games/$system/000/*/*.desktop`
location=`echo $(dirname $match) | tail -c4`
final=`find /$media/hakchi/games/$system/$location -maxdepth 0 -type d`
mv $final/CLV-S-00000 /$media/hakchi/games/$system/000/CLV-S-00000
rm -rf $final
mkdir $final
mv /$media/hakchi/games/$system/000/CLV-S-00000 $final/CLV-S-00000
find /$savesloc -maxdepth 2 \( -name "*.sram" -o -name "*.png" -o -name "suspend*" -type d \) | while read file; do
	found="$(basename $(dirname $file))"
	find /$media/hakchi/games/$system/*/$found -maxdepth 0 -type d | while read copy; do
		if [ -d $final/$found ]; then :; else cp -r $copy $final; fi
	done
done
