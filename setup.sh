#!/bin/bash

# Create Blender directories
mkdir -p "$HOME/Blender"

# Download aliasses and prepend it to .bashrc
curl -s https://raw.githubusercontent.com/FreakMediaLP/Blender-CLI-Setup/main/aliases.txt | cat - ~/.bashrc > temp && mv temp ~/.bashrc

# Activate color prompt
sed -i 's/^#force_color_prompt=yes/force_color_prompt=yes/' ~/.bashrc

# Reload .bashrc to apply changes
source ~/.bashrc

# Install required packages
sudo apt update
sudo apt install -y blender tmux neofetch

echo "Installation and configuration completed."
