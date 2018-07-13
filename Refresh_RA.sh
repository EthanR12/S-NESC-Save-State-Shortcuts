#!/bin/sh
#
# Script By Ethan Rector <EthanR12>
#

short=media/hakchi/games
for i in $(ls /$short); do

if echo $i | grep -q "^s"; then :; else if [ ! -f /tmp/"$i"_racache.txt ]; then \
cat /$short/$i/*/*/*.desktop | awk '/^Exec=/{print}' | sed -n 's/^.*\(CLV-.-.\{5\}\/\)/\1/p' \
| awk '{print $1}' | sort -u > /tmp/"$i"_racache.txt; fi; fi

find /media/data/ra_savestates -name "*state*" | sed -n 's/^.*_savestates\///p' > /tmp/rasave.txt

if echo $i | grep -q "^s"; then cat /tmp/rasave.txt | grep "CLV" \
| sed -n "s/.state/ /p" | sort -k1,1 -k2n > /tmp/"$i"_saves.txt; else cat /tmp/rasave.txt \
| grep -v "CLV" | sed -n "s/.state/ /p" | sort -k1,1 -k2n > /tmp/"$i"_saves.txt; fi

grep -wril "name=ra saves" /$short/$i/*/CLV-S-*/*.desktop | while read match; do

location=`echo $(dirname $match) | tail -c4`
final=`find /$short/$i/$location -maxdepth 0 -type d`

mv $final/CLV-S-00000 /$short/CLV-S-00000

find $final/* -maxdepth 0 -type d 2>/dev/null | while read rmloop; do
	if [[ "$rmloop" == $final/CLV-L-* ]] || [[ "$rmloop" == $final/CLV-S-* ]]; then :; else rm -rf $rmloop; fi
done

mv /$short/CLV-S-00000 $final/CLV-S-00000

cat /tmp/"$i"_saves.txt | while read j; do

number=`echo $j | sed -n 's/^.* //p'`
game="${j% *}"

if echo $i | grep -q "^s"; then folder=`grep "$game" /tmp/"$i"_saves.txt | grep -o "CLV-.-.\{5\}" \
| sort -u`; else folder=`grep "/$game[\.$]" /tmp/"$i"_racache.txt | grep -o "CLV-.-.\{5\}"`; fi

if echo $folder | grep -q " "; then folder=`echo $folder | grep -o "CLV-U-.\{5\}"`; fi

find /$short/$i/*/$folder -maxdepth 0 -type d 2>/dev/null | while read copy; do
	if [ -d $final/$folder ]; then :; else cp -r $copy $final; fi
done

cat $final/$folder/$folder.desktop 2>/dev/null | sed "/^Name=/ s/$/ ("$number")/" \
> tmp.txt && mv tmp.txt $final/$folder/$folder.desktop

done
done
done
