#!/bin/bash
path=/opt/firefox
link=https://ftp.mozilla.org/pub/firefox/releases/$1/linux-x86_64/en-US/firefox-$1.tar.bz2
tarfile=firefox-$1.tar.bz2
firepath=/usr/lib/firefox/

ls -d $path/$1 &>/dev/null
if [ $? -eq 0 ] 

then
	fversion=$1
else
	fversion=0
fi

if [ $1 != $fversion ]

then
	echo Firefox $1 isn\'t found locally. Downloading it from https://ftp.mozilla.org/pub/ﬁrefox/releases/
	echo Installing to /opt/firefox/$1
	sudo mkdir $path &>/dev/null
	sudo wget -q -P $path $link
	cd $path/
	sudo tar -jxf $path/$tarfile
	sudo mv firefox $1
	cd - &>/dev/null
	echo Cleaning up
	sudo rm -f $path/$tarfile
	sudo cp -r $path/$1/* $firepath &>/dev/null
	echo Firefox $1 has been activated.

else
	echo Firefox $1 present locally. Activating it.
	sudo cp -r $path/$1/* $firepath &>/dev/null
	echo Firefox $1 has been activated.
fi

export CURRENT_FIREFOX_VERSION=$1
