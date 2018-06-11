#!/bin/bash
echo "Input a directory of file : "
read dir_path
if !(test -f $dir_path)
then
    echo "file not exist"
else
    echo "file exist"
    cat $dir_path
fi


