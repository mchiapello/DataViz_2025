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
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point()  # <-- scatter plot base




# ESERCIZIO 2: Ridurre Overplotting ------------------------------------------
# Obiettivo: Usa la trasparenza (alpha = 0.4) per migliorare la visualizzazione

# Il tuo codice qui:
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(alpha = 0.4)  # <-- aggiungi anche size = 2.5 se vuoi




# ESERCIZIO 3: Aggiungere Trend Line -----------------------------------------
# Obiettivo: Aggiungi una linea di trend lineare usando geom_smooth(method = "lm")

# Il tuo codice qui:
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(alpha = 0.4) +
  geom_smooth(method = "lm")  # <-- aggiungi se = TRUE per intervallo confidenza




# ESERCIZIO 4: LOESS vs Linear -----------------------------------------------
# Obiettivo: Confronta trend lineare (rosso) con LOESS (blu)

# Il tuo codice qui:
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(alpha = 0.3, size = 1.5) +
  geom_smooth(method = "lm", se = FALSE, color = "red") +  # <-- trend lineare
  geom_smooth(method = "loess", se = TRUE, color = "blue")  # <-- trend LOESS




# ESERCIZIO 5: Time Series con Line ------------------------------------------
# Obiettivo: Visualizza disoccupazione (unemploy) nel tempo (date) con geom_line()
# Dataset: economics

# Il tuo codice qui:
ggplot(economics, aes(x = date, y = unemploy)) +
  geom_line()  # <-- aggiungi color e linewidth se vuoi personalizzare




# ESERCIZIO 6: Path vs Line --------------------------------------------------
# Obiettivo: Usa geom_path() per tracciare unemploy vs psavert + aggiungi punti

# Il tuo codice qui:
ggplot(economics, aes(x = unemploy, y = psavert)) +
  geom_path(color = "darkgreen", linewidth = 0.8, alpha = 0.7) +
  geom_point(alpha = 0.3, size = 1)  # <-- path connette in ordine dati, line ordina per x




# =============================================================================
# PARTE 2: DISTRIBUZIONI - 1 VARIABILE
# =============================================================================

# ESERCIZIO 7: Histogram Base ------------------------------------------------
# Obiettivo: Crea istogramma di carat (peso diamanti) con bins = 30
# Dataset: diamonds

# Il tuo codice qui:
ggplot(diamonds, aes(x = carat)) +
  geom_histogram(bins = 30)  # <-- aggiungi fill e color per personalizzare




# ESERCIZIO 8: Sperimentare con Bins -----------------------------------------
# Obiettivo: Prova bins = 10, bins = 100, e bins = 40. Quale è migliore?

# bins = 10 (troppo grossolano)


# bins = 100 (troppo dettagliato)


# bins = 40 (equilibrato)




# ESERCIZIO 9: Density Plot --------------------------------------------------
# Obiettivo: Crea curva di densità per hwy (consumo autostrada)

# Il tuo codice qui:
ggplot(mpg, aes(x = hwy)) +
  geom_density()  # <-- Completa con la geometria corretta




# ESERCIZIO 10: Histogram + Density Sovrapposti ------------------------------
# Obiettivo: Combina histogram e density. Usa aes(y = after_stat(density))!

# Il tuo codice qui:
ggplot(mpg, aes(x = hwy)) +
  geom_histogram(aes(y = after_stat(density)), bins = 30, 
                 fill = "lightblue", color = "black", alpha = 0.6) +
  geom_density(color = "red", linewidth = 1.2)  # <-- after_stat converte a densità




# ESERCIZIO 11: Frequency Polygon --------------------------------------------
# Obiettivo: Usa geom_freqpoly() per visualizzare distribuzione di price (bins = 50)

# Il tuo codice qui:
ggplot(diamonds, aes(x = price)) +
  geom_freqpoly(bins = 50)  # <-- linea invece di barre




# ESERCIZIO 12: Dotplot per Dataset Piccolo ----------------------------------
# Obiettivo: Usa geom_dotplot() per waiting in faithful (binwidth = 1)
# Dataset: faithful

# Il tuo codice qui:
ggplot(faithful, aes(x = waiting)) +
  geom_dotplot(binwidth = 1)  # <-- ogni punto è un'osservazione




# =============================================================================
# PARTE 3: DISTRIBUZIONI - 2 VARIABILI
# =============================================================================

# ESERCIZIO 13: Bin2D per Big Data -------------------------------------------
# Obiettivo: Usa geom_bin2d() per carat vs price (bins = 50)
# Dataset: diamonds

# Il tuo codice qui:
ggplot(diamonds, aes(x = , y = )) +  # <-- Inserisci le variabili
  geom_bin2d(bins = )  # <-- Inserisci il numero di bins




# ESERCIZIO 14: Hexbin Alternative -------------------------------------------
# Obiettivo: Ricrea con geom_hex() e scale_fill_viridis_c()
# Nota: Richiede install.packages("hexbin") se non installato

# Il tuo codice qui:
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_hex(bins = 50) +
  scale_fill_viridis_c(option = "plasma")  # <-- esagoni + palette accessibile




# ESERCIZIO 15: Density 2D Contours ------------------------------------------
# Obiettivo: Aggiungi contorni densità 2D a faithful (eruptions vs waiting)
# Dataset: faithful

# Il tuo codice qui:
ggplot(faithful, aes(x = eruptions, y = waiting)) +
  geom_point(alpha = 0.4, size = 2) +
  geom_density2d(color = "red", linewidth = 0.8)  # <-- contorni densità




# ESERCIZIO 16: Filled Density 2D --------------------------------------------
# Obiettivo: Usa geom_density2d_filled() per mappa di calore

# Il tuo codice qui:
ggplot(faithful, aes(x = eruptions, y = waiting)) +
  geom_density2d_filled(alpha = 0.8)  # <-- versione riempita




# =============================================================================
# PARTE 4: STATISTICHE RIASSUNTIVE
# =============================================================================

# ESERCIZIO 17: Boxplot per Gruppi -------------------------------------------
# Obiettivo: Confronta hwy tra classi di auto con geom_boxplot()
# Dataset: mpg

# Il tuo codice qui:
ggplot(mpg, aes(x = class, y = hwy)) +
  geom_boxplot()  # <-- aggiungi fill, outlier.color se vuoi personalizzare




# ESERCIZIO 18: Violin Plot --------------------------------------------------
# Obiettivo: Ricrea il grafico precedente con geom_violin()

# Il tuo codice qui:
ggplot(mpg, aes(x = class, y = hwy)) +
  geom_violin()  # <-- mostra forma completa della distribuzione




# ESERCIZIO 19: Violin + Boxplot Combinati -----------------------------------
# Obiettivo: Sovrapponi boxplot (width = 0.15) dentro violin plot

# Il tuo codice qui:
ggplot(mpg, aes(x = class, y = hwy)) +
  geom_violin(fill = "skyblue", alpha = 0.5) +
  geom_boxplot(width = 0.15, fill = "white")  # <-- combina violin e boxplot




# ESERCIZIO 20: Bar Chart - Conteggi -----------------------------------------
# Obiettivo: Conta auto per classe con geom_bar() (solo x, no y!)

# Il tuo codice qui:
ggplot(mpg, aes(x = class)) +
  geom_bar()  # <-- geom_bar conta automaticamente (stat = "count")




# ESERCIZIO 21: Preparare Dati Aggregati per geom_col() ---------------------
# Obiettivo: Calcola consumo medio per classe e visualizza con geom_col()

# Aggrega dati
mpg_summary <- mpg %>%
  group_by(class) %>%
  summarise(
    mean_hwy = mean(hwy),
    sd_hwy = sd(hwy),
    n = n()
  )

# Visualizza con geom_col
ggplot(mpg_summary, aes(x = class, y = mean_hwy)) +
  geom_col()  # <-- geom_col usa valori y esistenti, non conta




# =============================================================================
# PARTE 5: INCERTEZZA E INTERVALLI
# =============================================================================

# ESERCIZIO 22: Barre + Error Bars -------------------------------------------
# Obiettivo: Aggiungi barre di errore (± SD) usando geom_errorbar()

# Il tuo codice qui (usa mpg_summary dall'esercizio 21):
ggplot(mpg_summary, aes(x = class, y = mean_hwy)) +
  geom_col(fill = "darkgreen", alpha = 0.7) +
  geom_errorbar(aes(ymin = mean_hwy - sd_hwy, ymax = mean_hwy + sd_hwy),
                width = 0.3)  # <-- barre di errore mostrano variabilità




# ESERCIZIO 23: Pointrange ---------------------------------------------------
# Obiettivo: Usa geom_pointrange() invece di col + errorbar

# Il tuo codice qui:
ggplot(mpg_summary, aes(x = class, y = mean_hwy)) +
  geom_pointrange(aes(ymin = mean_hwy - sd_hwy, ymax = mean_hwy + sd_hwy),
                  size = 0.8)  # <-- combina punto e intervallo in un geom




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
ggplot(economics_ribbon, aes(x = date, y = unemploy)) +
  geom_ribbon(aes(ymin = lower, ymax = upper), fill = "lightblue", alpha = 0.4) +
  geom_line(color = "darkblue", linewidth = 1)  # <-- ribbon per incertezza su time series




# =============================================================================
# PARTE 6: COMBINAZIONI AVANZATE
# =============================================================================

# ESERCIZIO 25: Multi-layer Scatter ------------------------------------------
# Obiettivo: Combina geom_rug() + geom_point() + geom_smooth()

# Il tuo codice qui:
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_rug(alpha = 0.3) +
  geom_point(alpha = 0.3, size = 2) +
  geom_smooth(method = "lm", se = TRUE)  # <-- rug mostra distribuzione marginale




# ESERCIZIO 26: Histogram Sovrapposti (Freq Poly) ----------------------------
# Obiettivo: Confronta hwy per 4WD vs non-4WD con geom_freqpoly()

# Prepara dati
mpg_drv <- mpg %>%
  mutate(is_4wd = ifelse(drv == "4", "4WD", "Non-4WD"))

# Crea grafico con color = is_4wd
ggplot(mpg_drv, aes(x = hwy, color = is_4wd)) +
  geom_freqpoly(bins = 30, linewidth = 1.2)  # <-- freqpoly per confronti tra gruppi




# ESERCIZIO 27: Boxplot Orizzontale ------------------------------------------
# Obiettivo: Boxplot class vs hwy + coord_flip()

# Il tuo codice qui:
ggplot(mpg, aes(x = class, y = hwy)) +
  geom_boxplot() +
  coord_flip()  # <-- coord_flip rende orizzontale per leggibilità




# ESERCIZIO 28: Density 2D + Points ------------------------------------------
# Obiettivo: Combina geom_density2d_filled() con geom_point() su faithful
# Dataset: faithful

# Il tuo codice qui:
ggplot(faithful, aes(x = eruptions, y = waiting)) +
  geom_density2d_filled(alpha = 0.6) +
  geom_point(size = 1, alpha = 0.4)  # <-- mappa densità + dati raw




# ESERCIZIO 29: Smooth con Intervallo Personalizzato -------------------------
# Obiettivo: Smooth con CI 99% invece del 95% (level = 0.99)

# Il tuo codice qui:
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(alpha = 0.3) +
  geom_smooth(method = "loess", level = 0.99)  # <-- level controlla ampiezza CI




# ESERCIZIO 30: Boxplot con Notch --------------------------------------------
# Obiettivo: Usa notch = TRUE per mostrare CI della mediana

# Il tuo codice qui:
ggplot(mpg, aes(x = class, y = hwy)) +
  geom_boxplot(notch = TRUE)  # <-- notch mostra CI della mediana (95%)




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
