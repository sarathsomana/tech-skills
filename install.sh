#!/usr/bin/env bash

set -e

REPO_URL="https://github.com/sarathsomana/tech-skills.git"
INSTALL_DIR="$HOME/.tech-skills"
TARGET_SKILLS_DIR="$HOME/.agents/skills"

echo "🚀 Installing Tech Skills..."

# Clone or update the repository
if [ -d "$INSTALL_DIR" ]; then
    echo "📦 Updating existing repository at $INSTALL_DIR..."
    cd "$INSTALL_DIR"
    git pull origin main
else
    echo "📦 Cloning repository to $INSTALL_DIR..."
    git clone "$REPO_URL" "$INSTALL_DIR"
fi

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
        
        ln -s "$skill_dir" "$target_link"
        echo "  - Linked $skill_name"
    fi
done

echo "✅ Installation complete!"
echo ""
echo "You can now use these skills with your AI agents."
echo "If your agent uses a different directory (e.g., ~/.claude/skills), you can symlink the $INSTALL_DIR/skills directory there."
