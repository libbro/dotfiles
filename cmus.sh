#!/bin/bash
i3status | (read line && echo $line && read line && echo $line && while :

do
#Variables for cmus songs and artist titles respectively
song=$(cmus-remote -Q | grep "tag title" | cut -d ' ' -f 3-)
artist=$(cmus-remote -Q | grep "tag artist" | cut -d ' ' -f 3-)
	read line
	#Uses the pidof command to determine whether cmus is running or not, if it is true then it will return the info
	if [ $(pidof cmus) > 0 ]; then
	dat=$(echo "$song - $artist")
	dat="[{ \"full_text\": \"${dat}\" },"
	echo "${line/[/$dat}" || exit 1
else
	#if not then it doesn't
	echo "$line"
fi
done)
