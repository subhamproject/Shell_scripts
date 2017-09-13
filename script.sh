#!/bin/bash
J=0
for I in `cat file.txt|tr '\n' ' '`
do
if [ "$I" -gt "$J" ]
then
J=$I
fi
done
echo  "Highest numnber is \"$J\" :"
