#!/bin/sh
#
# Script By Ethan Rector <EthanR12>
#

if [ -d /media/hakchi ]; then
	system=`ls /media/hakchi/games`
	match=`grep -wril "name=saves" /media/hakchi/games/$system/000/*/*.desktop`
	location=`echo $(dirname $match) | tail -c4`
	final=`find /media/hakchi/games/$system/$location -maxdepth 0 -type d`
	mv $final/CLV-S-00000 /media/hakchi/games/$system/000/CLV-S-00000
	rm -rf $final
	mkdir $final
	mv /media/hakchi/games/$system/000/CLV-S-00000 $final/CLV-S-00000
	find /media/hakchi/saves -maxdepth 2 -name "*.sram" | while read file; do
		found="$(basename $(dirname $file))"
		find /media/hakchi/games/$system/*/$found -type d | while read copy; do
			cp -r $copy $final
		done
	done
else
	system=`ls /var/lib/hakchi/games`
	match=`grep -wril "name=saves" /var/lib/hakchi/games/$system/000/*/*.desktop`
	location=`echo $(dirname $match) | tail -c4`
	final=`find /var/lib/hakchi/games/$system/$location -maxdepth 0 -type d`
	mv $final/CLV-S-00000 /var/lib/hakchi/games/$system/000/CLV-S-00000
	rm -rf $final
	mkdir $final
	mv /var/lib/hakchi/games/$system/000/CLV-S-00000 $final/CLV-S-00000
	find /var/lib/clover/profiles/0 -maxdepth 2 -name "*.sram" | while read file; do
		found="$(basename $(dirname $file))"
		find /var/lib/hakchi/games/$system/*/$found -type d | while read copy; do
			cp -r $copy $final
		done
	done
fi
