#!/bin/bash
#

################This script is for GSE83931################
#Run this script in a new directory
#mkdir GSE83931 
#This script assumes all the tools are in your path. If not specify the path of your tools.

#'Mus_musculus.GRCm38.dna.primary_assembly.fa' renamed and indexed as 'GRCm38.fa' by tophat and bowtie2 above is used in the downstream steps of this pipeline 
#'Mus_musculus.GRCm38.92.gtf' renamed and indexed as 'GRCm38.gtf' by tophat and bowtie2 above is used in the downstream steps of this pipeline 

###Step 1 getting fastq raw reads####
#Reference: https://bioinformatics.stackexchange.com/questions/2644/download-multiple-sra-files?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa
for ((i=3734796;i<=3734825;i++)) 
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

#Now actual tophat the SE
for i in SRR3734796_1 SRR3734797_1 SRR3734798_1 SRR3734799_1 SRR3734800_1 SRR3734801_1 SRR3734802_1 SRR3734803_1 SRR3734804_1 SRR3734805_1 SRR3734806_1 SRR3734807_1 SRR3734808_1 SRR3734809_1 SRR3734810_1 SRR3734811_1 SRR3734812_1 SRR3734813_1 SRR3734814_1 SRR3734815_1 SRR3734816_1 SRR3734817_1 SRR3734818_1 SRR3734819_1 SRR3734820_1 SRR3734821_1 SRR3734822_1 SRR3734823_1 SRR3734824_1 SRR3734825_1 
do
tophat -o /home/smukherjee/GSE83931_map/tophat_$i --b2-very-fast --no-coverage-search --no-novel-juncs -G /home/smukherjee/GRCm38/GRCm38.gtf --transcriptome-index /home/smukherjee/GRCm38/GRCm38trans_Index/GRCm38 /home/smukherjee/GRCm38/GRCm38 $i.fastq.gz
echo 'Hi SGN blue group I am done mapping SE to bam'
done

#To do tophat indivisually writing out files do like below
#tophat -o /home/smukherjee/GSE83931_map/tophat_SRR3734796 --b2-very-fast --no-coverage-search --no-novel-juncs -G /home/smukherjee/GRCm38/GRCm38.gtf --transcriptome-index /home/smukherjee/GRCm38/GRCm38trans_Index/GRCm38 /home/smukherjee/GRCm38/GRCm38 SRR3734796_1.fastq

###Step4 sort bam files with samtools###
#samtools sort and index bam file
#http://quinlanlab.org/tutorials/samtools/samtools.html
for ((i=3734796;i<=3734825;i++))
do
samtools sort SRR${i}_accepted_hits.bam -o SRR${i}_sort_accepted_hits.bam
done

#To use samtools individually use code below
#samtools sort SRR3734796_accepted_hits.bam -o SRR3734796_sort_accepted_hits.bam

###Step5 htseq count bam files with htseqtools###
#Usage of htseqcount
#http://htseq.readthedocs.io/en/master/count.html
#htseq-count
#  -s {yes,no,reverse}, --stranded {yes,no,reverse} whether the data is from a strand-specific assay.Specify 'yes', 'no', or 'reverse' (default: yes).'reverse' means 'yes' with reversed strand interpretation
#htseq-count [options] <alignment_files> <gff_file>
for ((i=3734796;i<=3734825;i++))
do
htseq-count -f bam -r pos -t gene -i gene_name -s no SRR${i}_sort_accepted_hits.bam /home/smukherjee/GRCm38/GRCm38.gtf > SRR${i}.txt
done

#To use htseq count individually use code below
#htseq-count -f bam -r pos -t gene -i gene_name -s no SRR3734796_sort_accepted_hits.bam /home/smukherjee/GRCm38/GRCm38.gtf > SRR3734796.txt



















