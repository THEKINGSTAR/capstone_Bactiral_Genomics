# **`Bio-project ID to use - PRJNA1478106`**  

## By the end of this capstone, participants should be able to:

1. Navigate `NCBI` to locate a BioProject and its associated `SRA` runs, using the same path taught in class (`NCBI` → `BioProject accession` → `SRA Run Selector` → `SRA Explorer` → `Bash download script`)

2. Set up a standard, reproducible project directory before touching any data

3. Retrieve `organism-level` reference metadata (genome size, GC content) to set QC expectations before looking at their own data

4. Download `paired-end` `FASTQ` files and verify integrity (`read counts`, `file sizes`) using `ls -lh`, `du -sh`, `wc -l`

5. Run `FastQC` and aggregate results with `MultiQC`, both `pre-` and `post-` `trimming`, and correctly interpret each module using the `PASS`/`WARN`/`FAIL` framework taught in Module 2

6. Perform `adapter`/`quality` `trimming` with a named tool and justified parameters (referencing the actual flags taught: `ILLUMINACLIP`, `SLIDINGWINDOW:4:20`, `LEADING:3`, `TRAILING:3`, or` fastp auto-detection`)

7. Interpret and compare `pre`/`post`` QC reports`, articulating what changed and why, in a concise written report



## ***`Dear Participant,`***

For the capstone project, you will complete a full `WGS` ****quality-control**** workflow

- from data retrieval through `FastQC`/`MultiQC` interpretation and trimming

- and submit your results via the `Google Form` below.
    >- Capstone Form: `https://forms.gle/xCbzpeSLPXCuEW999 

## ****What you'll be doing:****
- Navigate `NCBI` to locate BioProject `PRJNA1478106` and retrieve all 10 associated SRA runs (Pseudomonas isolates) as a single batch
- Set up a standard project directory (`raw_data`/, `trimmed_reads`/, `fastqc_results`/, `multiqc_results`/, `scripts`/, `logs`/, `results`/, `docs`/) before downloading anything
- Look up expected genome size and `GC%` for your assigned species to set `QC` expectations
- Run `FastQC` + `MultiQC` `pre-trim`, interpret each module using the `PASS`/`WARN`/`FAIL` framework from Module 2
- Trim with fastp or Trimmomatic, with parameters justified by your `pre-trim` findings
- Re-run `FastQC` + `MultiQC` `post-trim` and submit a short comparative report (`max 100 words `/ `~700 characters`)

## A few notes before you start:

- You are working with all 10 `SRR` accessions from `PRJNA1478106` as one batch - a single `raw_data`/ folder and one aggregated `MultiQC` run `pre-trim` and `post-trim`.

- Two questions in the form (Sections 3 and 6) have a `500-character` limit, and the comparative report in Section 8 has a `700-character` (`~100-word`) limit. The form will block submission until you're under the limit, so draft your answer separately first if it's tight.

## Post-Trim Quality Control Report
You can view the interactive MultiQC report directly below:

<iframe src="post_trim_multiqc_report.html" width="100%" height="600px" style="border:none;">
</iframe>

<iframe src="https://github.com/THEKINGSTAR/capstone_Bactiral_Genomics/post_trim_multiqc_report.html" width="100%" height="600px" style="border:none;"></iframe>
