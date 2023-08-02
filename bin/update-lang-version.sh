#!/usr/bin/env bash

# Synopsis:
# Update the minimum version of the language.

# Arguments:
# $1: new miniumum version of the language

# Output:
# Updates all Package.swift files to the new minimum version of the language

# Example:
# ./bin/update-lang-version.sh 5.8

# Note: This script is only intended to be run by the maintainers of the Swift track.

if [ -z "$1" ]; then
    echo "usage: ./bin/update-lang-version.sh 5.8"
    exit 1
fi

lang_version="$1"

find . -type f -name "Package.swift" -exec sh -c 'sed -i "1s~.*~// swift-tools-version:'"$lang_version"'~" "$0"' {} \;
