#!/bin/bash


# Reference: https://gist.github.com/psifertex/31d9bc3167eca91e466ebaae4382521c


echo -e "Build script for BinExport for Binja macOS stable/dev release by @debxrshi\nThis script assumes you Binja is installed to its default location. Edit it if not.\n"



if [ $# -ne 1 ]; then
  echo -e "Usage:\n dev: dev release.\n stable: stable release."
  exit 1
fi


# Configuration

CHANNEL=$1
GIT_HASH=
PLUGIN_SRC=
PLUGIN_DST=
CORES=$(sysctl -n hw.logicalcpu)

# Checking dependencies

echo -e "[+] Checking dependencies\n"

deps=("cmake","clang-format","ninja")

for dep in "${deps[@]}"; do
  if type "$dep" &> /dev/null; then
    echo -e "$dep exists\n"
  else
    echo -e "$dep not found\nInstalling $dep\n"
    brew install $dep 
  fi
done

# Confirming configuration

echo -e "\nConfig\n"
echo "HOME: $HOME"
echo "BN_PATH: $BN_PATH"
echo "GIT_HASH: $GIT_HASH"
echo "CORES: $CORES"
echo "BUILD: $CHANNEL"

read "press Enter to continue"

# Pull binexport 

git pull https://github.com/google/binexport.git $HOME
cd $HOME/binexport

# Changing CMakeDeps to update hash and adding macro to cmake.cc

echo -e "[+] Updating hash and inserting macro\n"



# Building binexport

echo -e "[+] Building BinExport may the force be with you\n"

mkdir build && cd build
cmake .. -G ninja -DBINEXPORT_BINARYNINJA_CHANNEL=$CHANNEL -DCMAKE_BUILD_TYPE=Release "-DCMAKE_INSTALL_PREFIX=$PWD" -DBINEXPORT_ENABLE_IDAPRO=OFF -DBINEXPORT_ENABLE_BINARYNINJA=ON
cmake --build . --config Release -- "-j$CORES"

# Copying plugin to directory

echo -e "[+] Build successful! Installing plugin now"

echo -e "[+] Plugin already exits. Replacing it"


# Performing cleaning

echo -e "[+] Cleaning up"


