#!/bin/bash

STORAGE_DIRECTORY="$HOME/.figer-sessions"
MOZILLA_DIRECTORY="$HOME/.mozilla"
NAME_FILE=".figer-session-name"

COMMAND="$1"
SESSION_NAME="$2"

# init
mkdir -p "$STORAGE_DIRECTORY"
if [ ! -f "$MOZILLA_DIRECTORY/$NAME_FILE" ]; then
    echo "default" >>"$MOZILLA_DIRECTORY/$NAME_FILE"
fi

# default session protection

if [ "$SESSION_NAME" == "default" ] && [ ! "$COMMAND" == "switch" ]; then
    echo "You can use default session only with switch command"
    exit
fi

# main

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
    CURRENT_SESSION=$(cat "$MOZILLA_DIRECTORY/$NAME_FILE")
    if [ ! -d "$STORAGE_DIRECTORY/$SESSION_NAME" ]; then
        echo "Given session could not be find!"
        exit
    fi

    mv "$MOZILLA_DIRECTORY" "$STORAGE_DIRECTORY/$CURRENT_SESSION"
    mv "$STORAGE_DIRECTORY/$SESSION_NAME" "$MOZILLA_DIRECTORY"
    ;;
rm)
    SESSION_TO_REMOVE="$STORAGE_DIRECTORY/$SESSION_NAME"
    if [ ! -f "$SESSION_TO_REMOVE" ]; then
        rm -rf "$SESSION_TO_REMOVE"
    fi
    echo "Session removed"
    ;;
*)
    echo "No action to perform"
    ;;
esac
