#/bin/#!/usr/bin/env bash

input= "test.txt"

while IFS= read -r line
do
  echo "$line"
done < "$input"

#if [[dig +short test.openresolver.com "$line" == *"open-resolver-detected" ]]; then
#  echo "$line"
#fi
