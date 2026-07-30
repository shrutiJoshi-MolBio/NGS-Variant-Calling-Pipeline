#!/bin/bash

# ==========================================
# MultiQC summary report
# Author: Shruti Joshi
# ==========================================

# Stop the script if a command fails
set -e

# Find the directory containing this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# The project root is one directory above scripts/
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Define input and output directories
INPUT_DIR="$PROJECT_ROOT/results/fastqc"
OUTPUT_DIR="$PROJECT_ROOT/results/multiqc"

echo "Project directory: $PROJECT_ROOT"
echo "Reading FastQC results from: $INPUT_DIR"

# Check that FastQC results exist
if [ ! -d "$INPUT_DIR" ]; then
    echo "Error: FastQC results directory does not exist:"
    echo "$INPUT_DIR"
    exit 1
fi

# Create the MultiQC output directory
mkdir -p "$OUTPUT_DIR"

# Generate the combined report
multiqc "$INPUT_DIR" \
    -o "$OUTPUT_DIR" \
    --force

echo "----------------------------------------"
echo "MultiQC analysis completed successfully!"
echo "Report saved at:"
echo "$OUTPUT_DIR/multiqc_report.html"
echo "----------------------------------------"
