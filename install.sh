#!/usr/bin/env bash

# install.sh — Installs Tech Skills into the appropriate agent directory.
#
# Usage:
#   curl -sL https://raw.githubusercontent.com/sarathsomana/tech-skills/main/install.sh | bash
#   curl ... | bash -s -- --agent claude
#   curl ... | bash -s -- --agent gemini --scope project --dir /path/to/project

set -euo pipefail

REPO_URL="https://github.com/sarathsomana/tech-skills.git"
INSTALL_DIR="$HOME/.tech-skills"

# ── Defaults ──
AGENT=""
SCOPE="global"
PROJECT_DIR="$(pwd)"

# ── Parse arguments ──
while [[ $# -gt 0 ]]; do
    case $1 in
        --agent)   AGENT="$2"; shift 2 ;;
        --scope)   SCOPE="$2"; shift 2 ;;
        --dir)     PROJECT_DIR="$2"; shift 2 ;;
        --help|-h)
            echo "Usage: install.sh [--agent <name>] [--scope global|project] [--dir <path>]"
            echo ""
            echo "Agents: claude, gemini, antigravity, cursor, windsurf, cline, copilot, generic"
            echo "Default: generic (installs to ~/.agents/skills)"
            exit 0
            ;;
        *)         echo "Unknown option: $1"; exit 1 ;;
    esac
done

# ── Resolve target directory ──
resolve_target() {
    case "$AGENT" in
        claude)
            if [ "$SCOPE" = "project" ]; then echo "$PROJECT_DIR/.claude/skills"
            else echo "$HOME/.claude/skills"; fi ;;
        gemini)
            if [ "$SCOPE" = "project" ]; then echo "$PROJECT_DIR/.gemini/skills"
            else echo "$HOME/.gemini/skills"; fi ;;
        antigravity)
            if [ "$SCOPE" = "project" ]; then echo "$PROJECT_DIR/.agents/skills"
            else echo "$HOME/.gemini/antigravity/skills"; fi ;;
        cursor)
            echo "$PROJECT_DIR/.cursor/rules" ;;
        windsurf)
            if [ "$SCOPE" = "project" ]; then echo "$PROJECT_DIR/.windsurf/rules"
            else echo "$HOME/.windsurf/rules"; fi ;;
        cline)
            echo "$PROJECT_DIR/.clinerules" ;;
        copilot)
            echo "$PROJECT_DIR/.github/instructions" ;;
        generic|"")
            if [ "$SCOPE" = "project" ]; then echo "$PROJECT_DIR/.agents/skills"
            else echo "$HOME/.agents/skills"; fi ;;
        *)
            echo "Unknown agent: $AGENT" >&2; exit 1 ;;
    esac
}

TARGET_DIR=$(resolve_target)

echo "🚀 Installing Tech Skills..."
echo "   Agent:    ${AGENT:-generic}"
echo "   Scope:    $SCOPE"
echo "   Target:   $TARGET_DIR"
echo ""

# ── Clone or update ──
if [ -d "$INSTALL_DIR" ]; then
    echo "📦 Updating existing repository at $INSTALL_DIR..."
    git -C "$INSTALL_DIR" pull origin main --quiet
else
    echo "📦 Cloning repository to $INSTALL_DIR..."
    git clone "$REPO_URL" "$INSTALL_DIR" --quiet
fi

# ── Create target directory ──
mkdir -p "$TARGET_DIR"

# ── Install skills ──
echo "🔗 Linking skills to $TARGET_DIR..."
for skill_dir in "$INSTALL_DIR/skills"/*; do
    if [ -d "$skill_dir" ]; then
        skill_name=$(basename "$skill_dir")
        target_link="$TARGET_DIR/$skill_name"

        # Remove stale link/dir
        if [ -e "$target_link" ] || [ -L "$target_link" ]; then
            rm -rf "$target_link"
        fi

        ln -s "$skill_dir" "$target_link"
        echo "   ✓ $skill_name"
    fi
done

echo ""
echo "✅ Installation complete!"
echo ""
echo "   Agent:    ${AGENT:-generic}"
echo "   Location: $TARGET_DIR"
echo ""
echo "To update later: curl -sL https://raw.githubusercontent.com/sarathsomana/tech-skills/main/install.sh | bash"
echo "Or:              cd ~/.tech-skills && git pull origin main"
