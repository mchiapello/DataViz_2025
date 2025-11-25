# ============================================================================
# Script per Generare volcano_data
# ============================================================================
# 
# Questo script genera un dataset simulato di differential gene expression
# per esercizi sui volcano plots nel corso di Data Visualization.
#
# Il dataset include:
# - 1000 geni simulati
# - 80 geni up-regulated (log2FC positivo significativo)
# - 70 geni down-regulated (log2FC negativo significativo)
# - 850 geni non significativi
# - p-values e adjusted p-values (Benjamini-Hochberg)
# - Categorizzazione della regolazione
#
# ============================================================================

# Carica pacchetti necessari
library(dplyr)

# Imposta seed per riproducibilità
set.seed(123)

# Parametri dataset
n_genes <- 1000
n_up <- 80      # Up-regulated genes
n_down <- 70    # Down-regulated genes
n_nonsig <- n_genes - n_up - n_down

# Genera volcano_data
volcano_data <- data.frame(
  # Nomi geni
  gene = paste0("Gene_", 1:n_genes),
  
  # log2 Fold Change
  # - Up-regulated: mean = 2.5, sd = 1
  # - Down-regulated: mean = -2.5, sd = 1
  # - Non-significant: mean = 0, sd = 0.7
  log2FC = c(
    rnorm(n_up, mean = 2.5, sd = 1),      # Up-regulated: positive FC
    rnorm(n_down, mean = -2.5, sd = 1),   # Down-regulated: negative FC
    rnorm(n_nonsig, mean = 0, sd = 0.7)   # Non-significant: centered at 0
  ),
  
  # p-values
  # - Significant genes: molto bassi (0 - 0.01)
  # - Non-significant: alti (0.05 - 1)
  pvalue = c(
    runif(n_up, 0, 0.01),                 # Up: very low p-values
    runif(n_down, 0, 0.01),               # Down: very low p-values
    runif(n_nonsig, 0.05, 1)              # Non-sig: high p-values
  )
) %>%
  # Calcola adjusted p-values (metodo Benjamini-Hochberg)
  mutate(
    padj = p.adjust(pvalue, method = "BH"),
    
    # Categorizzazione binaria (significativo/non significativo)
    significant = case_when(
      abs(log2FC) > 1 & padj < 0.05 ~ "Significant",
      TRUE ~ "Not Significant"
    ),
    
    # Categorizzazione dettagliata (5 livelli)
    regulation = case_when(
      log2FC > 1 & padj < 0.05 ~ "Up-regulated",
      log2FC < -1 & padj < 0.05 ~ "Down-regulated",
      abs(log2FC) > 1 ~ "Not Significant (FC only)",
      padj < 0.05 ~ "Not Significant (p-val only)",
      TRUE ~ "Not Significant"
    ),
    
    # Converti regulation in factor con livelli ordinati
    regulation = factor(regulation, levels = c(
      "Up-regulated", 
      "Down-regulated", 
      "Not Significant (FC only)", 
      "Not Significant (p-val only)",
      "Not Significant"
    ))
  )

# ============================================================================
# Verifica e Salvataggio
# ============================================================================

# Stampa summary del dataset
cat("\n=== VOLCANO DATA SUMMARY ===\n")
cat("Totale geni:", nrow(volcano_data), "\n")
cat("\nDistribuzione per categoria:\n")
print(table(volcano_data$regulation))
cat("\nRange log2FC:", range(volcano_data$log2FC), "\n")
cat("Range -log10(padj):", range(-log10(volcano_data$padj)), "\n")

# Salva dataset in formato RDS (preserva tipi di dati)
saveRDS(volcano_data, "volcano_data.rds")
cat("\n✓ Dataset salvato come 'volcano_data.rds'\n")

# Salva anche in formato CSV per compatibilità
write.csv(volcano_data, "volcano_data.csv", row.names = FALSE)
cat("✓ Dataset salvato anche come 'volcano_data.csv'\n")

# ============================================================================
# Come usare questo dataset
# ============================================================================

# Per caricare il dataset in altri script R:
# volcano_data <- readRDS("materials/data/volcano_data.rds")
# oppure
# volcano_data <- read.csv("materials/data/volcano_data.csv")

# Esempio volcano plot base:
# library(ggplot2)
# ggplot(volcano_data, aes(x = log2FC, y = -log10(padj))) +
#   geom_point(aes(color = significant), alpha = 0.6, size = 2) +
#   scale_color_manual(values = c("grey70", "red3")) +
#   geom_vline(xintercept = c(-1, 1), linetype = "dashed") +
#   geom_hline(yintercept = -log10(0.05), linetype = "dashed") +
#   labs(
#     title = "Volcano Plot",
#     x = "log2 Fold Change",
#     y = "-log10(adjusted p-value)"
#   ) +
#   theme_bw()
