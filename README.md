# Blender-CLI-Setup
A Project to set up the **Blender CLI** on a Linux Server with custom commands and Tmux sessions.

## Ussage

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/FreakMediaLP/Blender-CLI-Setup/main/setup.sh)"
```

## Commands

```bash
Render_image "File.blend"  # Renders first frame of a scene
```

```bash
Render_animation "File.blend"  # Renders entire animation
```

```bash
Render_frames "File.blend" 10 50  # Renders animation from frame 10 to 50
```
