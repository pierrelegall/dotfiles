#!/usr/bin/env sh

if [ $# -ne 1 ]; then
    echo "Error: first argument should be the file to open" >&2
    exit 1
fi

FILE=$1

emacsclient "$FILE"
emacsclient --no-wait --eval "(select-frame-set-input-focus (selected-frame))" &>/dev/null
