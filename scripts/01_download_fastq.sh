# 1. Extract the SRA files to FASTQ

cd data/raw

# Extract FASTQ data (using 4 threads, adjust -e if you have more/less cores)
for file in SRR*; do
  fasterq-dump --split-files "$file" -e 4
done

# Go back to the root of your project directory
cd ../..