#!/usr/bin/env node

/**
 * validate-frontmatter.mjs
 *
 * Validates every SKILL.md under skills/ to ensure:
 *  1. YAML frontmatter exists and is valid YAML
 *  2. Required top-level fields are present (name, description)
 *  3. `name` matches the parent directory name
 *  4. States (if declared) each have required sub-fields
 */

import { readFileSync, readdirSync, statSync } from "node:fs";
import { join, basename } from "node:path";
import yaml from "js-yaml";

const SKILLS_DIR = "skills";

// Required top-level frontmatter fields
const REQUIRED_FIELDS = ["name", "description"];

// If `states` is a map, each state should ideally have these
const RECOMMENDED_STATE_FIELDS = ["persona", "goal"];

let errors = 0;
let warnings = 0;
let checked = 0;

function extractFrontmatter(content) {
  const match = content.match(/^---\n([\s\S]*?)\n---/);
  if (!match) return null;
  return match[1];
}

function validate(skillDir) {
  const skillName = basename(skillDir);
  const skillMdPath = join(skillDir, "SKILL.md");

  let content;
  try {
    content = readFileSync(skillMdPath, "utf-8");
  } catch {
    console.error(`❌ ${skillName}: SKILL.md not found`);
    errors++;
    return;
  }

  checked++;

  // 1. Extract and parse YAML frontmatter
  const raw = extractFrontmatter(content);
  if (!raw) {
    console.error(`❌ ${skillName}: Missing YAML frontmatter (--- delimiters)`);
    errors++;
    return;
  }

  let fm;
  try {
    fm = yaml.load(raw);
  } catch (e) {
    console.error(`❌ ${skillName}: Invalid YAML — ${e.message}`);
    errors++;
    return;
  }

  if (!fm || typeof fm !== "object") {
    console.error(`❌ ${skillName}: Frontmatter parsed but is empty or not an object`);
    errors++;
    return;
  }

  // 2. Required fields
  for (const field of REQUIRED_FIELDS) {
    if (!fm[field]) {
      console.error(`❌ ${skillName}: Missing required field '${field}'`);
      errors++;
    }
  }

  // 3. Name must match directory
  if (fm.name && fm.name !== skillName) {
    console.error(
      `❌ ${skillName}: Frontmatter 'name' is '${fm.name}' but directory is '${skillName}'`
    );
    errors++;
  }

  // 4. States validation (if present)
  if (fm.states && typeof fm.states === "object") {
    for (const [stateName, stateDef] of Object.entries(fm.states)) {
      if (!stateDef || typeof stateDef !== "object") continue;

      for (const field of RECOMMENDED_STATE_FIELDS) {
        if (!stateDef[field]) {
          console.warn(
            `⚠️  ${skillName}: State '${stateName}' missing recommended field '${field}'`
          );
          warnings++;
        }
      }
    }
  }

  // 5. States as array (flow-style)
  if (fm.flow && Array.isArray(fm.flow)) {
    for (const state of fm.flow) {
      if (!state.state) {
        console.error(`❌ ${skillName}: Flow entry missing 'state' field`);
        errors++;
      }
      if (!state.description) {
        console.warn(
          `⚠️  ${skillName}: Flow state '${state.state || "unknown"}' missing 'description'`
        );
        warnings++;
      }
    }
  }

  // 6. Markdown body must exist after frontmatter
  const bodyStart = content.indexOf("---", content.indexOf("---") + 3) + 3;
  const body = content.slice(bodyStart).trim();
  if (!body) {
    console.warn(`⚠️  ${skillName}: SKILL.md has no Markdown body after frontmatter`);
    warnings++;
  }

  console.log(`✅ ${skillName}: Valid`);
}

// ------- Main -------

const skillDirs = readdirSync(SKILLS_DIR)
  .map((d) => join(SKILLS_DIR, d))
  .filter((d) => statSync(d).isDirectory());

if (skillDirs.length === 0) {
  console.error("❌ No skill directories found under skills/");
  process.exit(1);
}

console.log(`\nValidating ${skillDirs.length} skills...\n`);

for (const dir of skillDirs) {
  validate(dir);
}

console.log(`\n── Summary ──`);
console.log(`  Checked:  ${checked}`);
console.log(`  Errors:   ${errors}`);
console.log(`  Warnings: ${warnings}`);

if (errors > 0) {
  console.error(`\n❌ Validation failed with ${errors} error(s).`);
  process.exit(1);
}

console.log(`\n✅ All skills passed validation.`);
