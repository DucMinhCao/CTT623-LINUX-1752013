#!/bin/bash
echo "input a number "
read n
while ((n%2==1))
do
    #even number only !!!
    echo "Re input : "
    read n
done
