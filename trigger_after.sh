#!/usr/bin/env bash

if [ -z "$1" ]
then
  echo "Empty argv - do not launch trigger directly"
fi

# Determine versions and paths
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
DEST_FOLDER="$CURRENT_DIR/bin/$1"

# Retrieve files from VM to host
for FILE in mitmweb mitmdump mitmproxy
do
  vagrant ssh -c "cat /tmp/$FILE" > "$DEST_FOLDER/$FILE"
  chmod +x "$DEST_FOLDER/$FILE"
done
