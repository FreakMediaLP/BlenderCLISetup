#!/bin/bash

# Create Blender directory
BLENDER_DIR="$HOME/Blender"
mkdir -p "$BLENDER_DIR"

# Path to the .bashrc
BASHRC_FILE="$HOME/.bashrc"

# Create a temporary file for modifications
TEMP_FILE=$(mktemp)

# Add new aliases to the beginning of .bashrc
{
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
    echo "alias Blender_start='tmux new-session -d -s Blender \"cd $BLENDER_DIR\"'"
    echo "alias Blender_kill='tmux kill-session -t Blender'"
    echo "alias Blender_restart='Blender_kill && Blender_start'"
    
    echo ""
    echo "# Original .bashrc content"
    
    # Append the original content
    cat "$BASHRC_FILE"
} > "$TEMP_FILE"

# Replace the original .bashrc with the new content
mv "$TEMP_FILE" "$BASHRC_FILE"

# Activate color prompt
sed -i 's/^#force_color_prompt=yes/force_color_prompt=yes/' "$BASHRC_FILE"

# Reload .bashrc to apply changes
source "$BASHRC_FILE"

# Update package list
sudo apt update

# Install required packages
sudo apt install -y blender tmux neofetch

echo "Installation and configuration are complete."
