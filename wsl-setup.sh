#!/bin/bash

set -e

echo "Updating apt cache"
sudo apt update

echo "Installing default apt packages"
sudo apt install software-properties-common build-essential python3-venv python3-dev python3-pip python3-setuptools -y


echo "Adding deadsnakes PPA"
sudo add-apt-repository ppa:deadsnakes/ppa

echo "Installing fonts-firacode"
sudo apt install fonts-firacode

echo "Installing starship"
curl -sS https://starship.rs/install.sh | sh

echo "Configuring starship"
mkdir -p ~/.config
curl https://raw.githubusercontent.com/mdryden/config/master/shell_profiles/starship.toml -o ~/.config/starship.toml

echo "Installing thefuck"
PIP_REQUIRE_VIRTUALENV=false pip3 install thefuck


echo "Downloading and installing .mikerc"
curl https://raw.githubusercontent.com/mdryden/config/master/shell_profiles/.mikerc -o ~/.mikerc
grep -qxF 'source "$HOME/.mikerc"' $HOME/.profile || printf '\nsource "$HOME/.mikerc"' >> $HOME/.profile

echo "Enabling new profile"
source ~/.profile