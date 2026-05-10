#!/usr/bin/env bash

set -e

# Get the directory where the script is located
INSTALL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_SKILLS_DIR="$INSTALL_DIR/.agents/skills"

echo "🚀 Installing Tech Skills locally..."

# Create the target skills directory if it doesn't exist
mkdir -p "$TARGET_SKILLS_DIR"

# Symlink all skills
echo "🔗 Linking skills to $TARGET_SKILLS_DIR..."
for skill_dir in "$INSTALL_DIR/skills"/*; do
    if [ -d "$skill_dir" ]; then
        skill_name=$(basename "$skill_dir")
        target_link="$TARGET_SKILLS_DIR/$skill_name"
        
        # Remove existing symlink or directory if it exists to avoid conflicts
        if [ -e "$target_link" ] || [ -L "$target_link" ]; then
            rm -rf "$target_link"
        fi
        
        # Use absolute paths for the symlink target so it works correctly
        ln -s "$skill_dir" "$target_link"
        echo "  - Linked $skill_name"
    fi
done

echo "✅ Local installation complete!"
echo ""
echo "You can now use these skills within this workspace."
