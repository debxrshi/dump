#!/usr/bin/bash
#ScareCrow Install Script by --> debxrshi with <3 

if [[ $EUID -ne 0 ]]; then
    echo "This script requires root privileges to install packages. Please run with sudo or as root."
    exit 1
fi
git clone https://github.com/optiv/ScareCrow.git
cd ScareCrow
if go version 2>/dev/null; then
	echo go install found, downloading packages
	go get github.com/fatih/color
	go get github.com/yeka/zip
	go get github.com/josephspurrier/goversioninfo
	go get github.com/Binject/debug/pe
	go get github.com/awgh/rawreader
	go get github.com/mattn/go-isatty@latest
else
	echo Installing go, requires sudo
	sudo apt install -y golang
	echo go installed, installing packages
	go get github.com/fatih/color
	go get github.com/yeka/zip
	go get github.com/josephspurrier/goversioninfo
	go get github.com/Binject/debug/pe
	go get github.com/awgh/rawreader
	go get github.com/mattn/go-isatty@latest
fi
echo Installing dependencies: OpenSSL, OSSLsigncode, MinGW-w64
sudo apt install -y openssl
sudo apt install -y osslsigncode
sudo apt install -y mingw-w64
echo Dependencies installed, building ScareCrow
go build ScareCrow.go
echo Adding ScareCrow to PATH
su $(logname) -c "echo 'export PATH=\$PATH:$(pwd)' >> /home/$(logname)/.zshrc"
source /home/$(logname)/.zshrc 2>/dev/null
echo Testing Installation, executing ScareCrow
exec /usr/bin/zsh -c ScareCrow
