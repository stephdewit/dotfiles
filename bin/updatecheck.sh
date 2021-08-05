#!/bin/sh

sudo emerge --sync -q
result=$(emerge -puvND --with-bdeps=y world)

count=$(echo "$result" | grep -oP '\d+(?= package)')

if [ "$count" -gt 0 ]; then
	size=$( \
		echo "$result" | \
		grep -oP '(?<=Size of downloads: )[\d,]+ [a-zA-Z]+')

	plural='s'
	[ "$count" -eq 1 ] && plural=''
	subject="[$(hostname)] $count update$plural available ($size)"	

	echo "$result" | mail -s "$subject" stephdewit

	ifttt \
		update_available \
		"$(hostname)" \
		"$count package$plural ($size)" \
		"$result"
fi
