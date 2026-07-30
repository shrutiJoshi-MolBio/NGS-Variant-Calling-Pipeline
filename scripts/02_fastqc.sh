#!/bin/bash

# ==========================================
# FastQC Quality Control
# Author: Shruti Joshi
# ==========================================

# Get project root directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

echo "Project directory: $PROJECT_ROOT"

# Create output directory
mkdir -p "$PROJECT_ROOT/results/fastqc"

# Run FastQC
fastqc \
    "$PROJECT_ROOT/data/raw/SRR2584863_1.fastq" \
    "$PROJECT_ROOT/data/raw/SRR2584863_2.fastq" \
    -o "$PROJECT_ROOT/results/fastqc"

echo "----------------------------------------"
echo "FastQC analysis completed successfully!"
echo "Results saved in: results/fastqc"
echo "----------------------------------------"
