#!/bin/bash

sudo echo "Get sudo password!"

echo "Update apt libraries..."
yes | sudo add-apt-repository ppa:webupd8team/atom
sudo apt update
yes | sudo apt upgrade
echo "Done."
echo

echo "Install apt libraries..."
yes | sudo apt install $(cat package_lists/apt_packages.txt)
echo "Done."
echo
