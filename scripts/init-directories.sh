#!/bin/bash
# Create runtime directories for Academic Knowledge Manager v3.0
# Run once after fresh clone: bash scripts/init-directories.sh

BASE="${1:-.}"

echo "Creating runtime directories..."

mkdir -p "$BASE/conversations/nodes"
mkdir -p "$BASE/conversations/threads"
mkdir -p "$BASE/conversations/transcripts"
mkdir -p "$BASE/tools/audit/logs"
mkdir -p "$BASE/tools/audit/digests"
mkdir -p "$BASE/tools/analysis/daily/summaries"
mkdir -p "$BASE/tools/analysis/weekly/summaries"
mkdir -p "$BASE/tools/analysis/daily/2026/05"
mkdir -p "$BASE/tools/analysis/weekly/2026"
mkdir -p "$BASE/knowledge/figures"
mkdir -p "$BASE/work/figures"
mkdir -p "$BASE/baseline"

echo "Done. Runtime directories created."
