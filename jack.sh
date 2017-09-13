#!/bin/bash

echo  -e "Please enter first string: \c"
read str1
echo  -e " Please enter second strind: \c"
read str2
con=$str1$str2
length=$(echo -n $con |wc -m)
echo -e "The length of concatinated string is : $length"
