#!/bin/sh

#SBATCH --job-name=my_fastqc        # Job name
#SBATCH --cpus-per-task=8        # Run on a single CPU
#SBATCH --mem=8gb                 # Job memory request
#SBATCH --time=0:30:00           # Time limit hrs:min:sec
#SBATCH --output=JobName.%j.log   # Standard output and error log
#SBATCH --constraint=hpc
#SBATCH --partition=short
mkdir -p fastqc_results
mkdir -p multiqc_report

find data/ -name "*.fastq.gz" | while read -r file; do
    fastqc "$file" -o fastqc_results/
done

multiqc fastqc_results/ -o multiqc_report/