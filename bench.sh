#!/usr/bin/env bash

set -e

if [[ $# -gt 0 ]]; then
    DUNE="$1"
else
    DUNE=dune
fi

exec $DUNE build --release @install
