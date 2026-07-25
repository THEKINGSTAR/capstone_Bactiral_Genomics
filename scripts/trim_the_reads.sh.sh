# 3 Trim the Reads (using fastp)
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