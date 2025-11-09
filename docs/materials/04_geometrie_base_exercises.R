# =============================================================================
# ESERCIZI: Geometrie Base in ggplot2
# REVELO Training - Data Viz 2025
# =============================================================================
# 
# Istruzioni:
# - Completa ogni esercizio scrivendo il codice richiesto
# - Esegui il codice per verificare che funzioni
# - Confronta con le soluzioni a fine corso
# - Sperimenta con variazioni!
#
# =============================================================================

# SETUP -----------------------------------------------------------------------
library(ggplot2)
library(dplyr)

# Carica datasets
data(mpg)
data(diamonds)
data(economics)
data(faithful)


# =============================================================================
# PARTE 1: RELAZIONI TRA VARIABILI
# =============================================================================

# ESERCIZIO 1: Scatter Plot Base ----------------------------------------------
# Obiettivo: Creare uno scatter plot per esplorare la relazione tra 
#            cilindrata (displ) e consumo autostrada (hwy)
# Dataset: mpg

# Il tuo codice qui:




# ESERCIZIO 2: Ridurre Overplotting ------------------------------------------
# Obiettivo: Usa la trasparenza (alpha = 0.4) per migliorare la visualizzazione

# Il tuo codice qui:




# ESERCIZIO 3: Aggiungere Trend Line -----------------------------------------
# Obiettivo: Aggiungi una linea di trend lineare usando geom_smooth(method = "lm")

# Il tuo codice qui:




# ESERCIZIO 4: LOESS vs Linear -----------------------------------------------
# Obiettivo: Confronta trend lineare (rosso) con LOESS (blu)

# Il tuo codice qui:




# ESERCIZIO 5: Time Series con Line ------------------------------------------
# Obiettivo: Visualizza disoccupazione (unemploy) nel tempo (date) con geom_line()
# Dataset: economics

# Il tuo codice qui:




# ESERCIZIO 6: Path vs Line --------------------------------------------------
# Obiettivo: Usa geom_path() per tracciare unemploy vs psavert + aggiungi punti

# Il tuo codice qui:




# =============================================================================
# PARTE 2: DISTRIBUZIONI - 1 VARIABILE
# =============================================================================

# ESERCIZIO 7: Histogram Base ------------------------------------------------
# Obiettivo: Crea istogramma di carat (peso diamanti) con bins = 30
# Dataset: diamonds

# Il tuo codice qui:




# ESERCIZIO 8: Sperimentare con Bins -----------------------------------------
# Obiettivo: Prova bins = 10, bins = 100, e bins = 40. Quale è migliore?

# bins = 10 (troppo grossolano)


# bins = 100 (troppo dettagliato)


# bins = 40 (equilibrato)




# ESERCIZIO 9: Density Plot --------------------------------------------------
# Obiettivo: Crea curva di densità per hwy (consumo autostrada)

# Il tuo codice qui:




# ESERCIZIO 10: Histogram + Density Sovrapposti ------------------------------
# Obiettivo: Combina histogram e density. Usa aes(y = after_stat(density))!

# Il tuo codice qui:




# ESERCIZIO 11: Frequency Polygon --------------------------------------------
# Obiettivo: Usa geom_freqpoly() per visualizzare distribuzione di price (bins = 50)

# Il tuo codice qui:




# ESERCIZIO 12: Dotplot per Dataset Piccolo ----------------------------------
# Obiettivo: Usa geom_dotplot() per waiting in faithful (binwidth = 1)
# Dataset: faithful

# Il tuo codice qui:




# =============================================================================
# PARTE 3: DISTRIBUZIONI - 2 VARIABILI
# =============================================================================

# ESERCIZIO 13: Bin2D per Big Data -------------------------------------------
# Obiettivo: Usa geom_bin2d() per carat vs price (bins = 50)
# Dataset: diamonds

# Il tuo codice qui:




# ESERCIZIO 14: Hexbin Alternative -------------------------------------------
# Obiettivo: Ricrea con geom_hex() e scale_fill_viridis_c()
# Nota: Richiede install.packages("hexbin") se non installato

# Il tuo codice qui:




# ESERCIZIO 15: Density 2D Contours ------------------------------------------
# Obiettivo: Aggiungi contorni densità 2D a faithful (eruptions vs waiting)
# Dataset: faithful

# Il tuo codice qui:




# ESERCIZIO 16: Filled Density 2D --------------------------------------------
# Obiettivo: Usa geom_density2d_filled() per mappa di calore

# Il tuo codice qui:




# =============================================================================
# PARTE 4: STATISTICHE RIASSUNTIVE
# =============================================================================

# ESERCIZIO 17: Boxplot per Gruppi -------------------------------------------
# Obiettivo: Confronta hwy tra classi di auto con geom_boxplot()
# Dataset: mpg

# Il tuo codice qui:




# ESERCIZIO 18: Violin Plot --------------------------------------------------
# Obiettivo: Ricrea il grafico precedente con geom_violin()

# Il tuo codice qui:




# ESERCIZIO 19: Violin + Boxplot Combinati -----------------------------------
# Obiettivo: Sovrapponi boxplot (width = 0.15) dentro violin plot

# Il tuo codice qui:




# ESERCIZIO 20: Bar Chart - Conteggi -----------------------------------------
# Obiettivo: Conta auto per classe con geom_bar() (solo x, no y!)

# Il tuo codice qui:




# ESERCIZIO 21: Preparare Dati Aggregati per geom_col() ---------------------
# Obiettivo: Calcola consumo medio per classe e visualizza con geom_col()

# Aggrega dati
mpg_summary <- mpg %>%
  group_by(class) %>%
  summarise(
    mean_hwy = mean(hwy),
    sd_hwy = sd(hwy)
  )

# Visualizza con geom_col




# =============================================================================
# PARTE 5: INCERTEZZA E INTERVALLI
# =============================================================================

# ESERCIZIO 22: Barre + Error Bars -------------------------------------------
# Obiettivo: Aggiungi barre di errore (± SD) usando geom_errorbar()

# Il tuo codice qui (usa mpg_summary dall'esercizio 21):




# ESERCIZIO 23: Pointrange ---------------------------------------------------
# Obiettivo: Usa geom_pointrange() invece di col + errorbar

# Il tuo codice qui:




# ESERCIZIO 24: Ribbon per Time Series ---------------------------------------
# Obiettivo: Crea banda di confidenza intorno a serie temporale
# Dataset: economics

# Prepara dati con bande
economics_ribbon <- economics %>%
  mutate(
    lower = unemploy - 500,
    upper = unemploy + 500
  )

# Crea grafico con geom_ribbon() + geom_line()




# =============================================================================
# PARTE 6: COMBINAZIONI AVANZATE
# =============================================================================

# ESERCIZIO 25: Multi-layer Scatter ------------------------------------------
# Obiettivo: Combina geom_rug() + geom_point() + geom_smooth()

# Il tuo codice qui:




# ESERCIZIO 26: Histogram Sovrapposti (Freq Poly) ----------------------------
# Obiettivo: Confronta hwy per 4WD vs non-4WD con geom_freqpoly()

# Prepara dati
mpg_drv <- mpg %>%
  mutate(is_4wd = ifelse(drv == "4", "4WD", "Non-4WD"))

# Crea grafico con color = is_4wd




# ESERCIZIO 27: Boxplot Orizzontale ------------------------------------------
# Obiettivo: Boxplot class vs hwy + coord_flip()

# Il tuo codice qui:




# ESERCIZIO 28: Density 2D + Points ------------------------------------------
# Obiettivo: Combina geom_density2d_filled() con geom_point() su faithful
# Dataset: faithful

# Il tuo codice qui:




# ESERCIZIO 29: Smooth con Intervallo Personalizzato -------------------------
# Obiettivo: Smooth con CI 99% invece del 95% (level = 0.99)

# Il tuo codice qui:




# ESERCIZIO 30: Boxplot con Notch --------------------------------------------
# Obiettivo: Usa notch = TRUE per mostrare CI della mediana

# Il tuo codice qui:




# =============================================================================
# FINE ESERCIZI
# =============================================================================
# 
# Congratulazioni! Hai completato tutti gli esercizi.
# 
# Prossimi passi:
# - Rivedi gli esercizi dove hai avuto difficoltà
# - Sperimenta con altri dataset (iris, mtcars, ToothGrowth)
# - Prova a combinare 3+ geom in un grafico
# - Esplora la documentazione: ?geom_point, ?geom_histogram, etc.
# 
# Le soluzioni saranno fornite a fine corso!
# =============================================================================
