#!/bin/bash

path1="/cygdrive/z/pro1_TA2021/number.txt"
path2="test.txt"
if [ ! -f $path2 ]; then
    echo > $path2
    cat << EOS

==============================
|        CREATES FILE        |
==============================
EOS
    vim $path2
    exit 0
fi

cat $path1 | while read line1
do
    echo -e "\e[31m$line1 \e[m" \\n
    count=1
    cat $path2 | while read line2
    do
        echo -e "\e[32mTest $count \e[m"
        echo $line2 | ./$line1
        echo -e \\n
        count=$(($count+1))
    done
    echo "======================"
done