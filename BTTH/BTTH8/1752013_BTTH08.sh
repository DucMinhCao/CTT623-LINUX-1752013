#!/bin/bash
add()
{
    local input=$1
    echo -n "Input LastName : "
    read lastname
    echo -n "Input FirstName : "
    read firstname
    echo -n "Input PhoneNumber : "
    read phonenumber
    echo -n "Input Email : "
    read email
    echo -n "Input birthday : "
    read birth
    echo "Last Name : $lastname; First Name : $firstname; Phone : $phonenumber; Email : $email; BirthDay : $birth.">>$input
}

search()
{
    s=''
    local input=$1
    echo "Input a name to search : "
    read name
    s=$(grep --text "$name" $input)
    echo $s
}

delete()
{
    s=''
    local input=$1
    echo "input a name to delete : "
    read name
    s=$(grep --text "$name" $input)
    ${s##*.}
    echo $s >> $input
}

count()
{
   local input=$1
   i=0
   while read line
   do
       ((i++))
   done < $input
   echo $i
}
help()
{
    echo "1. Thao tac them vao danh ba "
    echo "2. Tim va xoa theo ten "
    echo "3.Tim theo ten"
    echo "4.Dem so muc co trong danh ba "
    echo "5.thoat ra "
}
while true
do  
    echo "==============MENU=============="
    echo "1.Them"
    echo "2.Xoa"
    echo "3.Tim"
    echo "4.Dem so muc trong danh ba"
    echo "5.Exit"
    echo "-h. Huong dan"
    echo "nhap vao lua chon cua ban "
    read chon
    case $chon in
	-h) help;;
	1) add $1;;
	2) delete $1;;
	3) search $1;;
	4) count $1;;
	5) exit 1;;
    esac
done	
	

