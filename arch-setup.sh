#!/bin/bash
yay --save --answerclean None --answerdiff None

yay -S visual-studio-code-bin
yay -S ttf-firacode
yay -S python
yay -S python-pip
yay -S go-pie
yay -S dotnet-sdk-8.0

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
