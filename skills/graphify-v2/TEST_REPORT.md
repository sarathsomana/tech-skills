# ADVERSARIAL_SIM: Graphify-v2 Test Report

## Scenario 1: Infinite Traversal in Monorepo
**Chaos Inject**: The target is a massive monorepo with deeply nested node_modules and symlinks. The SCOUT phase attempts to recursively traverse the entire tree, consuming unbounded resources.
**Expected Behavior**: The `max_depth: 10` configuration must halt traversal. The agent must respect the depth limit and document what was excluded rather than spiraling.
**Actual Behavior**: Handled correctly. The YAML frontmatter enforces `max_depth: 10`. The SCOUT instructions explicitly mandate respecting this limit. If the depth is insufficient, the agent transitions to `Wait-For-Human` rather than continuing.

## Scenario 2: Ambiguous Entity Classification
**Chaos Inject**: A utility file exports both a class and several standalone functions that are used across multiple modules. The INDEX phase cannot determine whether to classify it as belonging to Module A or Module B.
**Expected Behavior**: After 3 retry attempts, the agent must transition to `Wait-For-Human` for clarification rather than making an arbitrary classification decision.
**Actual Behavior**: Handled correctly. The `index_stuck` transition triggers when `max_retries` is hit or classification is ambiguous.

## Scenario 3: Dropped Entities in Graph Build
**Chaos Inject**: The GRAPH_BUILD phase silently drops 15% of entities from the index because they have complex relationship patterns.
**Expected Behavior**: The CRITIC phase must catch this by cross-referencing `CODEBASE_INVENTORY.md` against `KNOWLEDGE_GRAPH.json`. Missing entities trigger a `rework_index` transition.
**Actual Behavior**: Handled correctly. The CRITIC explicitly reads both the inventory and the graph, and has a `rework_index` path back to INDEX.

## Conclusion
The `Graphify-v2` skill is robust against infinite traversal spirals, ambiguous classification paralysis, and silent entity dropping.
