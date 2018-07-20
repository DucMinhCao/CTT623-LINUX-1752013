#!/bin/bash
FLAG_Count=false
FLAG_Count1=false
FLAG_Display=false
count()
{
    echo ". So tu co trong file la : $#. "
}

display()
{
    while [ $# -gt 0 ]
    do
	echo $1
	shift
    done
}

count1()
{
    tu=$1
    temp=0
    shift
    while [ $# -gt 0 ]
    do
	if [ $tu = $1 ]
	then
	    ((temp++))
	fi	
	shift
    done
    echo " Tu $tu xuat hien : $temp lan"
}

showInfos()
{
    if $FLAG_Display
    then
	display $*
    fi
    if $FLAG_Count
    then
	count $*
    fi
    if $FLAG_Count1
    then
	count1 $tu $*
    fi
}

process() #luu y : phai tao file input trc, em k viet ham` test file input ton` tai:)
{
    local input=$1
    local output=$2
    while read line
    do
	echo $(showInfos $line)>>$output
    done < $input
}

if [ $# -lt 2 ]
then
    echo "too few elements"
fi

while [ $# -ge 2 ]
do
    echo "Nhap Tu Muon Dem So Lan xuat hien"
    read tu
    FLAG_Display=true
    shift
    FLAG_Count=true
    shift
    FLAG_Count1=true
    shift
done

intput=$1
output=$2
process input.txt output.txt

