#!/bin/bash
echo "Input a number : "
read n
if ((n%2==1))
then
    echo "$n is odd number"
else
    echo "$n is an even number"
fi

