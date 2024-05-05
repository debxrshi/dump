#!/bin/bash


# Reference: https://gist.github.com/psifertex/31d9bc3167eca91e466ebaae4382521c
# The script provided as reference is really good but doesn't work out of the box. Here's an edited version that's basically plug-n-play and also handles dependencies.




echo "Build script for BinExport for Binja macOS ANY version by @debxrshi"
echo -e "\nThis script assumes that Binary Ninja has been installed in default location. If that's not the case please edit it.\n\n"

# Setting environment variables

$BN_PATH=
$BN_HASH=$(sed 's/^.*\///' < $BN_PATH/api_REVISION.txt 2>/dev/null)


# Changing CMakeDeps to update hash


# Changing cmake.cc to add MACRO


# Building binexport


# Copying plugin to directory
