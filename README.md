# MSc Genetic Architecture

Repository for generating GWAS summary statistics for MSc project on genetic architecture testing. We first simulate phenotypes and then run GWAS on the phenotypes. All computation is done in GCTA. 

## Step 1 - generate file list to call 
Where `\effect-sizes` is the file containing simulated genotype effect sizes, we create a list of effect size files with the directory name and without. 

```
ls -lth effect-sizes/*.?.txt| awk '{print $9}' | sort >> file-list.txt
cat file-list.txt | awk 'BEGIN{FS="/"}{print $2}' >> file_list.txt
```
## Step 2 - simulate phenotype

Run the file [produce_phenotype.sh](produce_phenotype.sh) to produce phenotypes. This script iterates through the names of effect size files to simulate using the GCTA `--simu-qt` function. This is done on the imputed data of the Edinburgh cohort, with filtering done for INFO>0.9. 

## Step 3 - produce sparse GRM

This step requires the full GRM, which exists for the imputed data on the Edinburgh cohort. 

```
gcta64 --grm /exports/igmm/eddie/GWAS-annotations/YEAR3/GREML_UKB/edinburgh_genotypes/make_grm/full_array \
--make-bK-sparse 0.05 \
--out edinburgh_grm_sparse
```
## Step 4 - run GWAS

Run GWAS using script [run_GWAS.sh](run_GWAS.sh). It shouldn't take more than 10 minutes if you submit as array job on 10 cores (with 10 threads). 
