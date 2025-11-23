# ============================================================================ #
# REVELO Training - Data Viz 2025
# Visualizzazioni Avanzate - Esercizi
# ============================================================================ #

# SETUP ----------------------------------------------------------------------
# Carica i pacchetti necessari
library(tidyverse)
library(patchwork)
library(ggrepel)

# Carica i dati
data("mtcars")
data("diamonds")

# Simula dati gene expression per volcano plot
set.seed(42)
volcano_data <- data.frame(
  gene = paste0("Gene_", 1:1000),
  log2FC = rnorm(1000, mean = 0, sd = 2),
  pvalue = runif(1000, 0, 1)
) %>%
  mutate(padj = p.adjust(pvalue, method = "BH"))


# ============================================================================ #
# PARTE 1: PATCHWORK BASE
# ============================================================================ #

# --- Esercizio 1 -------------------------------------------------------------
# Obiettivo: Creare tre grafici separati da combinare
# - p1: scatterplot di mtcars (mpg vs wt)
# - p2: boxplot di mtcars (cyl vs mpg)
# - p3: histogram di mtcars (mpg)




# --- Esercizio 2 -------------------------------------------------------------
# Obiettivo: Combinare i tre grafici affiancati con operatore +




# --- Esercizio 3 -------------------------------------------------------------
# Obiettivo: Combinare i grafici in layout verticale con operatore /




# --- Esercizio 4 -------------------------------------------------------------
# Obiettivo: Creare layout con p1 e p2 affiancati sopra, p3 sotto occupando 
# tutta la larghezza usando parentesi: (p1 + p2) / p3




# --- Esercizio 5 -------------------------------------------------------------
# Obiettivo: Usare plot_layout() per controllare proporzioni delle colonne
# Affianca p1 e p2 con widths = c(2, 1)




# --- Esercizio 6 -------------------------------------------------------------
# Obiettivo: Combinare p1, p2, p3 affiancati con legende collettive
# Usa plot_layout(guides = "collect")




# ============================================================================ #
# PARTE 2: PATCHWORK AVANZATO
# ============================================================================ #

# --- Esercizio 7 -------------------------------------------------------------
# Obiettivo: Aggiungere annotazioni globali a una composizione
# Usa plot_annotation() per titolo, sottotitolo e tag_levels = "A"




# --- Esercizio 8 -------------------------------------------------------------
# Obiettivo: Applicare theme_minimal() a tutti i subplot usando operatore &




# --- Esercizio 9 -------------------------------------------------------------
# Obiettivo: Applicare legend.position = "bottom" globalmente con &, poi 
# aggiungere plot_annotation con titolo "Multi-Panel Analysis"




# --- Esercizio 10 ------------------------------------------------------------
# Obiettivo: Creare layout custom usando design testuale
# Design:
#   AAB
#   CCC
# Dove A = p1, B = p2, C = p3




# --- Esercizio 11 ------------------------------------------------------------
# Obiettivo: Usare plot_spacer() per inserire spazio vuoto
# Layout: p1 affiancato a spacer affiancato a p2




# --- Esercizio 12 ------------------------------------------------------------
# Obiettivo: Combinare tutto - layout custom, tema globale, annotazioni
# (p1 + p2) / p3, tema bw, titolo "Complete Analysis", tags A/B/C




# ============================================================================ #
# PARTE 3: GGREPEL
# ============================================================================ #

# --- Esercizio 13 ------------------------------------------------------------
# Obiettivo: Creare scatterplot mtcars (wt vs mpg) con geom_text_repel()
# per etichettare tutte le auto (rownames)




# --- Esercizio 14 ------------------------------------------------------------
# Obiettivo: Usare geom_label_repel() invece di geom_text_repel()
# Impostare box.padding = 0.5, point.padding = 0.3




# --- Esercizio 15 ------------------------------------------------------------
# Obiettivo: Etichettare solo auto con mpg > 25
# Crea subset e usa geom_text_repel() solo per quel subset




# --- Esercizio 16 ------------------------------------------------------------
# Obiettivo: Controllare direzione repulsione - solo verticale (direction = "y")




# ============================================================================ #
# PARTE 4: HEATMAPS
# ============================================================================ #

# --- Esercizio 17 ------------------------------------------------------------
# Obiettivo: Trasformare mtcars in formato long per heatmap
# Usa pivot_longer() per tutte le colonne eccetto rownames




# --- Esercizio 18 ------------------------------------------------------------
# Obiettivo: Creare heatmap base con geom_tile()
# x = variable, y = car (rownames), fill = value




# --- Esercizio 19 ------------------------------------------------------------
# Obiettivo: Scalare i valori per variabile (Z-score) prima di plottare
# Usa group_by(variable) e mutate(value_scaled = scale(value)[,1])




# --- Esercizio 20 ------------------------------------------------------------
# Obiettivo: Applicare scala colori divergente (gradient2)
# low = "blue", mid = "white", high = "red", midpoint = 0




# --- Esercizio 21 ------------------------------------------------------------
# Obiettivo: Ruotare etichette asse x (45 gradi)
# Usa theme(axis.text.x = element_text(angle = 45, hjust = 1))




# --- Esercizio 22 ------------------------------------------------------------
# Obiettivo: Aggiungere bordi bianchi alle tiles
# geom_tile(color = "white", size = 0.5)




# ============================================================================ #
# PARTE 5: VOLCANO PLOTS
# ============================================================================ #

# --- Esercizio 23 ------------------------------------------------------------
# Obiettivo: Creare volcano plot base
# x = log2FC, y = -log10(padj), usa geom_point()




# --- Esercizio 24 ------------------------------------------------------------
# Obiettivo: Aggiungere categoria "significant" ai dati
# significant = TRUE se abs(log2FC) > 1 AND padj < 0.05
# Colorare punti in base a significant




# --- Esercizio 25 ------------------------------------------------------------
# Obiettivo: Aggiungere linee soglia
# geom_vline() a x = -1 e x = 1 (dashed)
# geom_hline() a y = -log10(0.05) (dashed)




# --- Esercizio 26 ------------------------------------------------------------
# Obiettivo: Creare categorie dettagliate di regolazione
# Up-regulated: log2FC > 1 & padj < 0.05
# Down-regulated: log2FC < -1 & padj < 0.05
# Not Significant: altri
# Usare scale_color_manual() con colori rosso, blu, grigio




# --- Esercizio 27 ------------------------------------------------------------
# Obiettivo: Identificare top 10 geni per significatività
# filter(significant == TRUE) %>% arrange(padj) %>% slice_head(n = 10)




# --- Esercizio 28 ------------------------------------------------------------
# Obiettivo: Aggiungere etichette ai top 10 geni con geom_text_repel()
# Evidenziare top genes con geom_point() di colore diverso




# ============================================================================ #
# PARTE 6: COMBINAZIONI AVANZATE
# ============================================================================ #

# --- Esercizio 29 ------------------------------------------------------------
# Obiettivo: Combinare volcano plot con barplot delle categorie
# p_volcano: volcano plot completo
# p_bars: geom_bar() delle categorie di regolazione
# Combinare con patchwork in layout 2:1




# --- Esercizio 30 ------------------------------------------------------------
# Obiettivo: Multi-panel completo
# Creare 4 grafici:
# 1. Histogram di log2FC
# 2. Density plot di -log10(padj)
# 3. Barplot delle categorie
# 4. Volcano plot
# Combinare con layout custom, tema unificato, annotazioni globali




# ============================================================================ #
# FINE ESERCIZI
# Ottimo lavoro! Hai completato tutti gli esercizi sulle visualizzazioni 
# avanzate. Controlla le soluzioni per confrontare gli approcci.
# ============================================================================ #
