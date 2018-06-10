/bin/bash
#Ho Va Ten la : 
#MSSV la : 1752013
#Ten Bai Tap la : BTTH01

#3.1.1
echo "Hello World"

#3.1.4
MESSAGE="Hello World"
echo $MESSAGE

#3.1.5: Check so am duong
echo "Input a number"
read number
if [ $number -gt 0 ]
then
    echo "$number is a positive number"
else
    if [ $number -eq o ]
    then
	echo "$number is zero"
    fi
    echo "$number is a negative number"
fi

#3.1.6: Check so chan le
echo "Input a number"
read number
if [ $number % 2]
then
    echo "$number is odd"
else
    echo "$number is even"
fi

#3.1.7: In so tu 1 toi N
echo "Input a number"
read number
counter=1
while [ $counter -le $number ]
do
    echo $counter
    ((counter++))
done
