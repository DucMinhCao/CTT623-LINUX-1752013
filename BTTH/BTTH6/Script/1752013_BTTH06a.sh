#!/bin/bash

FLAG_DISPPLAY=false
FLAG_GetEven=false
FLAG_GetOdd=false
FLAG_GetMax=false
FLAG_GetMin=false

getLengthlist()
{
    echo "so luong so nguyen trong tham so la : $#"
}

displayList()
{
    echo $(getLengthlist $*)
    echo -e "\nNumbers : "
    while [ $# -gt 0 ]
    do
	echo $1
	shift
    done
}

getEvenNumbers()
{
    echo "Even Numbers : "
    while [ $# -gt 0 ]
    do
	if (($1 % 2 == 0))
	then
	    echo $1
        fi
	shift
    done
}

getOddNumbers()
{
    echo "Odd Numbers : "
    while [ $# -gt 0 ]
    do
	if (($1 % 2 != 0))
	then
	    echo $1
	fi
	shift
    done
}

getMax()
{
    max=$1
    while [ $# -gt 0 ]
    do
	if [ $1 > $max ]
	then
	    max=$1
	fi
    shift
    done
    echo "Max : $max"
}

getMin()
{
    min=$1
    while [ $# -gt 0 ]
    do
	if [ $1 -lt $min ]
	then
	    min=$1
	fi
	shift
    done
    echo "Min: $min"
}

getValueAt() #vi tri bat dau la 1
{
    local vitri=$1
    temp=1
    if [ $vitri -gt $# ]
    then
	echo "Vi tri k hop le"
	exit 1
    fi
    while [ $temp -le $vitri ]
    do
	shift
	((temp++))
    done
    echo "Gia tri o vi tri $vitri la : $1"
}

showInfos()
{
    if $FLAG_DISPLAY
    then
	displayList $*
    fi
    if $FLAG_GetEven
    then
	getEvenNumbers $*
    fi
    if $FLAG_GetOdd
    then
	getOddNumbers $*
    fi
    if $FLAG_GetMax
    then
	getMax $*
    fi
    if $FLAG_GetMin
    then
	getMin $*
    fi
    if $FLAG_GetValue
    then
	getValueAt $vitri $*
    fi
}

readFile()
{
    local file=$1
    if ! [ -f $dir ]
    then
	echo "$file k ton tai">/dev/stderr
	exit 1
    fi
}

process()
{
    local input=$1
    local output=$2
    if readFile $input
    then
	while read line
	do
	    echo $(showInfos $line)>>$output
	done < $input
    fi
}

if [ $# -lt 2 ]
then
    echo "too few elements"
    exit 1
fi

while [ $# -ge 2 ]
do
    echo "Nhap vi tri muon lay gia tri : "
    read vitri
    FLAG_GetValue=true
    shift
    FLAG_DISPLAY=true
    shift
    FLAG_GetMin=true
    shift
    FLAG_GetMax=true
    shift
    FLAG_GetEven=true
    shift
    FLAG_GetOdd=true
    shift
done

    
input=$1
output=$2
process input.txt output.txt 

