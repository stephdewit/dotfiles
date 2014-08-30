set -e

for f in *.*; do
	if [ ! -f "$f" ]; then
		continue
	fi

	stream_count=$(mediainfo --Output="Video;%StreamCount%\n" "$f" | head -n 1)

	if [ "$stream_count" == "" ]; then
		echo "$f: can't count streams"
		continue
	fi

	if [ "$stream_count" -ne 1 ]; then
		mkdir -p Multi\ Stream
		mv "$f" Multi\ Stream/
		continue
	fi

	pixels=$(mediainfo --Output="Video;%Width%*%Height%" "$f" | bc)

	if [ "$pixels" == "" ]; then
		echo "$f: can't count pixels"
		continue
	fi

	if [ $pixels -lt 100000 ]; then
		folder="Very Small"
	elif [ $pixels -lt 200000 ]; then
		folder="Small"
	elif [ $pixels -lt 300000 ]; then
		folder="Medium"
	elif [ $pixels -lt 500000 ]; then
		folder="Large"
	else
		folder="Huge"
	fi

	mkdir -p "$folder"
	mv "$f" "$folder/"
done
