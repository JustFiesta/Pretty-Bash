#!/usr/bin/env bash
# -----------------
# Setup new .bashrc
# This script reqiures: git, zip, wget, curl and python3

TMP_CATALOG="/tmp/pretty-bash-tmp/"

echo ""
echo "Installing dependencies"
sudo apt-get install -y python3 zip python3-dev wget curl
if [ $? -eq 1 ]; then
	echo ""
	echo "Dependencies not installed. Proceed manualy"
	exit 1
fi

# Make a tmp folder for download files
echo ""
echo "Creating $TMP_CATALOG folder for download files"
mkdir "$TMP_CATALOG" && cd "$TMP_CATALOG"

# Download needed config files

echo "---------------------------------------------"
echo ""
echo "Using wget to download .bashrc arhive..."
echo ""
wget https://github.com/JustFiesta/pretty-bash/archive/main.zip

if [ $? -eq 1 ]; then
	echo ""
	echo "Could not wget .bashrc arhive from GitHub."
	exit 1
fi

echo ""
echo "Unpacking zip file..."
echo ""
unzip main.zip

if [ $? -eq 1 ]; then
	echo ""
	echo "Could not unzip main.zip arhive."
	exit 1
fi

echo ""
echo "Installing new .bashrc..."
cd pretty-bash-main/ && mv .bashrc ~/.bashrc && cd ..

if [ $? -eq 1 ]; then
	echo ""
	echo "Could not move new .bashrc file into HOME directory."
	exit 1
fi

echo ""
echo "File succesfully installed! ($HOME/.bashrc)"
echo ""


# Reload configfiles 
echo "---------------------------------------------"
echo ""
echo "Reloading configuration files..."
echo ""
source $HOME/.bashrc
echo ""
echo "---------------------------------------------"
