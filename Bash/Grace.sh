#!/bin/bash

CODE="$(cat "$0")"
GRACE='printf "%s" "$CODE" > Grace_kid.sh'
RUN='# This macro is a comment
main() {
    eval $GRACE
    echo "$CODE"
}

main'

eval "$RUN"