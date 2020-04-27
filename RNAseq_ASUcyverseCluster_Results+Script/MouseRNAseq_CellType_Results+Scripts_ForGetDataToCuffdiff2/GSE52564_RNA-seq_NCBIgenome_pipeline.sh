#!/bin/bash
#

################This script is for GSE52564################
#Run this script in a new directory
#mkdir GSE52564 
#This script assumes all the tools are in your path. If not specify the path of your tools.

#'Mus_musculus.GRCm38.dna.primary_assembly.fa' renamed and indexed as 'GRCm38.fa' by tophat and bowtie2 above is used in the downstream steps of this pipeline 
#'Mus_musculus.GRCm38.92.gtf' renamed and indexed as 'GRCm38.gtf' by tophat and bowtie2 above is used in the downstream steps of this pipeline 

###Step 1 getting fastq raw reads####
#Reference: https://bioinformatics.stackexchange.com/questions/2644/download-multiple-sra-files?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa
for ((i=1033783;i<=1033796;i++)) 
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
for i in SRR1033783 SRR1033784 SRR1033785 SRR1033786 SRR1033787 SRR1033788 SRR1033789 SRR1033790 SRR1033791 SRR1033792 SRR1033793 SRR1033794 SRR1033795 SRR1033796
do
tophat -o /home/smukherjee/GSE52564_map/tophat_$i --b2-very-fast --no-coverage-search --no-novel-juncs -G /home/smukherjee/GRCm38/GRCm38.gtf --transcriptome-index /home/smukherjee/GRCm38/GRCm38trans_Index/GRCm38 /home/smukherjee/GRCm38/GRCm38 ${i}_1.fastq ${i}_2.fastq
echo 'Hi SGN blue group I am done mapping SE to bam'
done

#To do tophat indivisually writing out files do like below
#tophat -o /home/smukherjee/GSE52564_map/tophat_SRR1033783 --b2-very-fast --no-coverage-search --no-novel-juncs -G /home/smukherjee/GRCm38/GRCm38.gtf --transcriptome-index /home/smukherjee/GRCm38/GRCm38trans_Index/GRCm38 /home/smukherjee/GRCm38/GRCm38 SRR1033783_1.fastq SRR1033783_2.fastq

###Step4 sort bam files with samtools###
#samtools sort and index bam file
#http://quinlanlab.org/tutorials/samtools/samtools.html
for ((i=1033783;i<=1033796;i++))
do
samtools sort SRR${i}_accepted_hits.bam -o SRR${i}_sort_accepted_hits.bam
done

#To use samtools individually use code below
#samtools sort SRR1033783_accepted_hits.bam -o SRR1033783_sort_accepted_hits.bam

###Step5 htseq count bam files with htseqtools###
#Usage of htseqcount
#http://htseq.readthedocs.io/en/master/count.html
#htseq-count
#  -s {yes,no,reverse}, --stranded {yes,no,reverse} whether the data is from a strand-specific assay.Specify 'yes', 'no', or 'reverse' (default: yes).'reverse' means 'yes' with reversed strand interpretation
#htseq-count [options] <alignment_files> <gff_file>
for ((i=1033783;i<=1033796;i++))
do
htseq-count -f bam -r pos -t gene -i gene_name -s no SRR${i}_sort_accepted_hits.bam /home/smukherjee/GRCm38/GRCm38.gtf > SRR${i}.txt
done

#To use htseq count individually use code below
#htseq-count -f bam -r pos -t gene -i gene_name -s no SRR1033783_sort_accepted_hits.bam /home/smukherjee/GRCm38/GRCm38.gtf > SRR1033783.txt



















