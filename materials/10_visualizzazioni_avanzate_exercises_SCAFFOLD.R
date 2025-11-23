# ============================================================================ #
# REVELO Training - Data Viz 2025
# Visualizzazioni Avanzate - SOLUZIONI
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

p1 <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(aes(color = factor(cyl)), size = 3) +
  labs(title = "MPG vs Weight", color = "Cylinders") +
  theme_minimal()

p2 <- ggplot(mtcars, aes(x = factor(cyl), y = mpg)) +
  geom_boxplot(aes(fill = factor(cyl)), show.legend = FALSE) +
  labs(title = "MPG by Cylinders", x = "Cylinders") +
  theme_minimal()

p3 <- ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(bins = 15, fill = "steelblue", color = "white") +
  labs(title = "MPG Distribution") +
  theme_minimal()

# Interpretazione: Creare grafici separati prima di combinarli permette 
# customizzazione individuale. Salviamo in variabili per riutilizzo.


# --- Esercizio 2 -------------------------------------------------------------
# Obiettivo: Combinare i tre grafici affiancati con operatore +

p1 + p2 + p3

# Interpretazione: L'operatore + dispone automaticamente i grafici in griglia.
# Con 3 grafici, default è 2 nella prima riga, 1 nella seconda.


# --- Esercizio 3 -------------------------------------------------------------
# Obiettivo: Combinare i grafici in layout verticale con operatore /

p1 / p2 / p3

# Interpretazione: L'operatore / crea stack verticale. Ogni grafico occupa 
# una riga separata con stessa larghezza.


# --- Esercizio 4 -------------------------------------------------------------
# Obiettivo: Creare layout con p1 e p2 affiancati sopra, p3 sotto occupando 
# tutta la larghezza usando parentesi: (p1 + p2) / p3

(p1 + p2) / p3

# Interpretazione: Le parentesi controllano precedenza operatori. Prima 
# combina p1 + p2 in riga, poi mette p3 sotto occupando tutta larghezza.


# --- Esercizio 5 -------------------------------------------------------------
# Obiettivo: Usare plot_layout() per controllare proporzioni delle colonne
# Affianca p1 e p2 con widths = c(2, 1)

p1 + p2 +
  plot_layout(widths = c(2, 1))

# Interpretazione: widths controlla proporzioni relative. c(2, 1) significa 
# p1 occupa 2/3 dello spazio, p2 occupa 1/3.


# --- Esercizio 6 -------------------------------------------------------------
# Obiettivo: Combinare p1, p2, p3 affiancati con legende collettive
# Usa plot_layout(guides = "collect")

p1 + p2 + p3 +
  plot_layout(guides = "collect")

# Interpretazione: guides = "collect" raccoglie tutte le legende duplicate 
# in una posizione unica, riducendo ridondanza visiva.


# ============================================================================ #
# PARTE 2: PATCHWORK AVANZATO
# ============================================================================ #

# --- Esercizio 7 -------------------------------------------------------------
# Obiettivo: Aggiungere annotazioni globali a una composizione
# Usa plot_annotation() per titolo, sottotitolo e tag_levels = "A"

p1 + p2 + p3 +
  plot_annotation(
    title = "Analisi Completa del Dataset mtcars",
    subtitle = "Relazioni tra consumo, peso e cilindri",
    caption = "Fonte: Motor Trend 1974",
    tag_levels = "A"
  )

# Interpretazione: plot_annotation() aggiunge elementi globali all'intera 
# composizione. tag_levels = "A" crea labels A, B, C automatici per subplot.


# --- Esercizio 8 -------------------------------------------------------------
# Obiettivo: Applicare theme_minimal() a tutti i subplot usando operatore &

p1 + p2 + p3 &
  theme_minimal()

# Interpretazione: L'operatore & applica l'elemento a TUTTI i subplot della 
# composizione. Diverso da +, che applica solo all'ultimo grafico.


# --- Esercizio 9 -------------------------------------------------------------
# Obiettivo: Applicare legend.position = "bottom" globalmente con &, poi 
# aggiungere plot_annotation con titolo "Multi-Panel Analysis"

p1 + p2 + p3 &
  theme(legend.position = "bottom") +
  plot_annotation(
    title = "Multi-Panel Analysis"
  )

# Interpretazione: Combinare & per modifiche globali e + per annotazioni 
# crea composizioni coerenti e ben annotate.


# --- Esercizio 10 ------------------------------------------------------------
# Obiettivo: Creare layout custom usando design testuale
# Design:
#   AAB
#   CCC
# Dove A = p1, B = p2, C = p3

design <- "
  AAB
  CCC
"

p1 + p2 + p3 +
  plot_layout(design = design)

# Interpretazione: Il design testuale permette layouts arbitrari. Lettere 
# uguali = stesso plot espanso. A occupa 2 celle, B 1 cella in prima riga,
# C occupa tutta la seconda riga.


# --- Esercizio 11 ------------------------------------------------------------
# Obiettivo: Usare plot_spacer() per inserire spazio vuoto
# Layout: p1 affiancato a spacer affiancato a p2

p1 + plot_spacer() + p2

# Interpretazione: plot_spacer() crea spazio bianco tra grafici, utile per 
# separazione visiva o allineamento con altre righe di layout complessi.


# --- Esercizio 12 ------------------------------------------------------------
# Obiettivo: Combinare tutto - layout custom, tema globale, annotazioni
# (p1 + p2) / p3, tema bw, titolo "Complete Analysis", tags A/B/C

(p1 + p2) / p3 &
  theme_bw() &
  theme(
    legend.position = "bottom",
    plot.title = element_text(face = "bold")
  ) +
  plot_annotation(
    title = "Complete Analysis",
    tag_levels = "A"
  )

# Interpretazione: Esempio completo che integra layout nesting, temi globali
# e annotazioni. L'ordine conta: & per modifiche globali, poi + per annotation.


# ============================================================================ #
# PARTE 3: GGREPEL
# ============================================================================ #

# --- Esercizio 13 ------------------------------------------------------------
# Obiettivo: Creare scatterplot mtcars (wt vs mpg) con geom_text_repel()
# per etichettare tutte le auto (rownames)

ggplot(mtcars, aes(x = wt, y = mpg, label = rownames(mtcars))) +
  geom_point(color = "steelblue", size = 3) +
  geom_text_repel(size = 3) +
  labs(title = "Car Models by Weight and MPG") +
  theme_minimal()

# Interpretazione: geom_text_repel() riposiziona automaticamente etichette 
# per evitare sovrapposizioni. rownames(mtcars) contiene nomi modelli auto.


# --- Esercizio 14 ------------------------------------------------------------
# Obiettivo: Usare geom_label_repel() invece di geom_text_repel()
# Impostare box.padding = 0.5, point.padding = 0.3

ggplot(mtcars, aes(x = wt, y = mpg, label = rownames(mtcars))) +
  geom_point(color = "steelblue", size = 3) +
  geom_label_repel(
    size = 3,
    box.padding = 0.5,
    point.padding = 0.3,
    segment.color = "grey50"
  ) +
  labs(title = "Car Models with Label Boxes") +
  theme_minimal()

# Interpretazione: geom_label_repel() aggiunge box background per migliore
# leggibilità. box.padding controlla spazio interno box, point.padding 
# controlla distanza minima da punti.


# --- Esercizio 15 ------------------------------------------------------------
# Obiettivo: Etichettare solo auto con mpg > 25
# Crea subset e usa geom_text_repel() solo per quel subset

mtcars_efficient <- mtcars[mtcars$mpg > 25, ]

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(aes(color = mpg > 25), size = 3) +
  geom_text_repel(
    data = mtcars_efficient,
    aes(label = rownames(mtcars_efficient)),
    color = "red",
    fontface = "bold"
  ) +
  scale_color_manual(values = c("grey70", "red")) +
  labs(
    title = "Most Efficient Cars (MPG > 25)",
    color = "Efficient"
  ) +
  theme_minimal()

# Interpretazione: Etichettare solo punti rilevanti migliora leggibilità.
# Passare subset al data argument di geom_text_repel() limita labels.


# --- Esercizio 16 ------------------------------------------------------------
# Obiettivo: Controllare direzione repulsione - solo verticale (direction = "y")

ggplot(mtcars, aes(x = wt, y = mpg, label = rownames(mtcars))) +
  geom_point(color = "steelblue", size = 3) +
  geom_text_repel(
    direction = "y",
    hjust = 0,
    nudge_x = 0.1
  ) +
  labs(title = "Vertical Label Repulsion") +
  theme_minimal()

# Interpretazione: direction = "y" limita movimento labels solo verticalmente,
# mantenendo allineamento orizzontale. Utile per preservare relazioni visive
# con assi. nudge_x sposta leggermente da punti.


# ============================================================================ #
# PARTE 4: HEATMAPS
# ============================================================================ #

# --- Esercizio 17 ------------------------------------------------------------
# Obiettivo: Trasformare mtcars in formato long per heatmap
# Usa pivot_longer() per tutte le colonne eccetto rownames

mtcars_long <- mtcars %>%
  rownames_to_column("car") %>%
  pivot_longer(
    cols = -car,
    names_to = "variable",
    values_to = "value"
  )

# Interpretazione: Le heatmaps in ggplot2 richiedono formato long: ogni riga
# è una cella della matrice. rownames_to_column() converte rownames in colonna.


# --- Esercizio 18 ------------------------------------------------------------
# Obiettivo: Creare heatmap base con geom_tile()
# x = variable, y = car (rownames), fill = value

ggplot(mtcars_long, aes(x = variable, y = car, fill = value)) +
  geom_tile() +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Interpretazione: geom_tile() crea celle rettangolari colorate. fill mappa
# colore al valore. Problema: scale diverse tra variabili (mpg vs hp).


# --- Esercizio 19 ------------------------------------------------------------
# Obiettivo: Scalare i valori per variabile (Z-score) prima di plottare
# Usa group_by(variable) e mutate(value_scaled = scale(value)[,1])

mtcars_scaled <- mtcars_long %>%
  group_by(variable) %>%
  mutate(value_scaled = scale(value)[,1]) %>%
  ungroup()

ggplot(mtcars_scaled, aes(x = variable, y = car, fill = value_scaled)) +
  geom_tile() +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(fill = "Z-score")

# Interpretazione: Scaling (Z-score) rende variabili comparabili portandole
# a mean = 0, sd = 1. scale() restituisce matrice, [,1] estrae vettore.


# --- Esercizio 20 ------------------------------------------------------------
# Obiettivo: Applicare scala colori divergente (gradient2)
# low = "blue", mid = "white", high = "red", midpoint = 0

ggplot(mtcars_scaled, aes(x = variable, y = car, fill = value_scaled)) +
  geom_tile() +
  scale_fill_gradient2(
    low = "blue",
    mid = "white",
    high = "red",
    midpoint = 0,
    name = "Z-score"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "mtcars Heatmap - Scaled Variables")

# Interpretazione: scale_fill_gradient2() crea scala divergente con punto
# centrale. Ideale per dati scalati dove 0 = media. Rosso = sopra media,
# blu = sotto media.


# --- Esercizio 21 ------------------------------------------------------------
# Obiettivo: Ruotare etichette asse x (45 gradi)
# Usa theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(mtcars_scaled, aes(x = variable, y = car, fill = value_scaled)) +
  geom_tile() +
  scale_fill_gradient2(low = "blue", mid = "white", high = "red", midpoint = 0) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    axis.text.y = element_text(size = 8)
  ) +
  labs(title = "Improved Heatmap Layout")

# Interpretazione: Ruotare labels previene sovrapposizioni. angle = 45 è
# compromesso buono tra leggibilità e compattezza. hjust = 1 allinea a destra.


# --- Esercizio 22 ------------------------------------------------------------
# Obiettivo: Aggiungere bordi bianchi alle tiles
# geom_tile(color = "white", size = 0.5)

ggplot(mtcars_scaled, aes(x = variable, y = car, fill = value_scaled)) +
  geom_tile(color = "white", size = 0.5) +
  scale_fill_gradient2(low = "blue", mid = "white", high = "red", midpoint = 0) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Heatmap with Cell Borders")

# Interpretazione: Bordi bianchi separano celle visivamente, migliorando
# percezione valori individuali. size controlla spessore bordi.


# ============================================================================ #
# PARTE 5: VOLCANO PLOTS
# ============================================================================ #

# --- Esercizio 23 ------------------------------------------------------------
# Obiettivo: Creare volcano plot base
# x = log2FC, y = -log10(padj), usa geom_point()

ggplot(volcano_data, aes(x = log2FC, y = -log10(padj))) +
  geom_point(alpha = 0.6) +
  labs(
    title = "Volcano Plot - Differential Expression",
    x = "log2 Fold Change",
    y = "-log10 adjusted p-value"
  ) +
  theme_minimal()

# Interpretazione: Volcano plot visualizza magnitude (x) vs significance (y).
# Punti in alto a destra/sinistra = differenzialmente espressi. -log10 perché
# p-value piccoli (significativi) diventano valori grandi sull'asse y.


# --- Esercizio 24 ------------------------------------------------------------
# Obiettivo: Aggiungere categoria "significant" ai dati
# significant = TRUE se abs(log2FC) > 1 AND padj < 0.05
# Colorare punti in base a significant

volcano_data <- volcano_data %>%
  mutate(
    significant = abs(log2FC) > 1 & padj < 0.05
  )

ggplot(volcano_data, aes(x = log2FC, y = -log10(padj), color = significant)) +
  geom_point(alpha = 0.6, size = 1.5) +
  scale_color_manual(
    values = c("grey70", "red3"),
    labels = c("Not Significant", "Significant")
  ) +
  labs(
    title = "Volcano Plot with Significance Threshold",
    x = "log2 Fold Change",
    y = "-log10 adjusted p-value"
  ) +
  theme_minimal()

# Interpretazione: Soglie comuni: |log2FC| > 1 (2x fold change) e padj < 0.05.
# abs() prende valore assoluto per catturare up- e down-regulation.


# --- Esercizio 25 ------------------------------------------------------------
# Obiettivo: Aggiungere linee soglia
# geom_vline() a x = -1 e x = 1 (dashed)
# geom_hline() a y = -log10(0.05) (dashed)

ggplot(volcano_data, aes(x = log2FC, y = -log10(padj), color = significant)) +
  geom_point(alpha = 0.6, size = 1.5) +
  geom_vline(xintercept = c(-1, 1), linetype = "dashed", color = "grey30") +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed", color = "grey30") +
  scale_color_manual(values = c("grey70", "red3")) +
  labs(
    title = "Volcano Plot with Thresholds",
    x = "log2 Fold Change",
    y = "-log10 adjusted p-value"
  ) +
  theme_minimal()

# Interpretazione: Linee visualizzano soglie chiaramente. 4 quadranti:
# alto-destra = up-regulated significant, alto-sinistra = down-regulated
# significant, basso = non-significant.


# --- Esercizio 26 ------------------------------------------------------------
# Obiettivo: Creare categorie dettagliate di regolazione
# Up-regulated: log2FC > 1 & padj < 0.05
# Down-regulated: log2FC < -1 & padj < 0.05
# Not Significant: altri
# Usare scale_color_manual() con colori rosso, blu, grigio

volcano_data <- volcano_data %>%
  mutate(
    regulation = case_when(
      log2FC > 1 & padj < 0.05 ~ "Up-regulated",
      log2FC < -1 & padj < 0.05 ~ "Down-regulated",
      TRUE ~ "Not Significant"
    ),
    regulation = factor(regulation, levels = c("Up-regulated", "Down-regulated", "Not Significant"))
  )

ggplot(volcano_data, aes(x = log2FC, y = -log10(padj), color = regulation)) +
  geom_point(alpha = 0.7, size = 1.8) +
  scale_color_manual(
    values = c("Up-regulated" = "red3", "Down-regulated" = "blue3", "Not Significant" = "grey70")
  ) +
  geom_vline(xintercept = c(-1, 1), linetype = "dashed", alpha = 0.5) +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed", alpha = 0.5) +
  labs(
    title = "Volcano Plot - Regulation Categories",
    x = "log2 Fold Change",
    y = "-log10 adjusted p-value",
    color = "Regulation"
  ) +
  theme_minimal() +
  theme(legend.position = "top")

# Interpretazione: Categorie tri-partite più informative. case_when() valuta
# condizioni in ordine. Factor con levels definiti controlla ordine legenda.


# --- Esercizio 27 ------------------------------------------------------------
# Obiettivo: Identificare top 10 geni per significatività
# filter(significant == TRUE) %>% arrange(padj) %>% slice_head(n = 10)

top_genes <- volcano_data %>%
  filter(significant == TRUE) %>%
  arrange(padj) %>%
  slice_head(n = 10)

print(top_genes)

# Interpretazione: Pipeline tidyverse: filter mantiene solo significant,
# arrange ordina per p-value (più piccolo = più significativo), slice_head
# prende top 10. Questi geni meritano follow-up sperimentale.


# --- Esercizio 28 ------------------------------------------------------------
# Obiettivo: Aggiungere etichette ai top 10 geni con geom_text_repel()
# Evidenziare top genes con geom_point() di colore diverso

ggplot(volcano_data, aes(x = log2FC, y = -log10(padj))) +
  geom_point(aes(color = regulation), alpha = 0.5, size = 1.5) +
  geom_point(data = top_genes, color = "black", size = 3, shape = 21, fill = "yellow") +
  geom_text_repel(
    data = top_genes,
    aes(label = gene),
    size = 3.5,
    fontface = "bold",
    box.padding = 0.5,
    max.overlaps = Inf
  ) +
  scale_color_manual(values = c("red3", "blue3", "grey70")) +
  geom_vline(xintercept = c(-1, 1), linetype = "dashed", alpha = 0.5) +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed", alpha = 0.5) +
  labs(
    title = "Volcano Plot - Top 10 Most Significant Genes Labeled",
    x = "log2 Fold Change",
    y = "-log10 adjusted p-value",
    color = "Regulation"
  ) +
  theme_minimal()

# Interpretazione: Layering strategico: tutti i punti base, poi highlight
# dei top genes con marker distintivo, infine labels. max.overlaps = Inf
# forza visualizzazione di tutte le labels. shape = 21 permette fill + color.


# ============================================================================ #
# PARTE 6: COMBINAZIONI AVANZATE
# ============================================================================ #

# --- Esercizio 29 ------------------------------------------------------------
# Obiettivo: Combinare volcano plot con barplot delle categorie
# p_volcano: volcano plot completo
# p_bars: geom_bar() delle categorie di regolazione
# Combinare con patchwork in layout 2:1

p_volcano <- ggplot(volcano_data, aes(x = log2FC, y = -log10(padj), color = regulation)) +
  geom_point(alpha = 0.7, size = 1.5) +
  scale_color_manual(values = c("red3", "blue3", "grey70")) +
  geom_vline(xintercept = c(-1, 1), linetype = "dashed", alpha = 0.5) +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed", alpha = 0.5) +
  labs(
    title = "Volcano Plot",
    x = "log2 Fold Change",
    y = "-log10 adj. p-value"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

p_bars <- ggplot(volcano_data, aes(x = regulation, fill = regulation)) +
  geom_bar() +
  scale_fill_manual(values = c("red3", "blue3", "grey70")) +
  geom_text(
    stat = "count",
    aes(label = after_stat(count)),
    vjust = -0.5,
    size = 4
  ) +
  labs(
    title = "Gene Counts",
    x = "",
    y = "Count"
  ) +
  theme_minimal() +
  theme(
    legend.position = "none",
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

p_volcano + p_bars +
  plot_layout(widths = c(2, 1)) +
  plot_annotation(
    title = "Differential Expression Analysis Summary",
    theme = theme(plot.title = element_text(size = 14, face = "bold"))
  )

# Interpretazione: Composizione complementare: volcano mostra pattern spaziale,
# barplot quantifica categorie. Widths 2:1 enfatizza volcano. Legenda rimossa
# perché ridondante con x-axis del barplot.


# --- Esercizio 30 ------------------------------------------------------------
# Obiettivo: Multi-panel completo
# Creare 4 grafici:
# 1. Histogram di log2FC
# 2. Density plot di -log10(padj)
# 3. Barplot delle categorie
# 4. Volcano plot
# Combinare con layout custom, tema unificato, annotazioni globali

p1_hist <- ggplot(volcano_data, aes(x = log2FC, fill = regulation)) +
  geom_histogram(bins = 50, position = "stack") +
  scale_fill_manual(values = c("red3", "blue3", "grey70")) +
  labs(title = "A. Fold Change Distribution", x = "log2 FC", y = "Count") +
  theme_minimal()

p2_density <- ggplot(volcano_data, aes(x = -log10(padj))) +
  geom_density(fill = "steelblue", alpha = 0.7) +
  geom_vline(xintercept = -log10(0.05), linetype = "dashed", color = "red") +
  labs(title = "B. Significance Distribution", x = "-log10 adj. p-value") +
  theme_minimal()

p3_bars <- ggplot(volcano_data, aes(x = regulation, fill = regulation)) +
  geom_bar() +
  scale_fill_manual(values = c("red3", "blue3", "grey70")) +
  geom_text(stat = "count", aes(label = after_stat(count)), vjust = -0.5) +
  labs(title = "C. Regulation Summary", x = "", y = "Gene Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

p4_volcano <- ggplot(volcano_data, aes(x = log2FC, y = -log10(padj), color = regulation)) +
  geom_point(alpha = 0.7, size = 2) +
  scale_color_manual(values = c("red3", "blue3", "grey70")) +
  geom_vline(xintercept = c(-1, 1), linetype = "dashed", alpha = 0.5) +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed", alpha = 0.5) +
  labs(title = "D. Volcano Plot", x = "log2 FC", y = "-log10 adj. p-val") +
  theme_minimal()

# Layout custom: histogram e density sopra, bars e volcano sotto
design <- "
  AABB
  CCDD
"

(p1_hist + p2_density + p3_bars + p4_volcano) +
  plot_layout(design = design, guides = "collect") &
  theme(
    legend.position = "bottom",
    plot.title = element_text(size = 11, face = "bold")
  ) +
  plot_annotation(
    title = "Comprehensive Differential Expression Analysis",
    subtitle = "Multi-Panel Overview of 1000 Genes",
    caption = "Thresholds: |log2FC| > 1, adjusted p-value < 0.05",
    theme = theme(
      plot.title = element_text(size = 16, face = "bold"),
      plot.subtitle = element_text(size = 12)
    )
  )

# Interpretazione: Dashboard completo combina 4 prospettive complementari:
# 1. Distribuzione fold changes (bimodale se molti DEGs)
# 2. Distribuzione significatività (spike a destra se molti significant)
# 3. Conteggi categorie (overview quantitativo)
# 4. Volcano plot classico (relazione magnitude-significance)
# Layout 2x2 bilanciato. & applica tema a tutti, + aggiunge annotazioni globali.
# guides = "collect" unifica legende. Tags automatici A-D orientano lettore.


# ============================================================================ #
# FINE SOLUZIONI
# Congratulazioni! Hai completato tutte le soluzioni per le visualizzazioni 
# avanzate. Questi pattern sono fondamentali per pubblicazioni scientifiche 
# e report professionali.
#
# PROSSIMI PASSI:
# - Applica questi pattern ai tuoi dati reali
# - Sperimenta con palette colori custom
# - Esplora altri pacchetti: gganimate, plotly, ggforce
# - Studia esempi di figure pubblicate in letteratura
# ============================================================================ #
