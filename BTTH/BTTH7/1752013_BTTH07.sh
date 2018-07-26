#!/bin/bash
makeAMakeFile() {
    local tenfiledaura=$1
   
    shift
    echo -n -e  "all: main.o"
    for i in $*
    do
	echo -n " "
	echo -n ${i/.c/.o}
    done

    echo -e " "
    echo -n -e "\tgcc -Wall $tenfiledaura main.o"
    for i in $*
    do
	echo -n " "
	echo -n ${i/.c/.o}
    done

    echo -e
    for i in $*
    do
	echo -e "${i/.c/.o}: $i ${i/.c/.h}"
	echo -e "\tgcc -Wall -c $i"
    done

    echo -n "main.o : main.c"
    for i in $*
    do
	echo -n " "
	echo -n ${i/.c/.h}
    done
    echo -e "\n\tgcc -Wall -c main.c"
    echo -e "clean:\n\trm -f *.o"
    echo -e "depend:\n\tmakedepend *.c"
}

#test, TinhToan la ten file dau ra, PhepToan.c la file .c
makeAMakeFile TinhToan PhepToan.c

