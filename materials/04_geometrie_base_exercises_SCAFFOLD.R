# =============================================================================
# SOLUZIONI: Geometrie Base in ggplot2
# REVELO Training - Data Viz 2025
# =============================================================================
# 
# Questo file contiene le soluzioni complete di tutti gli esercizi.
# Usa questo per:
# - Verificare le tue soluzioni
# - Capire approcci alternativi
# - Studiare pattern di codice ggplot2
#
# NON condividere con gli studenti durante il corso!
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

ggplot(mpg, aes(x = ___, y = ___)) +
  geom_point()

# Interpretazione: Relazione negativa - più cilindrata, meno consumo


# ESERCIZIO 2: Ridurre Overplotting ------------------------------------------
# Obiettivo: Usa la trasparenza (alpha = 0.4) per migliorare la visualizzazione

ggplot(mpg, aes(x = displ, y = ___)) +
  ___(alpha = 0.4, size = 2.5)


# ESERCIZIO 3: Aggiungere Trend Line -----------------------------------------
# Obiettivo: Aggiungi una linea di trend lineare usando geom_smooth(method = "lm")

ggplot(mpg, aes(x = displ, y = hwy)) +
  ___(alpha = 0.4) +
  ___(method = "___", se = TRUE, color = "red")


# ESERCIZIO 4: LOESS vs Linear -----------------------------------------------
# Obiettivo: Confronta trend lineare (rosso) con LOESS (blu)

ggplot(mpg, aes(x = ___, y = ___)) +
  geom_point(alpha = 0.3, size = 1.5) +
  ___(method = "lm", se = FALSE, color = "red", linetype = "dashed") +
  ___(method = "loess", se = TRUE, color = "blue")


# ESERCIZIO 5: Time Series con Line ------------------------------------------
# Obiettivo: Visualizza disoccupazione (unemploy) nel tempo (date) con geom_line()

ggplot(___, aes(x = date, y = ___)) +
  ___(color = "steelblue", linewidth = 1)


# ESERCIZIO 6: Path vs Line --------------------------------------------------
# Obiettivo: Usa geom_path() per tracciare unemploy vs psavert + aggiungi punti

ggplot(economics, aes(x = unemploy, y = ___)) +
  ___(color = "darkgreen", linewidth = 0.8, alpha = 0.7) +
  geom_point(alpha = 0.3, size = 1)

# Differenza: geom_path() connette nell'ordine dei dati (temporale)
#             geom_line() ordinerebbe per x


# =============================================================================
# PARTE 2: DISTRIBUZIONI - 1 VARIABILE
# =============================================================================

# ESERCIZIO 7: Histogram Base ------------------------------------------------
# Obiettivo: Crea istogramma di carat (peso diamanti) con bins = 30

ggplot(___, aes(x = carat)) +
  ___(bins = 30, fill = "skyblue", color = "black")

# Interpretazione: Distribuzione skewed a destra con picchi a valori rotondi


# ESERCIZIO 8: Sperimentare con Bins -----------------------------------------
# Obiettivo: Prova bins = 10, bins = 100, e bins = 40. Quale è migliore?

# bins = 10 (troppo grossolano)
ggplot(diamonds, aes(x = ___)) +
  geom_histogram(bins = ___, fill = "coral", color = "black")

# bins = 100 (troppo dettagliato)
ggplot(diamonds, aes(x = carat)) +
  ___(bins = ___, fill = "lightgreen", color = "black")

# bins = 40 (equilibrato)
ggplot(diamonds, aes(x = ___)) +
  ___(bins = 40, fill = "skyblue", color = "black")

# Conclusione: bins = 30-50 bilancia bene dettaglio e leggibilità


# ESERCIZIO 9: Density Plot --------------------------------------------------
# Obiettivo: Crea curva di densità per hwy (consumo autostrada)

ggplot(___, aes(x = hwy)) +
  ___(fill = "purple", alpha = 0.4, color = "purple4", linewidth = 1)


# ESERCIZIO 10: Histogram + Density Sovrapposti ------------------------------
# Obiettivo: Combina histogram e density. Usa aes(y = after_stat(density))!

ggplot(mpg, aes(x = ___)) +
  geom_histogram(aes(y = after_stat(___)), 
                 bins = 30, fill = "lightblue", color = "black", ___ = 0.6) +
  ___(color = "red", linewidth = 1.2)

# after_stat(density) converte frequenze in densità per allineamento


# ESERCIZIO 11: Frequency Polygon --------------------------------------------
# Obiettivo: Usa geom_freqpoly() per visualizzare distribuzione di price (bins = 50)

ggplot(diamonds, aes(x = ___)) +
  ___(bins = 50, ___ = "darkblue", linewidth = 1)


# ESERCIZIO 12: Dotplot per Dataset Piccolo ----------------------------------
# Obiettivo: Usa geom_dotplot() per waiting in faithful (binwidth = 1)

ggplot(___, aes(x = ___)) +
  geom_dotplot(___ = 1, ___ = "orange", color = "black") +
  theme(axis.text.y = element_blank(),
        axis.ticks.y = element_blank())

# Rivela chiaramente la bimodalità


# =============================================================================
# PARTE 3: DISTRIBUZIONI - 2 VARIABILI
# =============================================================================

# ESERCIZIO 13: Bin2D per Big Data -------------------------------------------
# Obiettivo: Usa geom_bin2d() per carat vs price (bins = 50)

ggplot(diamonds, aes(x = ___, y = ___)) +
  ___(bins = 50) +
  scale_fill_gradient(low = "lightblue", high = "darkred")


# ESERCIZIO 14: Hexbin Alternative -------------------------------------------
# Obiettivo: Ricrea con geom_hex() e scale_fill_viridis_c()
# Nota: Richiede install.packages("hexbin") se non installato

# Installa hexbin se necessario
if (!require("hexbin", quietly = TRUE)) {
  install.packages("hexbin")
  library(hexbin)
}

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_hex(bins = 50) +
  scale_fill_viridis_c(option = "plasma")


# ESERCIZIO 15: Density 2D Contours ------------------------------------------
# Obiettivo: Aggiungi contorni densità 2D a faithful (eruptions vs waiting)

ggplot(___, aes(x = ___, y = waiting)) +
  ___(alpha = 0.4, size = 2) +
  geom_density2d(___ = "red", linewidth = 0.8)

# Due cluster distinti (eruzioni brevi e lunghe)


# ESERCIZIO 16: Filled Density 2D --------------------------------------------
# Obiettivo: Usa geom_density2d_filled() per mappa di calore

___(faithful, aes(x = eruptions, y = waiting)) +
  ___(alpha = 0.8) +
  theme_minimal()


# =============================================================================
# PARTE 4: STATISTICHE RIASSUNTIVE
# =============================================================================

# ESERCIZIO 17: Boxplot per Gruppi -------------------------------------------
# Obiettivo: Confronta hwy tra classi di auto con geom_boxplot()

ggplot(mpg, aes(x = ___, y = ___)) +
  geom_boxplot(___ = "lightgreen", outlier.color = "red", outlier.size = 2) +
  ___(axis.text.x = element_text(angle = 45, hjust = 1))

# Pickup e SUV: consumo inferiore; compact e subcompact: migliori


# ESERCIZIO 18: Violin Plot --------------------------------------------------
# Obiettivo: Ricrea il grafico precedente con geom_violin()

___(mpg, aes(x = class, y = hwy)) +
  ___(fill = "coral", ___ = 0.6) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Violin mostra forma completa della distribuzione (alcuni bimodali)


# ESERCIZIO 19: Violin + Boxplot Combinati -----------------------------------
# Obiettivo: Sovrapponi boxplot (width = 0.15) dentro violin plot

ggplot(mpg, aes(x = ___, y = ___)) +
  ___(fill = "skyblue", alpha = 0.5) +
  ___(width = 0.15, fill = "white", outlier.color = "red") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


# ESERCIZIO 20: Bar Chart - Conteggi -----------------------------------------
# Obiettivo: Conta auto per classe con geom_bar() (solo x, no y!)

ggplot(mpg, aes(x = ___)) +
  ___(___ = "steelblue", ___ = "black") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# geom_bar() conta automaticamente (stat = "count")


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
ggplot(___, aes(x = class, y = mean_hwy)) +
  ___(___ = "darkgreen", ___ = 0.7) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Differenza: geom_col() usa valori y esistenti, non conta


# =============================================================================
# PARTE 5: INCERTEZZA E INTERVALLI
# =============================================================================

# ESERCIZIO 22: Barre + Error Bars -------------------------------------------
# Obiettivo: Aggiungi barre di errore (± SD) usando geom_errorbar()

ggplot(___, aes(x = class, y = mean_hwy)) +
  ___(fill = "darkgreen", alpha = 0.7) +
  ___(
    aes(ymin = mean_hwy - sd_hwy, ymax = mean_hwy + sd_hwy),
    width = 0.3,
    linewidth = 0.8
  ) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Le barre mostrano la variabilità dentro ogni gruppo


# ESERCIZIO 23: Pointrange ---------------------------------------------------
# Obiettivo: Usa geom_pointrange() invece di col + errorbar

ggplot(mpg_summary, aes(x = ___, y = ___)) +
  ___(
    aes(ymin = mean_hwy - sd_hwy, ymax = mean_hwy + sd_hwy),
    color = "darkblue",
    size = 0.8,
    fatten = 3
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Più compatto e chiaro per confronti


# ESERCIZIO 24: Ribbon per Time Series ---------------------------------------
# Obiettivo: Crea banda di confidenza intorno a serie temporale

# Prepara dati con bande
economics_ribbon <- economics %>%
  mutate(
    lower = unemploy - 500,
    upper = unemploy + 500
  )

# Crea grafico con geom_ribbon() + geom_line()
ggplot(___, aes(x = ___, y = unemploy)) +
  ___(aes(ymin = lower, ymax = upper), 
              fill = "lightblue", alpha = 0.4) +
  geom_line(color = "darkblue", linewidth = 1)

# Uso reale: intervalli di previsione, errori standard su time series


# =============================================================================
# PARTE 6: COMBINAZIONI AVANZATE
# =============================================================================

# ESERCIZIO 25: Multi-layer Scatter ------------------------------------------
# Obiettivo: Combina geom_rug() + geom_point() + geom_smooth()

ggplot(mpg, aes(x = displ, y = hwy)) +
  ___(alpha = 0.3, color = "gray40") +
  ___(alpha = 0.3, size = 2) +
  ___(method = "lm", se = TRUE, color = "red", fill = "pink") +
  theme_minimal()

# geom_rug() aggiunge tacche sui margini mostrando distribuzione marginale


# ESERCIZIO 26: Histogram Sovrapposti (Freq Poly) ----------------------------
# Obiettivo: Confronta hwy per 4WD vs non-4WD con geom_freqpoly()

# Prepara dati
mpg_drv <- mpg %>%
  mutate(is_4wd = ifelse(drv == "4", "4WD", "Non-4WD"))

# Crea grafico con color = is_4wd
ggplot(___, aes(x = hwy, color = is_4wd)) +
  geom_freqpoly(___ = 30, ___ = 1.2) +
  theme_minimal()

# Freqpoly: sovrapposizioni chiare senza occludere i dati


# ESERCIZIO 27: Boxplot Orizzontale ------------------------------------------
# Obiettivo: Boxplot class vs hwy + coord_flip()

ggplot(mpg, aes(x = class, y = hwy)) +
  ___(___ = "lightcoral") +
  ___()

# coord_flip(): utile per etichette lunghe, migliore leggibilità


# ESERCIZIO 28: Density 2D + Points ------------------------------------------
# Obiettivo: Combina geom_density2d_filled() con geom_point() su faithful

ggplot(faithful, aes(x = eruptions, y = waiting)) +
  ___(alpha = 0.6) +
  geom_point(size = 1, alpha = 0.4, ___ = "white") +
  theme_dark()

# Mappa densità + verifica con dati raw


# ESERCIZIO 29: Smooth con Intervallo Personalizzato -------------------------
# Obiettivo: Smooth con CI 99% invece del 95% (level = 0.99)

ggplot(mpg, aes(x = displ, y = hwy)) +
  ___(alpha = 0.3) +
  ___(method = "loess", level = 0.99, fill = "orange", color = "red")

# Banda più ampia = maggiore incertezza catturata (99% vs default 95%)


# ESERCIZIO 30: Boxplot con Notch --------------------------------------------
# Obiettivo: Usa notch = TRUE per mostrare CI della mediana

ggplot(___, aes(x = ___, y = ___)) +
  geom_boxplot(notch = TRUE, fill = "skyblue", outlier.color = "red") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Se le notch di due box non si sovrappongono, le mediane sono 
# significativamente diverse (CI 95%)



