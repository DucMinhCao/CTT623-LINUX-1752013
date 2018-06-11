#!/bin/bash
echo "Input a string : "
read str
while !(test $str)
do
    echo "Re input string : "
    read str
done
