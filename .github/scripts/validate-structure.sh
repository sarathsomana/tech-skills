#!/usr/bin/env bash

# validate-structure.sh
#
# Validates that every skill directory under skills/ contains:
#  1. A SKILL.md file (required)
#  2. A README.md file (required)
#  3. SKILL.md begins with YAML frontmatter (--- delimiters)

set -euo pipefail

SKILLS_DIR="skills"
errors=0
checked=0

for skill_dir in "$SKILLS_DIR"/*/; do
    skill_name=$(basename "$skill_dir")
    checked=$((checked + 1))

    # 1. SKILL.md must exist
    if [ ! -f "$skill_dir/SKILL.md" ]; then
        echo "❌ $skill_name: Missing SKILL.md"
        errors=$((errors + 1))
        continue
    fi

    # 2. README.md must exist
    if [ ! -f "$skill_dir/README.md" ]; then
        echo "❌ $skill_name: Missing README.md"
        errors=$((errors + 1))
    fi

    # 3. SKILL.md must start with ---
    first_line=$(head -n 1 "$skill_dir/SKILL.md")
    if [ "$first_line" != "---" ]; then
        echo "❌ $skill_name: SKILL.md does not start with YAML frontmatter (---)"
        errors=$((errors + 1))
    fi

    echo "✅ $skill_name: Structure valid"
done

echo ""
echo "── Summary ──"
echo "  Checked: $checked"
echo "  Errors:  $errors"

if [ "$errors" -gt 0 ]; then
    echo ""
    echo "❌ Structure validation failed with $errors error(s)."
    exit 1
fi

echo ""
echo "✅ All skill directories have valid structure."
