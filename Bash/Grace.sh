#!/bin/bash

# Dr_Quine comment
CODE="$(cat "$0")"
GRACE='printf "%s" "$CODE" > Grace_kid.sh'
RUN='eval $GRACE'

eval "$RUN"