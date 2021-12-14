#!/bin/bash

path1="/cygdrive/z/Downloads"
if [ ! "diff $(pwd) $path1" ]; then
    echo "ERROR: The working directory is not $path1 !!!!!"
    exit 0
fi

for file in $(find . -maxdepth 1 -name '*.zip');
do
    folder=$(echo $file | sed -e "s/^\.\/[ET]\([0-9]\{,2\}\)[_|.txt].*$/R\1/")
    unzip $file -d /cygdrive/z/pro1_TA2021/$folder
    echo $file | sed -e "s/^\.\/\+\(.*\)$/UnZIP \1 on $folder/"
    rm $file
done