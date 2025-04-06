#!/bin/bash

# Dr_Quine comment
num=5
CODE="$(cat "$0")"

if [ "$num" -gt 0 ]; then
    newnum=$((num - 1))
    newfile="Sully_${num}.sh"
    echo "$CODE" | sed -E "s/^num=[0-9]+$/num=$newnum/" > "$newfile"
    chmod +x "$newfile"
    ./"$newfile"
elif [ "$num" -eq 0 ]; then
    newfile="Sully_0.sh"
    echo "$CODE" | sed -E "s/^num=[0-9]+$/num=-1/" > "$newfile"
    chmod +x "$newfile"
fi
