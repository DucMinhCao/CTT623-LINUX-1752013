#!/bin/bash
echo "Input a number (string) :"
read n
case "$n" in
    [oO] | [oO][nN][eE] ) echo "One";;
    [tT] | [tT][wW][oO] ) echo "Two";;
    [tT] | [tT][hH][rR][eE][eE] ) echo "Three";;
    [fF] | [fF][oO][uU][rR] ) echo "Four";;
    [fF] | [fF][iI][vV][eE] ) echo "Five";;
    [sS] | [sS][iI][xX] ) echo "Six";;
    [sS] | [sS][eE][vV][eE][nN] ) echo "Seven";;
    [eE] | [eE][iI][gG][hH][tT] ) echo "Eight";;
    [nN] | [nN][iI][nN][eE] ) echo "Nine";;
    [tT] | [tT][eE][nN] ) echo "Ten";;
esac
