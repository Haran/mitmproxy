#!/usr/bin/env bash

if [ -z "$1" ]
then
  echo "Empty argv - do not launch trigger directly"
fi

# Determine versions and paths
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
DEST_FOLDER="$CURRENT_DIR/bin/$1"

# Create folder for compiled binaries if it doesn't exist
if [ ! -d "$DEST_FOLDER" ]
then
  mkdir -p "$DEST_FOLDER"
  touch "$DEST_FOLDER/.gitkeep"
fi
