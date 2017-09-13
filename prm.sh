#!/bin/bash
echo -e "Please enter your number: \c"
read num

if [ `expr $num / 2` -ne 0 ]
then
echo "number is even"
else
echo "number is odd"
fi
