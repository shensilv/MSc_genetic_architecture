# MSc Genetic Architecture

Repository for generating GWAS summary statistics for MSc project on genetic architecture testing. We first simulate phenotypes and then run GWAS on the phenotypes. All computation is done in GCTA. 

## Step 1 - generate file list to call 
Where `\effect-sizes` is the file containing simulated genotype effect sizes. 

```ls -lth effect-sizes/*.?.txt| awk '{print $9}' | sort >> file-list.txt```


