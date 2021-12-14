#!/bin/bash

path="/cygdrive/z/pro1_TA2021/number.txt"

cat $path | while read line
do
    gcc -g -Wall $line.c -o $line
done
