#!/bin/bash

echo -n "Please enter the value:"
read LINES

for (( i=1; i<=LINES; i++ ))
do
 for (( j=LINES; j>=i; j-- ))
do
echo -n " "
done
 for (( k=1; k<=i; k++ ))
 do
  echo -n " *"
 done
 echo ""
done
