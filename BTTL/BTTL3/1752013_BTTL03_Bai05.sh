#!/bin/bash
echo "Input a directory of file : "
read dir_path
while !(test -f $dir_path)
do
    echo "Re input directory of file :"
    read dir_path
done
