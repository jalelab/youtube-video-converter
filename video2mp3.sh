#!/bin/bash

which youtube-dl > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
	echo "youtube-dl .................[ found ]"
else
	sleep 1
	echo "[ X ] youtube-dl not found "
	sleep 1
	echo "installing it ^_^"

#checking you internet connection

	echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1

	if [ $? -ne 0 ]; then
        	echo  "[ X ]::[Internet Connection]: OFFLINE!;"
        	echo " Must have internet connection to download needed tools -__-"
        	sleep 1
        	exit
	else
        	echo "[✔]::[Internet Connection]: CONNECTED!;"
        	echo "Continueing ^__^"
        	sleep 1
		sudo apt-get update && apt-get upgrade -y && apt-get install youtube-dl -y
	fi
fi

URL=$1

# function: guide
guide () {
  echo "Youtube URL is required."
}

# function: download audio and convert to mp3
download_and_convert() {
  youtube-dl -f bestaudio $URL --extract-audio --audio-format mp3
}

# check parameter
if [ $# = 0 ]; then
  guide
else
  download_and_convert
fi
