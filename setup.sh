#!/bin/bash

# Update package list
sudo apt update

# Install required packages
sudo apt install -y blender tmux neofetch

# Create Blender directory
BLENDER_DIR="$HOME/Blender"
mkdir -p "$Blender"

# Path to the .bashrc
BASHRC_FILE="$HOME/.bashrc"

# Add aliases to .bashrc
{
    echo ""
    echo "# Blender Aliases"
    echo "alias Blender_console='tmux attach -t Blender'"
    echo "alias Blender_start='tmux new-session -d -s Blender \"cd $Blender\"'"
    echo "alias Blender_kill='tmux kill-session -t Blender'"
    echo "alias Blender_restart='Blender_kill && Blender_start'"
} >> "$BASHRC_FILE"

# Activate color prompt
sed -i 's/^#force_color_prompt=yes/force_color_prompt=yes/' "$BASHRC_FILE"

# Reload .bashrc to apply changes
source "$BASHRC_FILE"

echo "Installation and configuration are complete."
