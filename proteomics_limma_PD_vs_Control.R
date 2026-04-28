# Integrated multi-omics reanalysis of RNA-seq and proteomics data from human substantia nigra dopaminergic neurons in Parkinson’s disease 
# Proteomics - limma
# Parkinson's disease (PD) vs Control


# 1. Package installation
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

if (!requireNamespace("limma", quietly = TRUE)) {
  BiocManager::install("limma")
}

library(limma)


# 2. Read data
input_file <- "../data/PXD024748_LOG2_mean_intensity_matrix.csv"

data <- read.csv(input_file,
                 check.names = FALSE,
                 stringsAsFactors = FALSE)

dim(data)
head(data)
str(data)
summary(data)

# 3. Expression matrix
expr_cols <- c("Ctrl N02","Ctrl N04","Ctrl N06","Ctrl N08","Ctrl N10",
               "PD N01","PD N03","PD N05","PD N07","PD N09")

expr_matrix <- as.matrix(data[, expr_cols])
rownames(expr_matrix) <- data$`Gene names`

# 4. Design matrix
group <- factor(c(rep("Ctrl", 5), rep("PD", 5)))
design <- model.matrix(~ group)

colnames(design) <- c("Intercept", "PD_vs_Ctrl")

# 5. limma analysis
fit <- lmFit(expr_matrix, design)
fit <- eBayes(fit)

# 6. Results table
results <- topTable(fit,
                    coef = "PD_vs_Ctrl",
                    number = Inf,
                    adjust.method = "BH")
# Rename column
colnames(results)[colnames(results) == "logFC"] <- "log2FC"

#show result
head(results)

# 7. Filtering
sig_proteins <- results[
  (results$P.Value < 0.05) &
    (abs(results$log2FC) > 0.5),
]

# 8. Summary stats
cat("Significant proteins (P.Val<0.05 & |log2FC|>0.5):",
    nrow(sig_proteins), "\n")

# 9. Save results
dir.create("../results", showWarnings = FALSE)

write.csv(results,
          file = "../results/PXD024748_limma_results_PD_vs_Ctrl.csv",
          row.names = TRUE)

write.csv(sig_proteins,
          file = "../results/PXD024748_limma_significant_proteins.csv",
          row.names = TRUE)

