# qiime2-to-R
# Qiime2 table into R (e.g. Phyloseq, Vegan)
This workflow include exporting files from Qiime2, manually and R reformatting prior to importing the data into Phyloseq.

## Export OTU table from Qiime2
Note: This reformatting were based on Qiime2-2018.2

Note: OTU.qza can be either after DADA2 (ASV table) or VSEARCH (OTU table) 

```
source activate qiime2-2018.2

qiime tools export OTU.qza --output-dir output_folder

biom convert -i output_folder/feature-table.biom -o 97_dada2.table_cut190_10.txt --to-tsv
```


## Obtain Taxonomy file from Qiime2

Option 1: Unarchive your Qiime2 table (w taxonomy information added), find the file named "taxonomy.tsv"
Option 2: Drag the Qiime2 table (w taxonomy information added) to Textwrangler in Mac. Fine the file named "taxonomy.tsv".


## Manual format

For both the taxonomy.tsv and the 97_dada2.table_cut190_10.txt, change #OTUID to OTUID.
Remove the first line from 97_dada2.table_cut190_10.txt

## Run phyloseq_try.R
Double check the metadata format (example file: metadata_ITS.txt)

#### More references:
https://github.com/joey711/phyloseq/issues/821


