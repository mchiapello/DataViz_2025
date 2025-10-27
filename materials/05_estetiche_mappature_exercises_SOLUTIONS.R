# =============================================================================
# SOLUZIONI: Estetiche e Mappature in ggplot2
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
data(mtcars)

# =============================================================================
# PARTE 1: COLOR AESTHETIC
# =============================================================================

# ESERCIZIO 1: Color Discreto Base -----------------------------------------
# Obiettivo: Creare scatter plot di displ vs hwy, colorando per drv (tipo trazione)

ggplot(mpg, aes(x = displ, y = hwy, color = drv)) +
  geom_point()

# Interpretazione: Ogni tipo di trazione ha un colore distinto


# ESERCIZIO 2: Color Continuo -----------------------------------------------
# Obiettivo: Scatter plot displ vs hwy, con color basato su cty (consumo città)

ggplot(mpg, aes(x = displ, y = hwy, color = cty)) +
  geom_point()

# Nota: Gradient continuo da blu scuro a blu chiaro (default)


# ESERCIZIO 3: Color con Linee ----------------------------------------------
# Obiettivo: Line plot di economics: date vs unemploy, colorando per anno

# Soluzione 1: con lubridate
library(lubridate)
ggplot(economics, aes(x = date, y = unemploy, color = factor(year(date)))) +
  geom_line()

# Soluzione 2: senza lubridate
economics_year <- economics %>%
  mutate(year = format(date, "%Y"))

ggplot(economics_year, aes(x = date, y = unemploy, color = year)) +
  geom_line()


# ESERCIZIO 4: Palette Viridis ----------------------------------------------
# Obiettivo: Ripeti esercizio 2, ma usa scale_color_viridis_c()

ggplot(mpg, aes(x = displ, y = hwy, color = cty)) +
  geom_point() +
  scale_color_viridis_c()

# Viridis è percettualmente uniforme e colorblind-friendly


# ESERCIZIO 5: Gradient Personalizzato --------------------------------------
# Obiettivo: Scatter plot diamonds: carat vs price, color su depth
#            Usa gradient da "yellow" a "red"

ggplot(diamonds, aes(x = carat, y = price, color = depth)) +
  geom_point(alpha = 0.3) +
  scale_color_gradient(low = "yellow", high = "red")


# =============================================================================
# PARTE 2: FILL AESTHETIC
# =============================================================================

# ESERCIZIO 6: Fill per Bar Chart -------------------------------------------
# Obiettivo: Bar chart di mpg per class, riempimento per drv

ggplot(mpg, aes(x = class, fill = drv)) +
  geom_bar()

# Default: stacked bars


# ESERCIZIO 7: Fill con Density ---------------------------------------------
# Obiettivo: Density plot di hwy, con fill per drv e alpha = 0.5

ggplot(mpg, aes(x = hwy, fill = drv)) +
  geom_density(alpha = 0.5)

# Alpha permette di vedere sovrapposizioni


# ESERCIZIO 8: Color e Fill Insieme -----------------------------------------
# Obiettivo: Bar chart di class, fill per class, bordo nero

ggplot(mpg, aes(x = class, fill = class)) +
  geom_bar(color = "black")

# fill = mapping (varia), color = setting (fisso)


# ESERCIZIO 9: Histogram con Fill -------------------------------------------
# Obiettivo: Histogram di carat (diamonds), fill per cut, position = "dodge"

ggplot(diamonds, aes(x = carat, fill = cut)) +
  geom_histogram(bins = 30, position = "dodge")

# position = "dodge" mette barre affiancate invece di stacked


# ESERCIZIO 10: Boxplot con Fill --------------------------------------------
# Obiettivo: Boxplot di hwy per class, fill per class, bordo "darkgray"

ggplot(mpg, aes(x = class, y = hwy, fill = class)) +
  geom_boxplot(color = "darkgray")


# =============================================================================
# PARTE 3: SIZE E SHAPE
# =============================================================================

# ESERCIZIO 11: Size Continuo -----------------------------------------------
# Obiettivo: Scatter plot displ vs hwy, size basato su cyl

ggplot(mpg, aes(x = displ, y = hwy, size = cyl)) +
  geom_point(alpha = 0.6)

# Size scala automaticamente con la variabile


# ESERCIZIO 12: Size + Color ------------------------------------------------
# Obiettivo: Scatter plot wt vs mpg (mtcars), size = hp, color = cyl

ggplot(mtcars, aes(x = wt, y = mpg, size = hp, color = cyl)) +
  geom_point(alpha = 0.7)

# Visualizza 4 variabili contemporaneamente


# ESERCIZIO 13: Shape Discreto ----------------------------------------------
# Obiettivo: Scatter plot displ vs hwy, shape basato su drv, size = 3

ggplot(mpg, aes(x = displ, y = hwy, shape = drv)) +
  geom_point(size = 3)

# Shape varia solo con variabili discrete (fattori)


# ESERCIZIO 14: Shape + Color (Ridondanza) ----------------------------------
# Obiettivo: Scatter plot displ vs hwy, shape E color entrambi per drv

ggplot(mpg, aes(x = displ, y = hwy, shape = drv, color = drv)) +
  geom_point(size = 3)

# Ridondanza utile per accessibilità (colorblindness, stampa B/N)


# ESERCIZIO 15: Shape Personalizzato ----------------------------------------
# Obiettivo: Scatter plot displ vs hwy, usa shape = 21, 
#            color = "black", fill = "steelblue", size = 3

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(shape = 21, color = "black", fill = "steelblue", size = 3)

# Shape 21-24 supportano sia color (bordo) che fill (interno)


# =============================================================================
# PARTE 4: ALPHA (TRASPARENZA)
# =============================================================================

# ESERCIZIO 16: Alpha Fisso per Overplotting --------------------------------
# Obiettivo: Scatter plot di diamonds (tutti i dati): carat vs price
#            Usa alpha = 0.1 per gestire overplotting

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point(alpha = 0.1, size = 0.5)

# Con 53,940 punti, alpha basso essenziale per vedere densità


# ESERCIZIO 17: Alpha Variabile ---------------------------------------------
# Obiettivo: Scatter plot mpg: displ vs hwy, alpha basato su cty

ggplot(mpg, aes(x = displ, y = hwy, alpha = cty)) +
  geom_point(size = 3)

# Alpha mapping crea legenda (spesso non ideale)


# ESERCIZIO 18: Alpha con Density -------------------------------------------
# Obiettivo: Density plot di hwy, fill per drv, alpha = 0.4

ggplot(mpg, aes(x = hwy, fill = drv)) +
  geom_density(alpha = 0.4)

# Alpha setting (non mapping) per overlay pulito


# ESERCIZIO 19: Alpha in Geom_ribbon ----------------------------------------
# Obiettivo: Line plot economics: date vs unemploy, 
#            aggiungi ribbon da unemploy-500 a unemploy+500, alpha = 0.3

ggplot(economics, aes(x = date, y = unemploy)) +
  geom_ribbon(aes(ymin = unemploy - 500, ymax = unemploy + 500),
              alpha = 0.3, fill = "blue") +
  geom_line(color = "darkblue")

# Ribbon per incertezza/intervallo di confidenza


# ESERCIZIO 20: Jitter con Alpha --------------------------------------------
# Obiettivo: geom_jitter di class vs hwy, alpha = 0.5, width = 0.2

ggplot(mpg, aes(x = class, y = hwy)) +
  geom_jitter(alpha = 0.5, width = 0.2)

# Jitter + alpha gestisce overplotting in variabili discrete


# =============================================================================
# PARTE 5: MAPPING VS SETTING
# =============================================================================

# ESERCIZIO 21: Errore Comune - Setting in aes() ---------------------------
# Obiettivo: IDENTIFICA L'ERRORE e correggilo
# Questo codice è sbagliato:
# ggplot(mpg, aes(x = displ, y = hwy, color = "blue")) + geom_point()

# ❌ SBAGLIATO: crea variabile letterale "blue"
ggplot(mpg, aes(x = displ, y = hwy, color = "blue")) + 
  geom_point()

# ✅ CORRETTO: setting fuori da aes()
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point(color = "blue")


# ESERCIZIO 22: Mapping Corretto --------------------------------------------
# Obiettivo: Scatter plot displ vs hwy, mapping color a class,
#            setting size = 3 e alpha = 0.7

ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
  geom_point(size = 3, alpha = 0.7)

# color dentro aes() = mapping, size/alpha fuori = setting


# ESERCIZIO 23: Setting Multipli --------------------------------------------
# Obiettivo: Scatter plot wt vs mpg (mtcars), 
#            setting: color = "red", size = 4, shape = 17, alpha = 0.6

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(color = "red", size = 4, shape = 17, alpha = 0.6)

# Tutti setting = valori fissi, nessuna legenda


# ESERCIZIO 24: Mix Mapping e Setting ---------------------------------------
# Obiettivo: Scatter plot displ vs hwy,
#            mapping: color = class, size = cyl
#            setting: alpha = 0.6

ggplot(mpg, aes(x = displ, y = hwy, color = class, size = cyl)) +
  geom_point(alpha = 0.6)

# Mixing correttamente: mapping in aes(), setting in geom


# ESERCIZIO 25: Position = "dodge" con Fill ---------------------------------
# Obiettivo: Bar chart di class, fill per drv, position = "dodge"

ggplot(mpg, aes(x = class, fill = drv)) +
  geom_bar(position = "dodge")

# Barre affiancate facilitano confronto tra gruppi


# =============================================================================
# PARTE 6: COMBINAZIONI AVANZATE
# =============================================================================

# ESERCIZIO 26: Quattro Variabili -------------------------------------------
# Obiettivo: Scatter plot displ vs hwy, 
#            color = class, size = cyl, alpha = 0.6

ggplot(mpg, aes(x = displ, y = hwy, color = class, size = cyl)) +
  geom_point(alpha = 0.6)

# 4 variabili: x, y, color, size


# ESERCIZIO 27: Ridondanza Accessibile --------------------------------------
# Obiettivo: Scatter plot displ vs hwy,
#            color E shape entrambi per drv (stessa variabile),
#            size = 3, per migliorare accessibilità

ggplot(mpg, aes(x = displ, y = hwy, color = drv, shape = drv)) +
  geom_point(size = 3)

# Ridondanza (color + shape per stessa var) aiuta colorblind users


# ESERCIZIO 28: Bubble Chart ------------------------------------------------
# Obiettivo: Scatter plot diamonds (sample di 1000 righe):
#            x = carat, y = price, size = depth, color = cut, alpha = 0.5

# Sample dei dati
diamonds_sample <- diamonds %>% sample_n(1000)

ggplot(diamonds_sample, aes(x = carat, y = price, size = depth, color = cut)) +
  geom_point(alpha = 0.5)

# 5 variabili in un plot! (ma complesso da interpretare)


# ESERCIZIO 29: Gradient Divergente -----------------------------------------
# Obiettivo: Prepara dati con variabile centrata, poi visualizza con gradient divergente

# Prepara dati
mpg_centered <- mpg %>%
  mutate(hwy_diff = hwy - mean(hwy))

# Scatter plot: displ vs hwy_diff, color = hwy_diff,
# usa scale_color_gradient2
ggplot(mpg_centered, aes(x = displ, y = hwy_diff, color = hwy_diff)) +
  geom_point(size = 3) +
  scale_color_gradient2(low = "blue", mid = "white", high = "red", midpoint = 0)

# Gradient divergente utile per valori positivi/negativi centrati su 0


# ESERCIZIO 30: Multivariato Completo ---------------------------------------
# Obiettivo: Visualizzazione completa mtcars:
#            x = wt, y = mpg, color = factor(cyl), size = hp, shape = factor(am)

ggplot(mtcars, aes(x = wt, y = mpg, 
                   color = factor(cyl), 
                   size = hp, 
                   shape = factor(am))) +
  geom_point(alpha = 0.7)

# 6 variabili! Limite pratico di leggibilità
# Nota: cyl e am convertiti a factor per discrete aesthetics


# =============================================================================
# FINE SOLUZIONI
# =============================================================================
# 
# Best Practices Recap:
# 
# 1. MAPPING vs SETTING
#    - Mapping (in aes): variabile → aesthetic → crea scala/legenda
#    - Setting (in geom): valore fisso → nessuna scala/legenda
#
# 2. COLOR vs FILL
#    - color: bordi, linee, punti
#    - fill: aree interne (bar, density, boxplot, ribbon)
#
# 3. ESTETICHE PER TIPO VARIABILE
#    - Discrete: color, fill, shape (max 6-7 categorie)
#    - Continue: color, fill (gradient), size, alpha
#
# 4. GESTIRE OVERPLOTTING
#    - Alpha basso (0.1-0.5)
#    - geom_jitter()
#    - Size piccolo
#    - Binning (hex, bin2d)
#
# 5. ACCESSIBILITÀ
#    - Viridis palette (colorblind-friendly)
#    - Color + shape ridondanza
#    - Evita solo rosso/verde
#
# 6. QUANTE ESTETICHE?
#    - Max 3-4 mappate per leggibilità
#    - Usa facets per variabili aggiuntive
#    - Priorità: posizione > color > size > shape
#
# =============================================================================
