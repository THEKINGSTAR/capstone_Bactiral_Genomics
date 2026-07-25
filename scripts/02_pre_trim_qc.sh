# 2. Pre-Trim QC (FastQC & MultiQC)
# Run FastQC on all raw FASTQ files
fastqc data/raw/*.fastq -o fastqc_results/ -t 4

# Run MultiQC to aggregate the pre-trim results
multiqc fastqc_results/ -o multiqc_results/ -n pre_trim_multiqc_report.html