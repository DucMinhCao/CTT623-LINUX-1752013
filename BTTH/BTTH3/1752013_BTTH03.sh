#!/bin/bash
echo "input directory : "
read dir_path
while !(test -d $dir_path)
do
    echo "Re Input"
    read dir_path
done
cd $dir_path
echo "Input Choice"
echo "1.To Delete Content Of Directory"
echo "0.To Exit Program"
read choice
if [ $choice -eq 1 ]
then
    rm $dir_path
    mkdir BTTL
    mkdir BTTH
    counter=1
    k=1
    while [ $counter -le 9 ]
    do
	mkdir BTTH/BTTH$counter
	mkdir BTTL/BTTL$counter
	touch BTTH/BTTH$counter/1752013.sh
	touch BTTL/BTTL$counter/1752013.sh
	chmod +x BTTH/BTTH$counter/1752013.sh
	chmod +x BTTL/BTTL$counter/1752013.sh
	((counter++))
    done 
    
    ls -la $dir_path/BTTL
    ls -la $dir_path/BTTH
    
    while [ $k -le 9 ]
    do
	for d in $dir_path/BTTH
	do
	    echo "/* ==============================
	    * Ho Va Ten : Cao Minh Duc
	    * MSSV : 1752013
	    * Ma Bai Tap : BTTH03
	    * =====================================
	    */" > $dir_path/BTTH/BTTH$k/1752013.sh
	    
	    echo "/*===============================
	    * Ho Va Ten : Cao Minh Duc
	    * MSSV : 1752013
	    * Ma Bai Tap : BTTH03
	    *======================================
	    */" > $dir_path/BTTL/BTTL$k/1752013.sh
	    ((k++))
	done
    done
    echo "Directory Init Complete"
else
    exit 1
fi






