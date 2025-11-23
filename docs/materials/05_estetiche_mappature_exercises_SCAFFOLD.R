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

ggplot(mpg, aes(x = displ, y = hwy, color = ___)) +
  geom_point()

# Interpretazione: Ogni tipo di trazione ha un colore distinto


# ESERCIZIO 2: Color Continuo -----------------------------------------------
# Obiettivo: Scatter plot displ vs hwy, con color basato su cty (consumo città)

ggplot(mpg, aes(x = displ, y = hwy, color = ___)) +
  geom_point()

# Nota: Gradient continuo da blu scuro a blu chiaro (default)


# ESERCIZIO 3: Color con Linee ----------------------------------------------
# Obiettivo: Line plot di economics: date vs unemploy, colorando per anno

# Soluzione 1: con lubridate
library(lubridate)
ggplot(economics, aes(x = date, y = unemploy, color = factor(___(___)))) +
  geom_line()

# Soluzione 2: senza lubridate
economics_year <- economics %>%
  mutate(year = format(date, "%Y"))

ggplot(economics_year, aes(x = date, y = ___, color = ___)) +
  ___()


# ESERCIZIO 4: Palette Viridis ----------------------------------------------
# Obiettivo: Ripeti esercizio 2, ma usa scale_color_viridis_c()

ggplot(mpg, aes(x = displ, y = hwy, color = ___)) +
  geom_point() +
  ___()

# Viridis è percettualmente uniforme e colorblind-friendly


# ESERCIZIO 5: Gradient Personalizzato --------------------------------------
# Obiettivo: Scatter plot diamonds: carat vs price, color su depth
#            Usa gradient da "yellow" a "red"

ggplot(diamonds, aes(x = carat, y = price, color = ___)) +
  geom_point(alpha = 0.3) +
  scale_color_gradient(low = "___", high = "___")


# =============================================================================
# PARTE 2: FILL AESTHETIC
# =============================================================================

# ESERCIZIO 6: Fill per Bar Chart -------------------------------------------
# Obiettivo: Bar chart di mpg per class, riempimento per drv

ggplot(mpg, aes(x = class, fill = ___)) +
  ___()

# Default: stacked bars


# ESERCIZIO 7: Fill con Density ---------------------------------------------
# Obiettivo: Density plot di hwy, con fill per drv e alpha = 0.5

ggplot(mpg, aes(x = hwy, fill = ___)) +
  ___(alpha = ___)

# Alpha permette di vedere sovrapposizioni


# ESERCIZIO 8: Color e Fill Insieme -----------------------------------------
# Obiettivo: Bar chart di class, fill per class, bordo nero

ggplot(mpg, aes(x = class, fill = ___)) +
  geom_bar(color = "___")

# fill = mapping (varia), color = setting (fisso)


# ESERCIZIO 9: Histogram con Fill -------------------------------------------
# Obiettivo: Histogram di carat (diamonds), fill per cut, position = "dodge"

ggplot(diamonds, aes(x = carat, fill = ___)) +
  ___(bins = 30, position = "___")

# position = "dodge" mette barre affiancate invece di stacked


# ESERCIZIO 10: Boxplot con Fill --------------------------------------------
# Obiettivo: Boxplot di hwy per class, fill per class, bordo "darkgray"

ggplot(mpg, aes(x = class, y = hwy, fill = ___)) +
  ___(color = "___")


# =============================================================================
# PARTE 3: SIZE E SHAPE
# =============================================================================

# ESERCIZIO 11: Size Continuo -----------------------------------------------
# Obiettivo: Scatter plot displ vs hwy, size basato su cyl

ggplot(mpg, aes(x = displ, y = hwy, size = ___)) +
  geom_point(alpha = 0.6)

# Size scala automaticamente con la variabile


# ESERCIZIO 12: Size + Color ------------------------------------------------
# Obiettivo: Scatter plot wt vs mpg (mtcars), size = hp, color = cyl

ggplot(mtcars, aes(x = wt, y = mpg, size = ___, color = ___)) +
  geom_point(alpha = 0.7)

# Visualizza 4 variabili contemporaneamente


# ESERCIZIO 13: Shape Discreto ----------------------------------------------
# Obiettivo: Scatter plot displ vs hwy, shape basato su drv, size = 3

ggplot(mpg, aes(x = displ, y = hwy, shape = ___)) +
  geom_point(size = ___)

# Shape varia solo con variabili discrete (fattori)


# ESERCIZIO 14: Shape + Color (Ridondanza) ----------------------------------
# Obiettivo: Scatter plot displ vs hwy, shape E color entrambi per drv

ggplot(mpg, aes(x = displ, y = hwy, shape = ___, color = ___)) +
  geom_point(size = 3)

# Ridondanza utile per accessibilità (colorblindness, stampa B/N)


# ESERCIZIO 15: Shape Personalizzato ----------------------------------------
# Obiettivo: Scatter plot displ vs hwy, usa shape = 21, 
#            color = "black", fill = "steelblue", size = 3

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(shape = ___, color = "___", fill = "___", size = ___)

# Shape 21-24 supportano sia color (bordo) che fill (interno)


# =============================================================================
# PARTE 4: ALPHA (TRASPARENZA)
# =============================================================================

# ESERCIZIO 16: Alpha Fisso per Overplotting --------------------------------
# Obiettivo: Scatter plot di diamonds (tutti i dati): carat vs price
#            Usa alpha = 0.1 per gestire overplotting

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point(alpha = ___, size = 0.5)

# Con 53,940 punti, alpha basso essenziale per vedere densità


# ESERCIZIO 17: Alpha Variabile ---------------------------------------------
# Obiettivo: Scatter plot mpg: displ vs hwy, alpha basato su cty

ggplot(mpg, aes(x = displ, y = hwy, alpha = ___)) +
  geom_point(size = 3)

# Alpha mapping crea legenda (spesso non ideale)


# ESERCIZIO 18: Alpha con Density -------------------------------------------
# Obiettivo: Density plot di hwy, fill per drv, alpha = 0.4

ggplot(mpg, aes(x = hwy, fill = ___)) +
  ___(alpha = ___)

# Alpha setting (non mapping) per overlay pulito


# ESERCIZIO 19: Alpha in Geom_ribbon ----------------------------------------
# Obiettivo: Line plot economics: date vs unemploy, 
#            aggiungi ribbon da unemploy-500 a unemploy+500, alpha = 0.3

ggplot(economics, aes(x = date, y = unemploy)) +
  ___(aes(ymin = unemploy - 500, ymax = unemploy + 500),
              alpha = ___, fill = "blue") +
  ___(color = "darkblue")

# Ribbon per incertezza/intervallo di confidenza


# ESERCIZIO 20: Jitter con Alpha --------------------------------------------
# Obiettivo: geom_jitter di class vs hwy, alpha = 0.5, width = 0.2

ggplot(mpg, aes(x = class, y = hwy)) +
  ___(alpha = ___, width = ___)

# Jitter + alpha gestisce overplotting in variabili discrete


# ESERCIZIO 21: Boxplot + Punti con Alpha -----------------------------------
# Obiettivo: Sovrapporre boxplot e punti per class vs hwy
#            Usa geom_boxplot con alpha = 0.5, poi geom_point sopra
#            In questo modo i punti sono visibili attraverso i boxplot

ggplot(mpg, aes(x = class, y = hwy)) +
  ___(alpha = ___, fill = "lightblue") +
  ___(alpha = 0.6)

# Alpha sul boxplot permette di vedere i punti sottostanti
# Variante con jitter per evitare sovrapposizione punti:
ggplot(mpg, aes(x = class, y = hwy)) +
  geom_boxplot(alpha = 0.3, fill = "steelblue") +
  ___(alpha = 0.5, width = 0.2, color = "darkred")


# =============================================================================
# PARTE 5: MAPPING VS SETTING
# =============================================================================

# ESERCIZIO 22: Errore Comune - Setting in aes() ---------------------------
# Obiettivo: IDENTIFICA L'ERRORE e correggilo
# Questo codice è sbagliato:
# ggplot(mpg, aes(x = displ, y = hwy, color = "blue")) + geom_point()

# ❌ SBAGLIATO: crea variabile letterale "blue"
ggplot(mpg, aes(x = displ, y = hwy, color = "blue")) + 
  geom_point()

# ✅ CORRETTO: setting fuori da aes()
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point(color = "___")


# ESERCIZIO 23: Mapping Corretto --------------------------------------------
# Obiettivo: Scatter plot displ vs hwy, mapping color a class,
#            setting size = 3 e alpha = 0.7

ggplot(mpg, aes(x = displ, y = hwy, color = ___)) +
  geom_point(size = ___, alpha = ___)

# color dentro aes() = mapping, size/alpha fuori = setting


# ESERCIZIO 23: Setting Multipli --------------------------------------------
# Obiettivo: Scatter plot wt vs mpg (mtcars), 
#            setting: color = "red", size = 4, shape = 17, alpha = 0.6

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(color = "___", size = ___, shape = ___, alpha = ___)

# Tutti setting = valori fissi, nessuna legenda


# ESERCIZIO 24: Mix Mapping e Setting ---------------------------------------
# Obiettivo: Scatter plot displ vs hwy,
#            mapping: color = class, size = cyl
#            setting: alpha = 0.6

ggplot(mpg, aes(x = displ, y = hwy, color = ___, size = ___)) +
  geom_point(alpha = ___)

# Mixing correttamente: mapping in aes(), setting in geom


# ESERCIZIO 25: Position = "dodge" con Fill ---------------------------------
# Obiettivo: Bar chart di class, fill per drv, position = "dodge"

ggplot(mpg, aes(x = class, fill = ___)) +
  geom_bar(position = "___")

# Try to use the different positions: stack, fill, dodge, identity
# Barre affiancate facilitano confronto tra gruppi


# =============================================================================
# PARTE 6: COMBINAZIONI AVANZATE
# =============================================================================

# ESERCIZIO 26: Quattro Variabili -------------------------------------------
# Obiettivo: Scatter plot displ vs hwy, 
#            color = class, size = cyl, alpha = 0.6

ggplot(mpg, aes(x = displ, y = hwy, color = ___, size = ___)) +
  geom_point(alpha = ___)

# 4 variabili: x, y, color, size


# ESERCIZIO 27: Ridondanza Accessibile --------------------------------------
# Obiettivo: Scatter plot displ vs hwy,
#            color E shape entrambi per drv (stessa variabile),
#            size = 3, per migliorare accessibilità

ggplot(mpg, aes(x = displ, y = hwy, color = ___, shape = ___)) +
  geom_point(size = ___)

# Ridondanza (color + shape per stessa var) aiuta colorblind users


# ESERCIZIO 28: Bubble Chart ------------------------------------------------
# Obiettivo: Scatter plot diamonds (sample di 1000 righe):
#            x = carat, y = price, size = depth, color = cut, alpha = 0.5

# Sample dei dati
diamonds_sample <- diamonds %>% sample_n(1000)

ggplot(diamonds_sample, aes(x = carat, y = price, size = ___, color = ___)) +
  geom_point(alpha = ___)

# 5 variabili in un plot! (ma complesso da interpretare)


# ESERCIZIO 29: Gradient Divergente -----------------------------------------
# Obiettivo: Prepara dati con variabile centrata, poi visualizza con gradient divergente

# Prepara dati
mpg_centered <- mpg %>%
  mutate(hwy_diff = hwy - mean(hwy))

# Scatter plot: displ vs hwy_diff, color = hwy_diff,
# usa scale_color_gradient2
ggplot(mpg_centered, aes(x = displ, y = hwy_diff, color = ___)) +
  geom_point(size = 3) +
  ___(low = "___", mid = "___", high = "___", midpoint = 0)

# Gradient divergente utile per valori positivi/negativi centrati su 0


# ESERCIZIO 30: Multivariato Completo ---------------------------------------
# Obiettivo: Visualizzazione completa mtcars:
#            x = wt, y = mpg, color = factor(cyl), size = hp, shape = factor(am)

ggplot(mtcars, aes(x = wt, y = mpg, 
                   color = factor(___), 
                   size = ___, 
                   shape = factor(___))) +
  geom_point(alpha = 0.7)

# 6 variabili! Limite pratico di leggibilità
# Nota: cyl e am convertiti a factor per discrete aesthetics


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
