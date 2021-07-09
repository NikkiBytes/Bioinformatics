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

snps <- c('rs53576', 'rs1815739', 'rs6152', 'rs1799971')
snp_chromosomes <- c('3', '11', 'X', '6')
snp_positions <- c(8762685, 66560624, 67545785, 154039662)

snp_genes[3]
snp_genes[1:3]
snp_genes[c(1,3,4)]
snp_genes[c(1:3, 4)]

snp_genes <- c(snp_genes, "CYP1A1", "APOA5")
snp_genes[-6]
snp_genes[-1]

snp_genes <- snp_genes[-6]
snp_genes

snp_genes[7] <- "APOA5"
snp_genes

# Logical Subsetting  

snp_positions[snp_positions >  100000000]

which(snp_positions >  100000000)

snp_marker_cutoff <- 100000000
snp_positions[snp_positions > snp_marker_cutoff]

is.na(snp_genes)

# test to see if "ACTN3" or "APO5A" is in the snp_genes vector
# if you are looking for more than one value, you must pass this as a vector

c("ACTN3","APOA5") %in% snp_genes

typeof(snps)
typeof(snp_chromosomes)

snp_genes <- snp_genes[-5]
snp_genes <- c(snp_genes, NA, NA)
snp_genes

combined <- c(snp_genes[1], snps[1], snp_chromosomes[1], snp_positions[1])
combined

# Lists
# Create a named list using the 'list' function and our SNP examples
# Note, for easy reading we have placed each item in the list on a separate line
# Nothing special about this, you can do this for any multiline commands
# To run this command, make sure the entire command (all 4 lines) are highlighted
# before running
# Note also, as we are doing all this inside the list() function use of the
# '=' sign is good style
snp_data <- list(genes = snp_genes,
                 refference_snp = snps,
                 chromosome = snp_chromosomes,
                 position = snp_positions)
# Examine the structure of the list
str(snp_data)

snp_data$position
snp_data$position[1]

