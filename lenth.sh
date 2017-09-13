#!/bin/bash

echo "Enter string"
read str

length=`echo $str | wc -c`
length=`echo $length - 1 |bc`
if [ $length -lt 10 ]
then
        echo "You enter less than 10 character"
fi
 
