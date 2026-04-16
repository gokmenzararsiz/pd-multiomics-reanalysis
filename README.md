# Integrated Multi-Omics Reanalysis of RNA-seq and Proteomics Data in Parkinson’s Disease

**Aysegul Murat, Leila Kianmehr, Aleyna Erakcaoglu, Gokmen Zararsiz**

---

## Overview

This repository contains scripts for the reanalysis of publicly available RNA-seq (GEO: GSE169755) and proteomics (PRIDE: PXD024748) datasets from human substantia nigra dopaminergic neurons in Parkinson’s disease.

The aim is to identify shared molecular signatures through differential expression and cross-omics integration.

---

## Data Availability

The datasets analyzed in this study are publicly available:

* RNA-seq: GEO – **GSE169755**
* Proteomics: PRIDE – **PXD024748**

Raw data are not included in this repository. Please download them directly from the original sources.

---

---

## Methods Summary

* RNA-seq analysis: DESeq2
* Proteomics analysis: Perseus + limma
* Functional enrichment: clusterProfiler, GSEApy
  <img width="1920" height="1080" alt="workflow" src="https://github.com/user-attachments/assets/890c5492-847e-4a9d-9ba3-6374c7482e66" />


---

## Software

* R (≥4.2)
* Python (≥3.8)
DESeq2, limma, clusterProfiler, GSEApy

---

## Notes

* This repository contains only the essential analysis scripts.
* Intermediate files and large datasets are not included.

---

## Citation

If you use this code, please cite the corresponding article.
