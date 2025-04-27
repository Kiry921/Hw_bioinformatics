#!/bin/sh

#SBATCH --job-name=trimminng     # Job name
#SBATCH --cpus-per-task=4         # Run on a single CPU
#SBATCH --mem=16gb                 # Job memory request
#SBATCH --time=1:30:00           # Time limit hrs:min:sec
#SBATCH --output=JobName.%j.Log  # Standard output and error log
#SBATCH --partition=short

source activate trimming

trimmomatic PE /projects/mipt_dbmp_biotechnology/genome/illumina_reads_R1_001.fastq \
/projects/mipt_dbmp_biotechnology/genome/illumina_reads_R2_001.fastq \
-baseout ~/classes/class_10/trimmed/illumina_reads_trim3.fastq \
-trimlog ~/classes/class_10/trimmed/illumina_reads_trim3.fastq \
ILLUMINACLIP:/projects/mipt_dbmp_biotechnology/genome/adapters.fa:2:30:10 SLIDINGWINDOW:4:20 MAXINFO:50:0.5 LEADING:3 TRAILING:3 MINLEN:36