#!/bin/bash

# Download SRA dataset
prefetch SRR2584863

# Convert to FASTQ
fasterq-dump SRR2584863 -O ../data/raw

echo "Download completed!"
