#!/bin/bash
#

################This script is for GSE73503################
#Run this script in a new directory
#mkdir GSE73503 
#This script assumes all the tools are in your path. If not specify the path of your tools.

#'Mus_musculus.GRCm38.dna.primary_assembly.fa' renamed and indexed as 'GRCm38.fa' by tophat and bowtie2 above is used in the downstream steps of this pipeline 
#'Mus_musculus.GRCm38.92.gtf' renamed and indexed as 'GRCm38.gtf' by tophat and bowtie2 above is used in the downstream steps of this pipeline 

###Step 1 getting fastq raw reads####
#Reference: https://bioinformatics.stackexchange.com/questions/2644/download-multiple-sra-files?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa
for ((i=2531532;i<=2531555;i++)) 
do
fastq-dump --gzip --split-files --accession SRR$i
echo 'Hi SGN blue group I am done getting fastq.gz files from GEO' 
done

###Step2 fastqc quality check of your reads###
fastqc *.fastq.gz
echo 'Hi SGN blue group I am done doing fastqc quality check' 
done

###Step3 mapping with tophat###
#First unzip files for use in tophat
gunzip *.fastq.gz

#Now actual tophat the PE
for i in SRR2531532 SRR2531533 SRR2531534 SRR2531535 SRR2531536 SRR2531537 SRR2531538 SRR2531539 SRR2531540 SRR2531541 SRR2531542 SRR2531543 SRR2531544 SRR2531545 SRR2531546 SRR2531547 SRR2531548 SRR2531549 SRR2531550 SRR2531551 SRR2531552 SRR2531553 SRR2531554 SRR2531555
do
tophat -o /home/smukherjee/GSE73503_map/tophat_$i --b2-very-fast --no-coverage-search --no-novel-juncs -G /home/smukherjee/GRCm38/GRCm38.gtf --transcriptome-index /home/smukherjee/GRCm38/GRCm38trans_Index/GRCm38 /home/smukherjee/GRCm38/GRCm38 ${i}_1.fastq ${i}_2.fastq
echo 'Hi SGN blue group I am done mapping SE to bam'
done

#To do tophat indivisually writing out files do like below
#tophat -o /home/smukherjee/GSE73503_map/tophat_SRR2531532 --b2-very-fast --no-coverage-search --no-novel-juncs -G /home/smukherjee/GRCm38/GRCm38.gtf --transcriptome-index /home/smukherjee/GRCm38/GRCm38trans_Index/GRCm38 /home/smukherjee/GRCm38/GRCm38 SRR2531532_1.fastq SRR2531532_2.fastq

###Step4 sort bam files with samtools###
#samtools sort and index bam file
#http://quinlanlab.org/tutorials/samtools/samtools.html
for ((i=2531532;i<=2531555;i++))
do
samtools sort SRR${i}_accepted_hits.bam -o SRR${i}_sort_accepted_hits.bam
done

#To use samtools individually use code below
#samtools sort SRR2531532_accepted_hits.bam -o SRR2531532_sort_accepted_hits.bam

###Step5 htseq count bam files with htseqtools###
#Usage of htseqcount
#http://htseq.readthedocs.io/en/master/count.html
#htseq-count
#  -s {yes,no,reverse}, --stranded {yes,no,reverse} whether the data is from a strand-specific assay.Specify 'yes', 'no', or 'reverse' (default: yes).'reverse' means 'yes' with reversed strand interpretation
#htseq-count [options] <alignment_files> <gff_file>
for ((i=2531532;i<=2531555;i++))
do
htseq-count -f bam -r pos -t gene -i gene_name -s no SRR${i}_sort_accepted_hits.bam /home/smukherjee/GRCm38/GRCm38.gtf > SRR${i}.txt
done

#To use htseq count individually use code below
#htseq-count -f bam -r pos -t gene -i gene_name -s no SRR2531532_sort_accepted_hits.bam /home/smukherjee/GRCm38/GRCm38.gtf > SRR2531532.txt



















