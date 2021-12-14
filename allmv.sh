#!/bin/bash

path1="/cygdrive/z/Downloads"
if [ ! "diff $(pwd) $path1" ]; then
    echo "ERROR: The working directory is not $path1 !!!!!"
    exit 0
fi

path2="/cygdrive/z/pro1_TA2021/number.txt"
if [ ! "$(cat $path2 | grep $1 )" ]; then
    echo "ERROR: There is not $1 in $path2"
    exit 0
fi

for file in $(find . -maxdepth 1 -name '*.c' -or -name '*.txt');
do
    folder1=$(echo $file | sed -e "s/^\.\/[ET]\([0-9]\{,2\}\)[_|.txt].*$/R\1/")
    folder2=$(echo $file | sed -e "s/^\.\/\(.*\)$/\1/")
    extension=$(echo $file | sed -e "s/^.*\.\(.*\)$/\1/")
    mv -f $file "/cygdrive/z/pro1_TA2021/$folder1/$folder2-1/$1.$extension"
    echo $file | sed -e "s/^\.\/\+\(.*\)$/Move \1 on $folder1\/$folder2-1/"
done