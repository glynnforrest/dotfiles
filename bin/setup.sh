#!/usr/bin/env bash

set -e -u

wait() {
    echo
    echo "$1"
    read -p "Press enter when ready. "
}

title() {
    echo
    echo "$1"
    echo
}

is_mac () {
    test `uname` = "Darwin"
}

# if is_mac
# then
#     xcode-select --install
# fi
