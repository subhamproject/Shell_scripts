#!/bin/bash
i=0
j=1
n=1
echo -e "Please enter value : \c"
read num

while [ $n -le $num ]
do
k=`expr $i + $j`
i=$j
j=$k
echo  $k
n=`expr $n + 1`
done
