## Prior steps##

setwd("/Users/kc178/Documents/Florida_projects/florencia/ITS/qiime/cut190_E10/phyloseq")
otu	<-	read.delim("97_dada2.table_cut190_10.txt",header	=	TRUE)
tax<-read.delim("taxonomy.tsv",header=TRUE)
merged<-merge(otu,tax,by="OTUID")
#tax_filtered <- tax[tax$OTUID %in% features$OTUID,]
tax_filtered <- separate(merged, Taxon, c("Kingdom","Phylum","Class","Order", "Family", "Genus","Species"), sep= ";", remove=TRUE)
write.csv(tax_filtered, file="taxonomy_phyloseq.csv",row.names=FALSE)


library("ggplot2")
library("phyloseq")
library("ape")

otu_table	<-	read.csv("taxonomy_phyloseq.csv",	sep=",")
#otu_table	<-	as.matrix(otu_table)
otu_number<-otu_table[,2:101]
row.names(otu_number)<-otu_table[,1]
dim(otu_number)

otus<-as.matrix(otu_number[,1:93])
taxonomy<-as.matrix(otu_number[,94:100])

## Note this is the original metadata used for Qiime2#
metadata <-read.delim("metadata_ITS.txt")
metadata<-metadata[-1,]
meta<-metadata[1:93,2:5]
row.names(meta)<-metadata[,1]

OTU = otu_table(otus, taxa_are_rows = TRUE) 
TAX = tax_table(taxonomy)
META = sample_data(meta)


physeq = phyloseq(OTU, TAX,META)
physeq

plot_bar(physeq, fill = "Phylum")



