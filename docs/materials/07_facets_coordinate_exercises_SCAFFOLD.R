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

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  ___(~ ___)


# ESERCIZIO 2: Controllo Colonne ----------------------------------------------
# Obiettivo: Stesso plot, ma con 3 colonne (ncol = 3)

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_wrap(~ class, ncol = ___)


# ESERCIZIO 3: Histogram con Facet -------------------------------------------
# Obiettivo: Histogram di hwy, facet per drv (tipo trazione)
#            bins = 15

ggplot(mpg, aes(x = hwy)) +
  ___(bins = ___, fill = "steelblue", color = "black") +
  facet_wrap(~ ___)


# ESERCIZIO 4: Facet con Aesthetic -------------------------------------------
# Obiettivo: Scatter displ vs hwy, color = drv, facet per class
#            Così combini color E facets

ggplot(mpg, aes(x = displ, y = hwy, color = ___)) +
  geom_point() +
  facet_wrap(~ ___)

# Nota: color aggiunge dimensione extra - utile quando facets non bastano


# ESERCIZIO 5: Time Series Facets --------------------------------------------
# Obiettivo: Usa economics, line plot date vs unemploy
#            Facet per decade

# Prepara dati
economics_decade <- economics %>%
  mutate(decade = floor(lubridate::year(date)/10)*10)

ggplot(economics_decade, aes(x = date, y = unemploy)) +
  ___() +
  facet_wrap(~ ___, scales = "___")

# Nota: scales = "free_x" perché ogni decade ha diverso time range


# =============================================================================
# PARTE 2: FACET GRID
# =============================================================================

# ESERCIZIO 6: Facet Grid 2D -------------------------------------------------
# Obiettivo: Scatter displ vs hwy
#            Facet grid con drv (righe) e cyl (colonne)

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  ___(___~ ___)

# Interpretazione: Confronti drv verticalmente, cyl orizzontalmente


# ESERCIZIO 7: Grid Solo Righe -----------------------------------------------
# Obiettivo: Boxplot di class vs hwy
#            Facet grid solo righe per year

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

# Prepara dati
diamonds_sample <- diamonds %>% sample_n(1000)

ggplot(diamonds_sample, aes(x = carat, y = price)) +
  geom_point(alpha = 0.5) +
  facet_grid(___ ~ ___)


# ESERCIZIO 10: Grid con vars() ----------------------------------------------
# Obiettivo: Stesso plot, usa vars() notation invece di formula

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

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_wrap(~ class, scales = "___")

# "fixed" è default - facilita confronti diretti


# ESERCIZIO 12: Scale Libere X e Y -------------------------------------------
# Obiettivo: Stesso plot, scales = "free"

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_wrap(~ class, scales = "___")

# Ogni pannello ottimizzato - pattern più chiari MA confronti più difficili


# ESERCIZIO 13: Solo X Libero ------------------------------------------------
# Obiettivo: Stesso plot, scales = "free_x"

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_wrap(~ class, scales = "___")

# Y condiviso → confronti verticali facili, X ottimizzato per ogni classe


# ESERCIZIO 14: Solo Y Libero ------------------------------------------------
# Obiettivo: Boxplot di manufacturer vs hwy
#            Facet per year, scales = "free_y"

ggplot(mpg, aes(x = manufacturer, y = hwy)) +
  ___() +
  facet_wrap(~ year, scales = "___") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


# ESERCIZIO 15: Quando NON Usare Free Scales ---------------------------------
# Obiettivo: Bar plot count di class, facet per year
#            Confronta scales

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
# Obiettivo: Boxplot di class vs hwy con coord_flip()

ggplot(mpg, aes(x = class, y = hwy)) +
  geom_boxplot() +
  ___()

# Alternativa moderna (scambia aesthetic):
ggplot(mpg, aes(x = ___, y = ___)) +
  geom_boxplot()


# ESERCIZIO 17: coord_cartesian() Zoom ---------------------------------------
# Obiettivo: Zoom senza rimuovere dati

set.seed(123)
diamonds_sample <- diamonds %>% sample_n(1000)

ggplot(diamonds_sample, aes(x = carat, y = price)) +
  geom_point(alpha = 0.5) +
  geom_smooth() +
  ___(xlim = c(___, ___), ylim = c(0, 10000))

# smooth calcolato su TUTTI i dati, poi zoom applicato


# ESERCIZIO 18: coord_fixed() -----------------------------------------------
# Obiettivo: Aspect ratio 1:1

ggplot(mtcars, aes(x = drat, y = wt)) +
  geom_point(size = 3) +
  ___(ratio = ___)

# 1 unità asse X = 1 unità asse Y (visivamente)


# ESERCIZIO 19: coord_polar() Pie Chart --------------------------------------
# Obiettivo: Pie chart di class counts

ggplot(mpg, aes(x = "", fill = class)) +
  geom_bar(width = 1) +
  ___(theta = "___") +
  theme_void()

# Nota: theta = "y" mappa Y (height) ad angolo


# ESERCIZIO 20: coord_polar() Bullseye ---------------------------------------
# Obiettivo: Radar chart

ggplot(mpg, aes(x = class, fill = class)) +
  geom_bar() +
  coord_polar(theta = "___") +
  theme_minimal()

# theta = "x" mappa X (categories) ad angolo


# =============================================================================
# PARTE 5: COORD TRANSFORMATIONS
# =============================================================================

# ESERCIZIO 21: scale_*_log10() ----------------------------------------------
# Obiettivo: Log transform con scale functions

ggplot(diamonds_sample, aes(x = carat, y = price)) +
  geom_point(alpha = 0.5) +
  ___() +
  ___()


# ESERCIZIO 22: coord_trans() -----------------------------------------------
# Obiettivo: Log transform con coord

ggplot(diamonds_sample, aes(x = carat, y = price)) +
  geom_point(alpha = 0.5) +
  ___(x = "___", y = "___")

# Visivamente simile ma matematicamente diverso per geoms complessi


# ESERCIZIO 23: scale_*_sqrt() ----------------------------------------------
# Obiettivo: Sqrt transform solo su Y

ggplot(diamonds_sample, aes(x = carat, y = price)) +
  geom_point(alpha = 0.5) +
  ___()


# ESERCIZIO 24: coord_trans() con smooth ------------------------------------
# Obiettivo: Differenza tra scale e coord con smooth

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
# Obiettivo: Impatto su smooth

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
# Obiettivo: Facets + flip per leggibilità

ggplot(mpg, aes(x = class, y = hwy)) +
  geom_boxplot() +
  facet_wrap(~ ___) +
  ___()


# ESERCIZIO 27: Facets + Zoom -----------------------------------------------
# Obiettivo: Facets + zoom

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_wrap(~ ___) +
  ___(xlim = c(2, 5), ylim = c(15, 35))


# ESERCIZIO 28: Facets + Free Scales + Log ----------------------------------
# Obiettivo: Combinazione complessa

ggplot(diamonds_sample, aes(x = carat, y = price)) +
  geom_point(alpha = 0.3) +
  facet_wrap(~ ___, scales = "___") +
  scale_x_log10() +
  ___()

# Pattern simili, magnitudini diverse


# ESERCIZIO 29: Grid + Multiple Aesthetics ----------------------------------
# Obiettivo: Troppe dimensioni!

ggplot(mpg, aes(x = displ, y = hwy, color = ___, size = ___)) +
  geom_point(alpha = 0.6) +
  facet_grid(___ ~ ___)

# Troppo complesso! Meglio semplificare


# ESERCIZIO 30: Best Practice Showcase --------------------------------------
# Obiettivo: Visualizzazione efficace

# Calcola mediane
hwy_medians <- mpg %>%
  group_by(___) %>%
  summarise(median_hwy = median(___))

ggplot(mpg, aes(x = hwy)) +
  ___(bins = 20, fill = "steelblue", color = "black", alpha = 0.7) +
  geom_vline(data = hwy_medians, 
             aes(xintercept = ___),
             color = "red", linetype = "dashed", linewidth = 1) +
  facet_wrap(~ ___, 
             ncol = ___,
             labeller = labeller(drv = c(
               "4" = "4WD",
               "f" = "Front-wheel",
               "r" = "Rear-wheel"
             ))) +
  labs(
    title = "Highway MPG Distribution by Drive Type",
    subtitle = "Red line = median per group",
    x = "Highway MPG",
    y = "Count"
  ) +
  theme_minimal()


# =============================================================================
# FINE ESERCIZI
# =============================================================================
# 
# Completa gli esercizi sopra per praticare facets e coordinate systems!
# Confronta poi con le soluzioni.
#
# =============================================================================
