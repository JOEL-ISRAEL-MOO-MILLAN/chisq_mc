chisq_mc <- function(data) {

  col_sites <- 1  
  col_values <- 2:ncol(data)  
  
  sites <- as.character(data[, col_sites])
  n <- length(sites)
  
  results <- data.frame(`comparison pairs` = character(),
                           x2 = numeric(),
                           p_value = numeric(),
                           p_value_adj = numeric(),
                           Fisher_Test = character(),
                           Signif = character(),
                           stringsAsFactors = FALSE)
  
  for (i in 1:(n-1)) {
    for (j in (i+1):n) {
      sub_table <- data[c(i, j), col_values]
      if (any(sub_table == 0) || any(chisq.test(as.table(as.matrix(sub_table)))$expected < 5)) {
        fisher <- fisher.test(as.table(as.matrix(sub_table)))
        comparison <- paste(sites[i], "vs", sites[j])
        p_value <- fisher$p.value
        results <- rbind(results, data.frame(`comparison pairs` = comparison,
                                                   x2 = NA,
                                                   p_value = p_value,
                                                   p_value_adj = NA,  # Placeholder
                                                   Fisher_Test = "Yes",
                                                   Signif = "",  # Placeholder,
                                                   stringsAsFactors = FALSE))
      } else {
        chi_cuadrado <- chisq.test(as.table(as.matrix(sub_table)), correct = TRUE)
        comparison <- paste(sites[i], "vs", sites[j])
        p_value <- chi_cuadrado$p.value
        results <- rbind(results, data.frame(`comparison pairs` = comparison,
                                                   x2 = chi_cuadrado$statistic,
                                                   p_value = p_value,
                                                   p_value_adj = NA,  
                                                   Fisher_Test = "No",
                                                   Signif = "", 
                                                   stringsAsFactors = FALSE))
      }
    }
  }
  
  # Apply Bonferroni correction
  m <- nrow(results)
  results$p_value_adj <- p.adjust(results$p_value, method = "bonferroni")
  results$Signif <- ifelse(results$p_value_adj < 0.001, "***",
                              ifelse(results$p_value_adj < 0.01, "**",
                                     ifelse(results$p_value_adj < 0.05, "*",
                                            ifelse(results$p_value_adj < 0.1, "NS",
                                                   "NS"))))
  
  # Print the table with the significance code at the end
  print(results, row.names = FALSE)
  
  # Print the code line of significance
  cat("\nSignif. codes: ***= 0.0001; **=0.001; *=0.01 ; 0.05=NS; 0.1=NS
  \ngithub:https://github.com/JOEL-ISRAEL-MOO-MILLAN\nDesigned by Antoine Amblard-Rambert & Moo-Millan Joel Israel\n")
  
  #return(results)
}
