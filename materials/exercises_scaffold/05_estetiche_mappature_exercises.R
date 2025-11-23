# =============================================================================
# ESERCIZI: Estetiche e Mappature in ggplot2
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
data(mtcars)

# =============================================================================
# PARTE 1: COLOR AESTHETIC
# =============================================================================

# ESERCIZIO 1: Color Discreto Base -----------------------------------------
# Obiettivo: Creare scatter plot di displ vs hwy, colorando per drv (tipo trazione)
# Dataset: mpg

# Il tuo codice qui:
ggplot(mpg, aes(x = displ, y = hwy, color = )) +  # <-- Aggiungi l'estetica color
  geom_point()




# ESERCIZIO 2: Color Continuo -----------------------------------------------
# Obiettivo: Scatter plot displ vs hwy, con color basato su cty (consumo città)

# Il tuo codice qui:
ggplot(mpg, aes(x = displ, y = hwy, color = )) +  # <-- Aggiungi variabile continua
  geom_point()




# ESERCIZIO 3: Color con Linee ----------------------------------------------
# Obiettivo: Line plot di economics: date vs unemploy, colorando per anno
# Dataset: economics
# Suggerimento: usa lubridate::year() o format(date, "%Y")

# Il tuo codice qui:




# ESERCIZIO 4: Palette Viridis ----------------------------------------------
# Obiettivo: Ripeti esercizio 2, ma usa scale_color_viridis_c()

# Il tuo codice qui:
ggplot(mpg, aes(x = displ, y = hwy, color = cty)) +
  geom_point() +
  scale_color_viridis_c()  # <-- Aggiungi la scala viridis




# ESERCIZIO 5: Gradient Personalizzato --------------------------------------
# Obiettivo: Scatter plot diamonds: carat vs price, color su depth
#            Usa gradient da "yellow" a "red"
# Dataset: diamonds

# Il tuo codice qui:




# =============================================================================
# PARTE 2: FILL AESTHETIC
# =============================================================================

# ESERCIZIO 6: Fill per Bar Chart -------------------------------------------
# Obiettivo: Bar chart di mpg per class, riempimento per drv

# Il tuo codice qui:
ggplot(mpg, aes(x = class, fill = )) +  # <-- Aggiungi l'estetica fill
  geom_bar()




# ESERCIZIO 7: Fill con Density ---------------------------------------------
# Obiettivo: Density plot di hwy, con fill per drv e alpha = 0.5

# Il tuo codice qui:




# ESERCIZIO 8: Color e Fill Insieme -----------------------------------------
# Obiettivo: Bar chart di class, fill per class, bordo nero

# Il tuo codice qui:




# ESERCIZIO 9: Histogram con Fill -------------------------------------------
# Obiettivo: Histogram di carat (diamonds), fill per cut, position = "dodge"

# Il tuo codice qui:




# ESERCIZIO 10: Boxplot con Fill --------------------------------------------
# Obiettivo: Boxplot di hwy per class, fill per class, bordo "darkgray"

# Il tuo codice qui:




# =============================================================================
# PARTE 3: SIZE E SHAPE
# =============================================================================

# ESERCIZIO 11: Size Continuo -----------------------------------------------
# Obiettivo: Scatter plot displ vs hwy, size basato su cyl

# Il tuo codice qui:
ggplot(mpg, aes(x = displ, y = hwy, size = )) +  # <-- Aggiungi l'estetica size
  geom_point()




# ESERCIZIO 12: Size + Color ------------------------------------------------
# Obiettivo: Scatter plot wt vs mpg (mtcars), size = hp, color = cyl
# Dataset: mtcars

# Il tuo codice qui:




# ESERCIZIO 13: Shape Discreto ----------------------------------------------
# Obiettivo: Scatter plot displ vs hwy, shape basato su drv, size = 3

# Il tuo codice qui:




# ESERCIZIO 14: Shape + Color (Ridondanza) ----------------------------------
# Obiettivo: Scatter plot displ vs hwy, shape E color entrambi per drv

# Il tuo codice qui:




# ESERCIZIO 15: Shape Personalizzato ----------------------------------------
# Obiettivo: Scatter plot displ vs hwy, usa shape = 21, 
#            color = "black", fill = "steelblue", size = 3

# Il tuo codice qui:




# =============================================================================
# PARTE 4: ALPHA (TRASPARENZA)
# =============================================================================

# ESERCIZIO 16: Alpha Fisso per Overplotting --------------------------------
# Obiettivo: Scatter plot di diamonds (tutti i dati): carat vs price
#            Usa alpha = 0.1 per gestire overplotting
# Dataset: diamonds

# Il tuo codice qui:
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point(alpha = )  # <-- Aggiungi il valore alpha




# ESERCIZIO 17: Alpha Variabile ---------------------------------------------
# Obiettivo: Scatter plot mpg: displ vs hwy, alpha basato su cty

# Il tuo codice qui:




# ESERCIZIO 18: Alpha con Density -------------------------------------------
# Obiettivo: Density plot di hwy, fill per drv, alpha = 0.4

# Il tuo codice qui:




# ESERCIZIO 19: Alpha in Geom_ribbon ----------------------------------------
# Obiettivo: Line plot economics: date vs unemploy, 
#            aggiungi ribbon da unemploy-500 a unemploy+500, alpha = 0.3
# Dataset: economics

# Il tuo codice qui:




# ESERCIZIO 20: Jitter con Alpha --------------------------------------------
# Obiettivo: geom_jitter di class vs hwy, alpha = 0.5, width = 0.2

# Il tuo codice qui:




# ESERCIZIO 21: Boxplot + Punti con Alpha -----------------------------------
# Obiettivo: Sovrapporre boxplot e punti per class vs hwy
#            Usa geom_boxplot con alpha = 0.5, poi geom_point sopra
#            In questo modo i punti sono visibili attraverso i boxplot

# Il tuo codice qui:




# =============================================================================
# PARTE 5: MAPPING VS SETTING
# =============================================================================

# ESERCIZIO 22: Errore Comune - Setting in aes() ---------------------------
# Obiettivo: IDENTIFICA L'ERRORE e correggilo
# Questo codice è sbagliato:
# ggplot(mpg, aes(x = displ, y = hwy, color = "blue")) + geom_point()

# Codice corretto:
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(color = )  # <-- Sposta il colore fuori da aes()




# ESERCIZIO 23: Mapping Corretto --------------------------------------------
# Obiettivo: Scatter plot displ vs hwy, mapping color a class,
#            setting size = 3 e alpha = 0.7

# Il tuo codice qui:




# ESERCIZIO 23: Setting Multipli --------------------------------------------
# Obiettivo: Scatter plot wt vs mpg (mtcars), 
#            setting: color = "red", size = 4, shape = 17, alpha = 0.6
# Dataset: mtcars

# Il tuo codice qui:




# ESERCIZIO 24: Mix Mapping e Setting ---------------------------------------
# Obiettivo: Scatter plot displ vs hwy,
#            mapping: color = class, size = cyl
#            setting: alpha = 0.6

# Il tuo codice qui:




# ESERCIZIO 25: Position = "dodge" con Fill ---------------------------------
# Obiettivo: Bar chart di class, fill per drv, position = "dodge"

# Il tuo codice qui:




# =============================================================================
# PARTE 6: COMBINAZIONI AVANZATE
# =============================================================================

# ESERCIZIO 26: Quattro Variabili -------------------------------------------
# Obiettivo: Scatter plot displ vs hwy, 
#            color = class, size = cyl, alpha = 0.6

# Il tuo codice qui:




# ESERCIZIO 27: Ridondanza Accessibile --------------------------------------
# Obiettivo: Scatter plot displ vs hwy,
#            color E shape entrambi per drv (stessa variabile),
#            size = 3, per migliorare accessibilità

# Il tuo codice qui:




# ESERCIZIO 28: Bubble Chart ------------------------------------------------
# Obiettivo: Scatter plot diamonds (sample di 1000 righe):
#            x = carat, y = price, size = depth, color = cut, alpha = 0.5

# Sample dei dati
diamonds_sample <- diamonds %>% sample_n(1000)

# Il tuo codice qui:




# ESERCIZIO 29: Gradient Divergente -----------------------------------------
# Obiettivo: Prepara dati con variabile centrata, poi visualizza con gradient divergente

# Prepara dati
mpg_centered <- mpg %>%
  mutate(hwy_diff = hwy - mean(hwy))

# Scatter plot: displ vs hwy_diff, color = hwy_diff,
# usa scale_color_gradient2 con low = "blue", mid = "white", high = "red", midpoint = 0




# ESERCIZIO 30: Multivariato Completo ---------------------------------------
# Obiettivo: Visualizzazione completa mtcars:
#            x = wt, y = mpg, color = factor(cyl), size = hp, shape = factor(am)
# Dataset: mtcars

# Il tuo codice qui:




# =============================================================================
# FINE ESERCIZI
# =============================================================================
# 
# Congratulazioni! Hai completato tutti gli esercizi.
# 
# Prossimi passi:
# - Rivedi gli esercizi dove hai avuto difficoltà
# - Sperimenta con altre palette di colori (RColorBrewer, ggsci)
# - Prova a combinare estetiche in modi creativi
# - Esplora la documentazione: ?aes, ?scale_color_manual, etc.
# 
# Le soluzioni saranno fornite a fine corso!
# =============================================================================
