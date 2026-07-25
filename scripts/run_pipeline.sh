#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "=== 1. Setting up directory structure ==="
mkdir -p data/raw data/trimmed fastqc_results multiqc_results logs

echo "=== 2. Downloading SRA datasets (PRJNA1478106) ==="
# Add your SRA accession download loop or commands here (e.g., prefetch / fasterq-dump)
# Example accession list or automated download:
accessions=("SRR39139285" "SRR39146138" "SRR39146893" "SRR39146894" "SRR39146895" "SRR39146896" "SRR39146897" "SRR39146898" "SRR39146899" "SRR39146900")

for acc in "${accessions[@]}"; do
    if [ ! -d "data/raw/$acc" ]; then
        echo "Downloading $acc..."
        fasterq-dump "$acc" -O data/raw/
    fi
done

echo "=== 3. Running Pre-Trim FastQC ==="
fastqc data/raw/*.fastq -o fastqc_results/ -t 4
multiqc fastqc_results/ -o multiqc_results/ -n pre_trim_multiqc_report.html

echo "=== 4. Executing Quality Trimming with fastp ==="
for R1 in data/raw/*_1.fastq; do
    R2="${R1%_1.fastq}_2.fastq"
    base=$(basename "$R1" _1.fastq)
    
    echo "Trimming $base..."
    fastp -i "$R1" -I "$R2" \
          -o "data/trimmed/${base}_1.trim.fastq" -O "data/trimmed/${base}_2.trim.fastq" \
          --cut_right --cut_window_size 4 --cut_mean_quality 20 \
          --length_required 36 \
          --json "data/trimmed/${base}_fastp.json" \
          --html "data/trimmed/${base}_fastp.html"
done

echo "=== 5. Running Post-Trim FastQC ==="
fastqc data/trimmed/*.trim.fastq -t 4

echo "=== 6. Generating Final Post-Trim MultiQC Report ==="
multiqc data/trimmed/ -f -n post_trim_multiqc_report.html

echo "=== PIPELINE COMPLETE SUCCESSFULLY ==="