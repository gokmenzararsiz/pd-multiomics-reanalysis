# Integrated Multi-Omics Reanalysis of RNA-seq and Proteomics Data in Parkinson’s Disease

**Aysegul Murat, Leila Kianmehr, Aleyna Erakcaoglu, Gokmen Zararsiz**

---

## Overview

This repository contains scripts for the reanalysis of publicly available RNA-seq (GEO: GSE169755) and proteomics (PRIDE: PXD024748) datasets from human substantia nigra dopaminergic neurons in Parkinson’s disease.

The aim is to identify shared molecular signatures through differential expression and cross-omics integration.

  <img width="1920" height="1080" alt="main figure workflow" src="https://github.com/user-attachments/assets/3f034900-53d0-4f70-a8e1-bb4f988cc47d" />
  
---

## Data Availability

The datasets analyzed in this study are publicly available:

* RNA-seq: GEO – **GSE169755**
* Proteomics: PRIDE – **PXD024748**

Raw data are not included in this repository. Please download them directly from the original sources.

---

---
## Repository Structure
.
├── data/
│   ├── GSE169755_DESeq2_DEGenes.xlsx
│   ├── PXD024748_LOG2_mean_intensity_matrix.csv
│   ├── PXD024748_limma_results_PD_vs_Ctrl.csv
│   └── PXD024748_limma_significant_proteins.csv
│
├── proteomics_limma_PD_vs_Control.Rmd
├── proteomics_visualization_PD_vs_Control.ipynb
│
├── LICENSE
└── README.md
---


---

## Methods Summary

* RNA-seq analysis: DESeq2
* Proteomics analysis: Perseus, limma
* Functional enrichment analysis: clusterProfiler, GSEApy
* Cross-omics integration:
    overlap and pathway-level comparison

---


## Notes

* This repository contains only the essential analysis scripts.
* Intermediate files and large datasets are not included.

---

## Citation

If you use this code, please cite the corresponding article.
| Integrated Multi-Omics Reanalysis of RNA-seq and Proteomics Data from Human Substantia Nigra Dopaminergic Neurons in Parkinson’s Disease
