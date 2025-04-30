#!/bin/bash
REPO=$1
APPB=/app/${REPO##*/}

[ -f /bin/dra ] || \
  curl --proto '=https' --tlsv1.2 -sSf \
    https://raw.githubusercontent.com/devmatteini/dra/refs/heads/main/install.sh | bash -s -- --to /bin/

[ -f /tmp/download ] || \
  dra download -a -i -o $APPB $REPO && touch /tmp/download

$APPB ${@:2}
