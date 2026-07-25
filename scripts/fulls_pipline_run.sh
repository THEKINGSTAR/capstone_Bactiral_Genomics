#!usr/bin/bash

#1
cd data/raw

# Extract FASTQ data (using 4 threads, adjust -e if you have more/less cores)
for file in SRR*; do
  fasterq-dump --split-files "$file" -e 4
done

# Go back to the root of your project directory
cd ../..


#2
# Run FastQC on all raw FASTQ files
fastqc data/raw/*.fastq -o fastqc_results/ -t 4

# Run MultiQC to aggregate the pre-trim results
multiqc fastqc_results/ -o multiqc_results/ -n pre_trim_multiqc_report.html


#3
# Trim the Reads (using fastp)
for raw_file in data/raw/*.fastq; do
  # Extract the base name (e.g., SRR39139285)
  base=$(basename "$raw_file" .fastq)
  
  # Run fastp with a sliding window Q20 cutoff
  fastp -i "$raw_file" \
        -o trimmed_reads/"${base}_trimmed.fastq" \
        -h logs/"${base}_fastp.html" \
        -j logs/"${base}_fastp.json" \
        --cut_tail --cut_tail_mean_quality 20 \
        --length_required 36
done