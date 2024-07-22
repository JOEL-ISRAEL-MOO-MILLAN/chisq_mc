# chisq_mc
site <- c("DOMESTIC", "VILLAGES", "DOMESTIC", "SYLVATIC", 
          "VILLAGES", "DOMESTIC", "SYLVATIC", "VILLAGES")
infected <- c(385, 504, 514, 107, 257, 117, 450, 13)
uninfected <- c(445, 496, 100, 578, 647, 412, 484, 737)

# Combine data vectors into a dataframe
data <- data.frame(site, infected, uninfected)

compare_pairs(data)
