#!/bin/bash

# Create Blender directory
mkdir -p "$HOME/Blender"

# Backup the original .bashrc (optional, but recommended)
cp ~/.bashrc ~/.bashrc.bak

# Create a temporary file for modifications
TEMP_FILE=$(mktemp)

# Add new aliases to the beginning of .bashrc
{
	echo "## Aliasse"
	echo ""
    echo "# Custom Aliasse"
    echo "alias Home='cd ~/'"
    echo "alias Aliasse='nano ~/.bashrc && source ~/.bashrc'"
    echo ""
    
    echo "# Tmux"
    echo "alias Terminals='tmux ls'"
    echo "alias Tmux_new='tmux new-session -s'"
    echo "alias Tmux_new_d='tmux new-session -d -s'"
    echo "alias Tmux_attach='tmux attach -t'"
    echo "alias Tmux_kill='tmux kill-session -t'"
    echo ""
    
    echo "# Blender Aliases"
    echo "alias Blender_console='tmux attach -t Blender'"
    echo "alias Blender_start='tmux new-session -d -s Blender \"cd ~/Blender\"'"
    echo "alias Blender_kill='tmux kill-session -t Blender'"
    echo "alias Blender_restart='Blender_kill && Blender_start'"
    
    echo ""
    echo "# Original .bashrc content"
    
    # Append the original content
    cat ~/.bashrc
} > "$TEMP_FILE"

# Replace the original .bashrc with the new content
mv "$TEMP_FILE" ~/.bashrc

# Activate color prompt
sed -i 's/^#force_color_prompt=yes/force_color_prompt=yes/' ~/.bashrc

# Reload .bashrc to apply changes
source ~/.bashrc

# Update package list
sudo apt update

# Install required packages
sudo apt install -y blender tmux neofetch

echo "Installation and configuration are complete."
