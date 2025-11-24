# =============================================================================
# ESERCIZI: Facets e Sistemi di Coordinate in ggplot2
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
# PARTE 1: FACET WRAP BASICS
# =============================================================================

# ESERCIZIO 1: Facet Wrap Base -----------------------------------------------
# Obiettivo: Creare scatter plot displ vs hwy, facet per class
# Dataset: mpg

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  ___(~ ___)


# ESERCIZIO 2: Controllo Colonne ----------------------------------------------
# Obiettivo: Stesso plot, ma con 3 colonne (ncol = 3)

# Il tuo codice qui:

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_wrap(~ class, ncol = ___)


# ESERCIZIO 3: Histogram con Facet -------------------------------------------
# Obiettivo: Histogram di hwy, facet per drv (tipo trazione)
#            bins = 15

# Il tuo codice qui:

ggplot(mpg, aes(x = hwy)) +
  ___(bins = ___, fill = "steelblue", color = "black") +
  facet_wrap(~ ___)


# ESERCIZIO 4: Facet con Aesthetic -------------------------------------------
# Obiettivo: Scatter displ vs hwy, color = drv, facet per class
#            Così combini color E facets

# Il tuo codice qui:

ggplot(mpg, aes(x = displ, y = hwy, color = ___)) +
  geom_point() +
  facet_wrap(~ ___)

# Nota: color aggiunge dimensione extra - utile quando facets non bastano


# ESERCIZIO 5: Time Series Facets --------------------------------------------
# Obiettivo: Usa economics, line plot date vs unemploy
#            Facet non applicabile direttamente - crea variabile decade prima
#            Aggiungi decade = floor(year(date)/10)*10
#            Poi facet per decade
# Dataset: economics

# Prepara dati
economics_decade <- economics %>%
  mutate(decade = floor(lubridate::year(date)/10)*10)

# Il tuo codice qui:





# =============================================================================
# PARTE 2: FACET GRID
# =============================================================================

# ESERCIZIO 6: Facet Grid 2D -------------------------------------------------
# Obiettivo: Scatter displ vs hwy
#            Facet grid con drv (righe) e cyl (colonne)

# Il tuo codice qui:

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  ___(___~ ___)

# Interpretazione: Confronti drv verticalmente, cyl orizzontalmente


# ESERCIZIO 7: Grid Solo Righe -----------------------------------------------
# Obiettivo: Boxplot di class vs hwy
#            Facet grid solo righe per year

# Il tuo codice qui:

ggplot(mpg, aes(x = class, y = hwy)) +
  geom_boxplot() +
  facet_grid(rows = vars(___))

# Alternativa con formula:
ggplot(mpg, aes(x = class, y = hwy)) +
  geom_boxplot() +
  facet_grid(___ ~ .)


# ESERCIZIO 8: Grid Solo Colonne ----------------------------------------------
# Obiettivo: Density plot di cty
#            Facet grid solo colonne per drv

# Il tuo codice qui:

ggplot(mpg, aes(x = cty)) +
  ___(fill = "lightblue", alpha = 0.7) +
  facet_grid(cols = vars(___))

# Alternativa con formula:
ggplot(mpg, aes(x = cty)) +
  geom_density(fill = "lightblue", alpha = 0.7) +
  facet_grid(. ~ ___)


# ESERCIZIO 9: Grid con Formula ----------------------------------------------
# Obiettivo: Scatter carat vs price (diamonds, sample 1000 rows)
#            Facet grid: cut ~ color (formula notation)
# Dataset: diamonds_sample

# Prepara dati
diamonds_sample <- diamonds %>% sample_n(1000)

# Il tuo codice qui:





# ESERCIZIO 10: Grid con vars() ----------------------------------------------
# Obiettivo: Stesso plot, usa vars() notation invece di formula
#            rows = vars(cut), cols = vars(color)

# Il tuo codice qui:

ggplot(diamonds_sample, aes(x = carat, y = price)) +
  geom_point(alpha = 0.5) +
  facet_grid(rows = vars(___), cols = vars(___))

# vars() notation è più moderna e flessibile


# =============================================================================
# PARTE 3: SCALE CONTROL
# =============================================================================

# ESERCIZIO 11: Scale Fisse (Default) ----------------------------------------
# Obiettivo: Scatter displ vs hwy, facet per class
#            Nota come alcuni pannelli hanno molto spazio vuoto

# Il tuo codice qui:

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_wrap(~ class, scales = "___")

# "fixed" è default - facilita confronti diretti


# ESERCIZIO 12: Scale Libere X e Y -------------------------------------------
# Obiettivo: Stesso plot, scales = "free"
#            Osserva differenza - ogni pannello ottimizza range

# Il tuo codice qui:

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_wrap(~ class, scales = "___")

# Ogni pannello ottimizzato - pattern più chiari MA confronti più difficili


# ESERCIZIO 13: Solo X Libero ------------------------------------------------
# Obiettivo: Stesso plot, scales = "free_x"
#            Y condiviso, X libero per ogni pannello

# Il tuo codice qui:

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_wrap(~ class, scales = "___")

# Y condiviso → confronti verticali facili, X ottimizzato per ogni classe


# ESERCIZIO 14: Solo Y Libero ------------------------------------------------
# Obiettivo: Boxplot di manufacturer vs hwy
#            Facet per year, scales = "free_y"

# Il tuo codice qui:

ggplot(mpg, aes(x = manufacturer, y = hwy)) +
  ___() +
  facet_wrap(~ year, scales = "___") 


# ESERCIZIO 15: Quando NON Usare Free Scales ---------------------------------
# Obiettivo: Bar plot count di class, facet per year
#            Prova scales = "fixed" e scales = "free_y"
#            Quale permette miglior confronto tra anni?

# Scales fixed:

# Scales fixed (MIGLIORE per confronti):
ggplot(mpg, aes(x = class)) +
  geom_bar(fill = "steelblue") +
  facet_wrap(~ year, scales = "___")

# Scales free_y (INGANNA - sembra simile conteggio):
ggplot(mpg, aes(x = class)) +
  geom_bar(fill = "coral") +
  facet_wrap(~ year, scales = "___")

# Conclusione: per confrontare magnitudini, usa scales fisse!


# =============================================================================
# PARTE 4: COORDINATE SYSTEMS
# =============================================================================

# ESERCIZIO 16: coord_flip() -------------------------------------------------
# Obiettivo: Boxplot di class vs hwy
#            Usa coord_flip() per labels leggibili

# Il tuo codice qui:

ggplot(mpg, aes(x = class, y = hwy)) +
  geom_boxplot() +
  ___()

# Alternativa moderna (scambia aesthetic):
ggplot(mpg, aes(x = ___, y = ___)) +
  geom_boxplot()


# ESERCIZIO 17: coord_cartesian() Zoom ---------------------------------------
# Obiettivo: Scatter carat vs price (diamonds sample)
#            Zoom: xlim = c(0, 2), ylim = c(0, 10000)
#            Usa coord_cartesian() (non rimuove dati)

# Il tuo codice qui:

set.seed(123)
diamonds_sample <- diamonds %>% sample_n(1000)

ggplot(diamonds_sample, aes(x = carat, y = price)) +
  geom_point(alpha = 0.5) +
  geom_smooth() +
  ___(xlim = c(___, ___), ylim = c(0, 10000))

# smooth calcolato su TUTTI i dati, poi zoom applicato


# ESERCIZIO 18: coord_fixed() -----------------------------------------------
# Obiettivo: Scatter drat vs wt (mtcars)
#            Applica coord_fixed(ratio = 1) per aspect 1:1
# Dataset: mtcars

# Il tuo codice qui:

ggplot(mtcars, aes(x = drat, y = wt)) +
  geom_point(size = 3) +
  ___(ratio = ___)

# 1 unità asse X = 1 unità asse Y (visivamente)


# ESERCIZIO 19: coord_polar() Pie Chart --------------------------------------
# Obiettivo: Crea pie chart di class counts in mpg
#            1. geom_bar(aes(x = "", fill = class))
#            2. coord_polar(theta = "y")

# Il tuo codice qui:

ggplot(mpg, aes(x = "", fill = class)) +
  geom_bar(width = 1) +
  ___(theta = "___") 

# Nota: theta = "y" mappa Y (height) ad angolo


# ESERCIZIO 20: coord_polar() Bullseye ---------------------------------------
# Obiettivo: Bar plot di class counts
#            coord_polar(theta = "x") per radar chart

# Il tuo codice qui:

ggplot(mpg, aes(x = class, fill = class)) +
  geom_bar() +
  coord_polar(theta = "___") 

# theta = "x" mappa X (categories) ad angolo


# =============================================================================
# PARTE 5: COORD TRANSFORMATIONS
# =============================================================================

# ESERCIZIO 21: scale_*_log10() ----------------------------------------------
# Obiettivo: Scatter carat vs price (diamonds sample)
#            Log10 transform su entrambi assi con scale functions

# Il tuo codice qui:

ggplot(diamonds_sample, aes(x = carat, y = price)) +
  geom_point(alpha = 0.5) +
  ___() +
  ___()


# ESERCIZIO 22: coord_trans() -----------------------------------------------
# Obiettivo: Stesso plot, usa coord_trans(x = "log10", y = "log10")
#            Osserva: risultato simile ma non identico

# Il tuo codice qui:

ggplot(diamonds_sample, aes(x = carat, y = price)) +
  geom_point(alpha = 0.5) +
  ___(x = "___", y = "___")

# Visivamente simile ma matematicamente diverso per geoms complessi


# ESERCIZIO 23: scale_*_sqrt() ----------------------------------------------
# Obiettivo: Scatter carat vs price
#            sqrt transform solo su Y

# Il tuo codice qui:

ggplot(diamonds_sample, aes(x = carat, y = price)) +
  geom_point(alpha = 0.5) +
  ___()


# ESERCIZIO 24: coord_trans() con smooth ------------------------------------
# Obiettivo: Scatter displ vs hwy + geom_smooth()
#            Prova scale_x_log10() vs coord_trans(x = "log10")
#            Nota differenza in smooth line

# Con scale_x_log10:

# Con scale_x_log10 (PREFERITO - smooth su dati trasformati):
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(method = "lm") +
  ___()

# Con coord_trans (smooth su dati originali, poi trasformato):
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(method = "lm") +
  coord_trans(x = "___")

# Nota: linee smooth DIVERSE! scale_* trasforma prima


# ESERCIZIO 25: Limiti con coord_cartesian vs xlim -------------------------
# Obiettivo: Scatter displ vs hwy + geom_smooth()
#            Confronta xlim(3, 6) vs coord_cartesian(xlim = c(3, 6))
#            Nota impatto su smooth

# Con xlim (rimuove dati):

# Con xlim (RIMUOVE dati fuori range - smooth cambia):
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(color = "red") +
  xlim(___, ___)

# Con coord_cartesian (solo zoom - smooth su tutti i dati):
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(color = "blue") +
  ___(xlim = c(3, 6))

# Conclusione: usa coord_cartesian() per zoom!


# =============================================================================
# PARTE 6: COMBINAZIONI AVANZATE
# =============================================================================

# ESERCIZIO 26: Facets + coord_flip -----------------------------------------
# Obiettivo: Boxplot class vs hwy, facet per year
#            Applica coord_flip() per leggibilità

# Il tuo codice qui:

ggplot(mpg, aes(x = class, y = hwy)) +
  geom_boxplot() +
  facet_wrap(~ ___) +
  ___()


# ESERCIZIO 27: Facets + Zoom -----------------------------------------------
# Obiettivo: Scatter displ vs hwy, facet per drv
#            Zoom su xlim = c(2, 5), ylim = c(15, 35)

# Il tuo codice qui:

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_wrap(~ ___) +
  ___(xlim = c(2, 5), ylim = c(15, 35))


# ESERCIZIO 28: Facets + Free Scales + Log ----------------------------------
# Obiettivo: Scatter carat vs price (diamonds sample)
#            Facet per cut, scales = "free"
#            scale_x_log10() + scale_y_log10()

# Il tuo codice qui:

ggplot(diamonds_sample, aes(x = carat, y = price)) +
  geom_point(alpha = 0.3) +
  facet_wrap(~ ___, scales = "___") +
  scale_x_log10() +
  ___()

# Pattern simili, magnitudini diverse


# ESERCIZIO 29: Grid + Multiple Aesthetics ----------------------------------
# Obiettivo: Scatter displ vs hwy
#            Color = class, size = cyl
#            Facet grid: drv ~ year
#            Nota: molte dimensioni! Leggibile?

# Il tuo codice qui:

ggplot(mpg, aes(x = displ, y = hwy, color = ___, size = ___)) +
  geom_point(alpha = 0.6) +
  facet_grid(___ ~ ___)

# Troppo complesso! Meglio semplificare


# ESERCIZIO 30: Best Practice Showcase --------------------------------------
# Obiettivo: Crea visualizzazione efficace mpg data:
#            - Histogram hwy
#            - Facet per drv (tipo trazione)
#            - Aggiungi vline per median di ogni gruppo
#            - Labels chiari
#

# Calcola mediane
hwy_medians <- mpg %>%
  group_by(drv) %>%
  summarise(median_hwy = median(hwy))

# Il tuo codice qui (base + facet + vline):





# =============================================================================
# FINE ESERCIZI
# =============================================================================
# 
# Congratulazioni! Hai completato tutti gli esercizi.
# 
# Prossimi passi:
# - Sperimenta con combinazioni di facets e coordinate systems
# - Prova altri dataset (iris, economics, faithful)
# - Esplora documentazione: ?facet_wrap, ?facet_grid, ?coord_*
# - Considera quando usare facets vs aesthetics (color, shape)
# 
# Le soluzioni saranno fornite a fine corso!
# =============================================================================
