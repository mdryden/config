#!/bin/bash

# untested, just notes at this point.

yay -S gnome-terminal
yay -S visual-studio-code-bin
yay -S ttf-ms-win10-auto
yay -S nerd-fonts-complete
yay -S google-chrome

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
