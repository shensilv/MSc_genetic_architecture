#!/bin/bash
#$ -N run_GWAS
#$ -e /exports/igmm/eddie/GWAS-annotations/tvl-msc/GWAS_silvia/submission_outputs
#$ -o /exports/igmm/eddie/GWAS-annotations/tvl-msc/GWAS_silvia/submission_outputs
#$ -cwd
#$ -l rl9=true
#$ -pe sharedmem 10
#$ -l h_vmem=5G
#$ -l h_rt=00:10:00
#$ -t 1-48

# run the GWAS for each simulated phenotypes
. /etc/profile.d/modules.sh
module load /exports/applications/modulefiles/Community-RL9/igmm/apps/gcta/1.94.1

# we produce a proxy variable to iterate through lines of the filenames file, in order to index the files

line=$(sed -n "${SGE_TASK_ID}p" file_list.txt)

gcta64 \
--mbfile /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/edinburgh_genotypes/edi_genotypes.txt \
--grm-sparse /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/edinburgh_genotypes/make_grm/edinburgh_grm_sparse \
--fastGWA-mlm \
--pheno phenotypes/${line}.phen.phen \
--thread-num 10 \
--seed 2024 \
--out GWAS_summary_stats/sumstats.${line}
