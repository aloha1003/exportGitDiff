#!/bin/bash
unset n
while read -r line; do
  echo $line
  : $((n++))
done < delete_file_list.txt
sed "1,$n d" delete_file_list.txt
