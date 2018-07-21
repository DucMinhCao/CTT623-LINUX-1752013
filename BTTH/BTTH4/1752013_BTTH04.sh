#!/bin/bash

FLAG_CountLine=false
FLAG_find=false
FLAG_all=false

showHelp()
{
    echo "$0 [-h|--help] [-a|--all] [-f|--find filename] [-c|--count filename] [dir]"
}

showAllFiles()
{
    if ! [ -d $1 ]
    then
	echo "duong dan k ton tai"
	exit 1
    done
    files="$1/*"
    for file in files
    do
	echo ${file##*/}
    done
}

findFile()
{
    local dir=$1
    local filename=$2
    for d in $dir
    do
	fname=${dir##*/}
	if [ $fname=$filename ]
	then
	    echo "$dir"
	fi
    done
}

countLines()
{
    local file=$1
    if ! [ -f $file ]
    then
	echo "File k ton tai"
	exit 1
    elif ! [ -r $file ]
    then
	echo "k co quyen doc file"
	exit 1
    else
	echo "${file##*/}"
	echo $(wc -l < $file)
    fi
}

showInfos()
{
    if $FLAG_CountLine
    then
	echo $(countLines /home/minhduc/input.txt)
    fi

    if $FLAG_find  #ham findfile nhan 2 tham so: duongdan, tenfile
    then
	echo $(findFile /home/minhduc/Downloads input.txt)
    fi

    if $FLAG_all
    then
	echo $(showAllFiles /home/minhduc)
    fi
}

if [ $# -lt 1 ]
then
    echo "Qua it tham so"
    exit 1
fi

while [ $# -ge 1 ]
do
    case $1 in
	-h|--help) showHelp
	    exit 1;;
	-a|--all) FLAG_all=true
	    shift;;
	-f|--find) FLAG_find=true
	    shift;;
	-c|--count) FLAG_count=true
	    shift;;
     esac
done
showInfos


