#!/bin/bash


# Reference: https://gist.github.com/psifertex/31d9bc3167eca91e466ebaae4382521c


echo -e "Build script for BinExport for Binja macOS stable/dev release by @debxrshi\n"


usage() {
  echo -e "Usage:\n -dev: dev release.\n -stable: stable release."
  exit 1
}

handle_deps(){
    deps=("cmake","clang-format","ninja")

    for dep in "${deps[@]}"; do
        if type "$dep" &> /dev/null; then
            echo -e "$dep exits\n"
        else
            echo -e "$dep not found\nInstalling $dep\n"
            brew install $dep
    fi
done
}

set_hash(release){}

if [ $# -ne 1 ]; then
  usage
fi

# Configuration

BN_PATH=`cat ~/Library/Application\ Support/Binary\ Ninja/lastrun`
GIT_HASH=
CORES=$(sysctl -n hw.logicalcpu)

# Checking dependencies

echo -e "[+] Checking dependencies\n"
handle_deps

# Confirming configuration

echo -e "\nConfig\n"
echo "HOME: $HOME"
echo "BN_PATH: $BN_PATH"
echo "GIT_HASH: $GIT_HASH"
echo "CORES: $CORES"
echo "BUILD: $1"

read "press Enter to continue"

# Git pull binexport 

git pull https://github.com/google/binexport.git


# Setting hash location

echo -w "[+] Updating git hash for $1"


# Changing CMakeDeps to update hash and adding macro to cmake.cc

echo -e "[+] Updating hash and inserting macro\n"


# Building binexport

echo -e "[+] Building BinExport may the force be with you"


# Copying plugin to directory

echo -e "[+] Build successful! Installing plugin now"

echo -e "[+] Plugin already exits. Replacing it"


# Performing cleaning

echo -e "[+] Cleaning up"


