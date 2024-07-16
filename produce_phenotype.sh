#!/bin/bash
#$ -N produce_phen
#$ -e /exports/igmm/eddie/GWAS-annotations/tvl-msc/GWAS_silvia/submission_outputs
#$ -o /exports/igmm/eddie/GWAS-annotations/tvl-msc/GWAS_silvia/submission_outputs
#$ -cwd
#$ -pe sharedmem 6
#$ -l h_vmem=20G
#$ -l h_rt=24:00:00
#$ -l rl9=true
#$ -t 2-48

# produce phenotype for each of the genetic architectures
. /etc/profile.d/modules.sh
module load /exports/applications/modulefiles/Community-RL9/igmm/apps/gcta/1.94.1

# lis effect-sizes/*.?.txt| awk '{print $9}' | sort >> file-list.txt
# we produce a proxy variable to iterate through lines of the filenames file, in order to index the files

line=$(sed -n "${SGE_TASK_ID}p" file-list.txt)

gcta64 \
--mbfile /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/edinburgh_genotypes/edi_genotypes.txt \
--simu-qt  --simu-causal-loci effect-sizes/${line} \
--simu-hsq 0.5 \
--simu-rep 1 \
--out phenotypes/${line}.phen
