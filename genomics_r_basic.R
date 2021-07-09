"""
R Basics 
"""

# Exercise 1
human_chr_number <- 23
gene_name <- 'pten'
ensemble_url <- 'ftp://ftp.ensemblgenomes.org/pub/bacteria/release-39/fasta/bacteria_5_collection/escherichia_coli_b_str_rel606/'
human_diploid_chr_num <- 2 * human_chr_number


# reassigning object names
gene_name <- 'tp53'
# delete the object 'gene_name'
rm(gene_name)

# Data Types

# Exercise 2: Create objs and check their modes

chromosome_name <- 'chr02'
od_600_value <- 0.47
chr_position <- '1001701'
spock <- TRUE
pilot <- "Earhart"

mode(chromosome_name)
mode(od_600_value)
mode(chr_position)
mode(spock)
mode(pilot)

# Exercise: Compute the Golden Ratio
round((1+sqrt(5))/2, digits=3)


# Vectors

snp_genes <- c("OXTR", "ACTN3", "AR", "OPRM1")

mode(snp_genes)
length(snp_genes)
str(snp_genes)
