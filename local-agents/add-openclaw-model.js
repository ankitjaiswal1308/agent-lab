#!/usr/bin/env node

/*
  Helper placeholder imported into agent-lab for future OpenClaw model config edits.

  The old local-agents workspace had an add-openclaw-model.js helper. Keep this
  copy reviewed before use because OpenClaw config paths vary by installation.
*/

const fs = require("node:fs");
const path = require("node:path");

const [configPath, sourceModel, newModel] = process.argv.slice(2);

if (!configPath || !sourceModel || !newModel) {
  console.error("Usage: node local-agents/add-openclaw-model.js <config.json> <source-model> <new-model>");
  process.exit(1);
}

const resolved = path.resolve(configPath);
const data = JSON.parse(fs.readFileSync(resolved, "utf8"));
const models = data?.models?.providers?.ollama?.models || data?.providers?.ollama?.models;

if (!Array.isArray(models)) {
  throw new Error("Could not find an Ollama models array in the supplied config.");
}

const source = models.find((model) => model.id === sourceModel || model.model === sourceModel || model.name === sourceModel);

if (!source) {
  throw new Error(`Source model not found: ${sourceModel}`);
}

if (models.some((model) => model.id === newModel || model.model === newModel || model.name === newModel)) {
  throw new Error(`Model already exists: ${newModel}`);
}

const clone = { ...source };

if ("id" in clone) clone.id = newModel;
if ("model" in clone) clone.model = newModel;
if ("name" in clone) clone.name = newModel;

models.push(clone);
fs.writeFileSync(resolved, `${JSON.stringify(data, null, 2)}\n`);
console.log(`Added ${newModel} by cloning ${sourceModel} in ${resolved}`);

