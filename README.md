# chis_mc: multiple chi squere or Fisher test comparation 
This is a code to make 2x2 paired comparisons using the chi square approach or fisher's exact test. 
The analysis applies the Bonferroni correction for multiple comparisons

## Define site categories
site <- c("DOMESTIC", "VILLAGES", "DOMESTIC", "SYLVATIC", "VILLAGES", "DOMESTIC", "SYLVATIC", "VILLAGES")
# Define infected counts
infected <- c(385, 504, 514, 107, 257, 117, 450, 13)
# Define uninfected counts
uninfected <- c(445, 496, 100, 578, 647, 412, 484, 737)
# Create the data frame
data <- data.frame(site, infected, uninfected)

# Compare 
compare_pairs(data)

## Citation

Amblard-Rambert Antoine & Moo-Millan Joel Israel (2024). chisq_mc: Chi-square pairwise comparisons. R package version 0.1
  


