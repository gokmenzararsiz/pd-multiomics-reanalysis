# 1. Package installation
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

if (!requireNamespace("DESeq2", quietly = TRUE)) {
  BiocManager::install("DESeq2")
}

library(DESeq2)

# 2. Read data
#Count_matrix_input <- "../data/GSE169755_Count_matrix.csv"

countData <- read.table("GSE169755_counts_matrix.txt",
                 check.names = FALSE,
                 stringsAsFactors = FALSE)

cData <- read.table("colData.txt", header = TRUE)

# 3. Pre-filtering
colData <- data.frame(
  condition = factor(cData$group, levels = c("Control", "PD"))
)
rownames(colData) <- colnames(countData)
dds <- DESeqDataSetFromMatrix(countData = countData,
                              colData = colData,
                              design = ~ condition)

keep <- rowSums(counts(dds) >= 10) >= 3
dds <- dds[keep, ]

# 4. Differential Expression analysis
dds <- DESeq(dds)
res <- results(dds, contrast = c("condition", "PD", "Control"))
resOrdered <- res[order(res$padj), ]


# 5. Significant genes

res <- res[order(res$padj), ]
res05 <- results(dds, alpha=0.05)
summary(res05)


# 6. Save results

write.csv(as.data.frame(resOrdered), 
          file="../results/DESeq2_results_PD_vs_Ctrl.csv")

write.csv(res05,
          file = "../results/GSE169755_DESeq2_significant_genes.csv")



