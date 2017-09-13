#!/bin/bash
LINES=0
echo -n "Enter the number of Lines (5 to 10): "
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
