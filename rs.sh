#!/bin/bash
# Declare array
declare -a ARRAY
# Link filedescriptor 10 with stdin
exec 10<&0
# stdin replaced with a file supplied as a first argument
exec < $1
let count=0
declare res
comp='open-resolver-detected'

while read LINE; do
    res=`dig +short test.openresolver.com TXT @$LINE`
    echo $res
    if [[ "$res" == *"$comp"* ]]; then
      ARRAY[$count]=$LINE
      ((count++))
    fi
done

echo Number of elements: ${#ARRAY[@]}
# echo array's content
echo ${ARRAY[@]}
# restore stdin from filedescriptor 10
# and close filedescriptor 10
exec 0<&10 10<&-
