# MSc Genetic Architecture

Repository for generating GWAS summary statistics for MSc project on genetic architecture testing. We first simulate phenotypes and then run GWAS on the phenotypes. All computation is done in GCTA. 

## Step 1 - generate file list to call 
Where `\effect-sizes` is the file containing simulated genotype effect sizes, we create a list of effect size files with the directory name and without. 

```
ls -lth effect-sizes/*.?.txt| awk '{print $9}' | sort >> file-list.txt
cat file-list.txt | awk 'BEGIN{FS="/"}{print $2}' >> file_list.txt
```
## Step 2 - simulate phenotype

Run the file [produce_phenotype.sh](produce_phenotype.sh) 
