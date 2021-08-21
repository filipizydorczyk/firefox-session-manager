#!/bin/bash

STORAGE_DIRECTORY="$HOME/.figer-sessions"
MOZILLA_DIRECTORY="$HOME/.mozilla"
NAME_FILE=".figer-session-name"

COMMAND="$1"
SESSION_NAME="$2"

mkdir -p "$STORAGE_DIRECTORY"
if [ ! -f "$MOZILLA_DIRECTORY/$NAME_FILE" ]; then
    echo "default" >>"$MOZILLA_DIRECTORY/$NAME_FILE"
fi

case $COMMAND in
list)
    ls "$STORAGE_DIRECTORY" || echo
    ;;
add)
    echo "$STORAGE_DIRECTORY/$SESSION_NAME"
    mkdir "$STORAGE_DIRECTORY/$SESSION_NAME"
    echo "$SESSION_NAME" >>"$STORAGE_DIRECTORY/$SESSION_NAME/$NAME_FILE"
    echo "New empty session added"
    ;;
switch)
    echo "See you again 2!"
    ;;
rm)
    rm -rf "$STORAGE_DIRECTORY/$SESSION_NAME"
    echo "Session removed"
    ;;
*)
    echo "No action to perform"
    ;;
esac
