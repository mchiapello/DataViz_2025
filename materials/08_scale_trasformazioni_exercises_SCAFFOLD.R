# ============================================================================
# SCALE E TRASFORMAZIONI - ESERCIZI
# ============================================================================
# Corso: REVELO Training - Data Viz 2025
# Modulo: 08 - Scale e Trasformazioni
# ============================================================================
# 
# Istruzioni:
# - Completa ogni esercizio scrivendo il codice richiesto
# - Esegui il codice per verificare che funzioni
# - Sperimenta con variazioni!
# ============================================================================

# Setup -------------------------------------------------------------------
library(ggplot2)
library(scales)
library(dplyr)

data(mpg)
data(diamonds)
data(economics)
data(mtcars)

# ============================================================================
# PARTE 1: SCALE CONTINUE (5 esercizi)
# ============================================================================

## Esercizio 1.1: Limiti e Breaks ------------------------------------
# Obiettivo: Creare scatter plot mpg con assi personalizzati
#
# Dataset: mpg
# Visualizzazione: scatter plot (displ vs hwy)
# Richieste:
# - Limita asse x tra 2 e 7
# - Imposta breaks ogni 1 unità sull'asse x
# - Limita asse y tra 15 e 40
# - Aggiungi titoli agli assi: "Cilindrata (L)" e "Consumo autostrada (mpg)"

## Soluzione 1.1: Limiti e Breaks ------------------------------------
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  scale_x_continuous(
    name = "___",
    limits = c(___, ___),
    breaks = seq(2, 7, ___)
  ) +
  scale_y_continuous(
    name = "___",
    limits = c(___, ___)
  )

# Note: limits rimuove dati fuori range (warning). Per zoom, usa coord_cartesian()
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  ___(xlim = c(2, 7), ylim = c(15, 40))

## Esercizio 1.2: coord_cartesian vs limits --------------------------
# Obiettivo: Comprendere la differenza tra zoom e filtraggio
#
# Dataset: mpg
# Visualizzazione: boxplot (class vs hwy)
# Richieste:
# - Crea DUE grafici identici tranne che per i limiti y
# - Grafico A: usa scale_y_continuous(limits = c(10, 30))
# - Grafico B: usa coord_cartesian(ylim = c(10, 30))
# - Osserva: quale ha statistiche corrette?

## Soluzione 1.2: coord_cartesian vs limits --------------------------
# Grafico A (scale limits - SBAGLIATO per statistiche):
ggplot(mpg, aes(x = class, y = hwy)) +
  geom_boxplot() +
  ___(limits = c(___, ___)) +
  labs(title = "A: scale_y_continuous(limits) - Statistiche ERRATE")

# Grafico B (coord zoom - CORRETTO):
ggplot(mpg, aes(x = class, y = hwy)) +
  geom_boxplot() +
  ___(ylim = c(10, 30)) +
  labs(title = "B: coord_cartesian(ylim) - Statistiche CORRETTE")

# Spiegazione:
# - Grafico A: dati > 30 vengono RIMOSSI prima del calcolo delle statistiche
#   Quindi mediane, quartili, outliers sono calcolati su dati filtrati
# - Grafico B: tutti i dati sono MANTENUTI per le statistiche, solo zoom visivo
#   Statistiche corrette, alcuni punti non visibili ma contano nel calcolo
#
# REGOLA: Quasi sempre usa coord_cartesian() per limitare visualizzazione!


## Esercizio 1.3: Expand e Padding -----------------------------------
# Obiettivo: Controllare lo spazio ai bordi degli assi
#
# Dataset: economics
# Visualizzazione: line plot (date vs unemploy)
# Richieste:
# - Rimuovi completamente il padding su entrambi gli assi
#   (usa expansion(mult = c(0, 0)))
# - Nota come le linee toccano i bordi

## Soluzione 1.3: Expand e Padding -----------------------------------
ggplot(economics, aes(x = date, y = unemploy)) +
  geom_line() +
  scale_x_date(expand = expansion(mult = c(___, ___))) +
  scale_y_continuous(expand = expansion(mult = c(___, ___))) +
  labs(title = "Linea tocca i bordi - nessun padding")

# Note: expansion(mult = c(0, 0)) rimuove padding
# expansion(mult = c(0.05, 0.05)) aggiunge 5% ai bordi (default varia)
# expansion(add = c(0, 30)) aggiunge unità fisse


## Esercizio 1.4: Breaks Custom --------------------------------------
# Obiettivo: Definire posizioni specifiche per i tick marks
#
# Dataset: mtcars
# Visualizzazione: scatter plot (wt vs mpg)
# Richieste:
# - Imposta breaks sull'asse x a: 2, 3, 4, 5
# - Imposta breaks sull'asse y ogni 5 unità (10, 15, 20, 25, 30)
# - Aggiungi titoli descrittivi

## Soluzione 1.4: Breaks Custom --------------------------------------
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(size = 3) +
  scale_x_continuous(
    name = "Peso (1000 lbs)",
    breaks = c(___, ___, ___, ___)
  ) +
  scale_y_continuous(
    name = "Miglia per gallone",
    breaks = seq(___, ___, ___)
  )

# Note: breaks controlla dove appaiono tick marks e numeri
# Può essere vettore numerico o funzione


## Esercizio 1.5: Combinare Controlli --------------------------------
# Obiettivo: Usare più parametri insieme
#
# Dataset: diamonds (filtra solo clarity == "SI1")
# Visualizzazione: scatter plot (carat vs price)
# Richieste:
# - Limiti x: 0.5 a 2.5
# - Breaks x: ogni 0.5
# - Limiti y: 1000 a 10000
# - Breaks y: 2000, 5000, 8000
# - Nomi assi: "Carati" e "Prezzo ($)"

## Soluzione 1.5: Combinare Controlli --------------------------------
diamonds_si1 <- filter(diamonds, clarity == "SI1")

ggplot(diamonds_si1, aes(x = carat, y = price)) +
  geom_point(alpha = 0.3) +
  scale_x_continuous(
    name = "___",
    limits = c(___, ___),
    breaks = seq(0.5, 2.5, ___)
  ) +
  scale_y_continuous(
    name = "___",
    limits = c(___, ___),
    breaks = c(___, ___, ___)
  ) +
  labs(title = "Diamanti con clarità SI1")

# Note: Combinare limits, breaks, labels offre controllo completo


# ============================================================================
# PARTE 2: TRASFORMAZIONI (5 esercizi)
# ============================================================================

## Esercizio 2.1: Trasformazione Log10 -------------------------------
# Obiettivo: Applicare scala logaritmica
#
# Dataset: diamonds
# Visualizzazione: scatter plot (carat vs price) con smooth
# Richieste:
# - Applica scale_x_log10() e scale_y_log10()
# - Aggiungi geom_smooth(method = "lm")
# - Riduci alpha dei punti a 0.1
# - Osserva: relazione più lineare?

## Soluzione 2.1: Trasformazione Log10 -------------------------------
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point(alpha = 0.1) +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  ___() +
  ___() +
  labs(title = "Relazione log-log tra carati e prezzo",
       subtitle = "Più lineare dopo trasformazione logaritmica")

# Note: In scala log, relazione power-law (y = x^b) diventa lineare
# log(y) = b * log(x) + c
# geom_smooth è calcolato su dati log-trasformati


## Esercizio 2.2: Log vs Linear --------------------------------------
# Obiettivo: Confrontare scala log vs lineare
#
# Dataset: economics
# Visualizzazione: DUE line plots (date vs pop)
# Richieste:
# - Grafico A: scala y lineare
# - Grafico B: scala y log10
# - Osserva: quale mostra meglio il trend di crescita?

## Soluzione 2.2: Log vs Linear --------------------------------------
# Grafico A (lineare):
ggplot(economics, aes(x = date, y = pop)) +
  geom_line(color = "steelblue") +
  scale_y_continuous(labels = comma) +
  labs(title = "A: Scala lineare - crescita sembra accelerare",
       y = "Popolazione USA")

# Grafico B (log):
ggplot(economics, aes(x = date, y = pop)) +
  geom_line(color = "steelblue") +
  ___(labels = comma) +
  labs(title = "B: Scala log10 - crescita costante in %",
       y = "Popolazione USA (scala log)")

# Spiegazione:
# - Lineare: crescita assoluta sembra accelerare
# - Log: crescita percentuale costante appare lineare
# Usa log quando interessa tasso di crescita relativo


## Esercizio 2.3: Trasformazione Sqrt --------------------------------
# Obiettivo: Usare trasformazione radice quadrata
#
# Dataset: diamonds
# Visualizzazione: histogram (price)
# Richieste:
# - Crea histogram con bins = 50
# - Applica scale_y_sqrt() all'asse dei conteggi
# - Osserva: distribuzione più simmetrica?

## Soluzione 2.3: Trasformazione Sqrt --------------------------------
ggplot(diamonds, aes(x = price)) +
  geom_histogram(bins = 50, fill = "steelblue", color = "white") +
  ___() +
  labs(title = "Distribuzione prezzi con scala sqrt sui conteggi",
       subtitle = "Evidenzia meglio code della distribuzione",
       y = "Conteggio (scala sqrt)")

# Note: sqrt comprime differenze grandi, espande piccole
# Utile per conteggi con grande range


## Esercizio 2.4: Reverse Scale --------------------------------------
# Obiettivo: Invertire direzione asse
#
# Dataset: mtcars
# Visualizzazione: bar plot orizzontale (reorder(rownames, mpg) vs mpg)
# Richieste:
# - Crea bar plot con geom_col()
# - Usa coord_flip() per renderlo orizzontale
# - Applica scale_y_reverse() per invertire ordine
# - Utile per ranking dal migliore al peggiore

## Soluzione 2.4: Reverse Scale --------------------------------------
mtcars_named <- mtcars %>% mutate(car = rownames(mtcars))

ggplot(mtcars_named, aes(x = reorder(car, mpg), y = mpg)) +
  geom_col(fill = "steelblue") +
  ___() +
  ___() +
  labs(title = "Automobili ordinate per consumo (peggiore in alto)",
       x = NULL,
       y = "Miglia per gallone")

# Note: scale_y_reverse() inverte direzione
# Utile per ranking, profondità, o convenzioni specifiche


## Esercizio 2.5: Trasformazione con Breaks Custom -------------------
# Obiettivo: Combinare trasformazione e breaks personalizzati
#
# Dataset: diamonds
# Visualizzazione: scatter plot (carat vs price)
# Richieste:
# - Applica scale_y_log10()
# - Imposta breaks a: 500, 1000, 2000, 5000, 10000, 20000
# - Usa labels = scales::dollar per formattare
# - Aggiungi alpha = 0.2 ai punti

## Soluzione 2.5: Trasformazione con Breaks Custom -------------------
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point(alpha = 0.2, color = "steelblue") +
  ___(
    breaks = c(___, ___, ___, ___, ___, ___),
    labels = ___
  ) +
  labs(title = "Prezzo vs Carati (scala log con breaks custom)",
       x = "Carati",
       y = "Prezzo")

# Note: Anche con trasformazione, puoi controllare breaks
# Labels formattati con scales::dollar


# ============================================================================
# PARTE 3: SCALE COLORE DISCRETE (5 esercizi)
# ============================================================================

## Esercizio 3.1: ColorBrewer Qualitative ----------------------------
# Obiettivo: Usare palette ColorBrewer
#
# Dataset: mpg
# Visualizzazione: scatter plot (displ vs hwy, color = class)
# Richieste:
# - Usa scale_color_brewer(palette = "Set1")
# - Aggiungi titolo legenda: "Tipo di auto"
# - Aumenta size punti a 3

## Soluzione 3.1: ColorBrewer Qualitative ----------------------------
ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
  geom_point(size = 3) +
  ___(
    palette = "___",
    name = "Tipo di auto"
  ) +
  labs(title = "Consumo per tipo di auto",
       subtitle = "Palette ColorBrewer Set1")

# Note: Set1 progettata per categorie qualitative
# Max 9 colori distinguibili


## Esercizio 3.2: Viridis Discrete -----------------------------------
# Obiettivo: Usare palette viridis per categorie
#
# Dataset: mpg
# Visualizzazione: boxplot (class vs hwy, fill = class)
# Richieste:
# - Usa scale_fill_viridis_d(option = "D")
# - Rimuovi la legenda (guide = "none")
# - Osserva: colori distinguibili?

## Soluzione 3.2: Viridis Discrete -----------------------------------
ggplot(mpg, aes(x = class, y = hwy, fill = class)) +
  geom_boxplot(show.legend = FALSE) +
  ___(option = "___") +
  labs(title = "Consumo per categoria (palette viridis)",
       x = "Categoria",
       y = "Miglia per gallone (autostrada)")

# Note: Viridis D (default) è colorblind-safe
# option = "E" (cividis) è ancora migliore per daltonici


## Esercizio 3.3: Manual Colors --------------------------------------
# Obiettivo: Definire colori manualmente
#
# Dataset: mpg (filtra solo drv in c("f", "r", "4"))
# Visualizzazione: bar plot (class, fill = drv)
# Richieste:
# - Definisci colori: "f" = "#E41A1C", "r" = "#377EB8", "4" = "#4DAF4A"
# - Usa scale_fill_manual(values = ...)
# - Aggiungi labels: "f" = "Trazione anteriore", "r" = "Posteriore", "4" = "4x4"

## Soluzione 3.3: Manual Colors --------------------------------------
mpg_drv <- filter(mpg, drv %in% c("f", "r", "4"))

ggplot(mpg_drv, aes(x = class, fill = drv)) +
  geom_bar(position = "dodge") +
  ___(
    name = "Trazione",
    values = c("f" = "#E41A1C", "r" = "#377EB8", "4" = "#4DAF4A"),
    labels = c("f" = "___", "r" = "___", "4" = "___")
  ) +
  labs(title = "Distribuzione tipi di trazione per categoria")

# Note: Manual permette controllo completo
# Utile per brand colors o standard specifici


## Esercizio 3.4: ColorBrewer con Direction --------------------------
# Obiettivo: Invertire palette
#
# Dataset: diamonds (sample 1000 righe)
# Visualizzazione: scatter plot (carat vs price, color = cut)
# Richieste:
# - Usa scale_color_brewer(palette = "Spectral", direction = -1)
# - Aggiungi alpha = 0.6
# - Osserva differenza tra direction = 1 e -1

## Soluzione 3.4: ColorBrewer con Direction --------------------------
diamonds_sample <- sample_n(diamonds, 1000)

ggplot(diamonds_sample, aes(x = carat, y = price, color = cut)) +
  geom_point(alpha = 0.6, size = 2) +
  ___(
    palette = "___",
    direction = ___,
    name = "Taglio"
  ) +
  labs(title = "Palette Spectral invertita (direction = -1)")

# Note: direction = -1 inverte ordine colori
# Spectral è diverging, va da rosso a blu (o viceversa)


## Esercizio 3.5: Consistenza Color e Fill ---------------------------
# Obiettivo: Usare stessa palette per color e fill
#
# Dataset: mpg
# Visualizzazione: boxplot (class vs hwy, fill = class) con outliers colorati
# Richieste:
# - geom_boxplot con outlier.color = class mappato
# - scale_fill_brewer(palette = "Set2")
# - scale_color_brewer(palette = "Set2")
# - Osserva: consistenza visiva

## Soluzione 3.5: Consistenza Color e Fill ---------------------------
ggplot(mpg, aes(x = class, y = hwy)) +
  geom_boxplot(aes(fill = ___, color = ___), outlier.size = 2) +
  ___(palette = "Set2", name = "Categoria") +
  ___(palette = "Set2", name = "Categoria") +
  labs(title = "Consistenza tra fill e color",
       subtitle = "Stessa palette per riempimento e bordi")

# Note: Quando color e fill mappano stessa variabile, usa stessa palette
# Crea coerenza visiva


# ============================================================================
# PARTE 4: SCALE COLORE CONTINUE (5 esercizi)
# ============================================================================

## Esercizio 4.1: Gradient a 2 Colori --------------------------------
# Obiettivo: Creare gradient semplice
#
# Dataset: diamonds (sample 5000 righe)
# Visualizzazione: scatter plot (carat vs price, color = depth)
# Richieste:
# - Usa scale_color_gradient(low = "lightblue", high = "darkblue")
# - Aggiungi alpha = 0.5
# - Titolo legenda: "Profondità (%)"

## Soluzione 4.1: Gradient a 2 Colori --------------------------------
diamonds_sample2 <- sample_n(diamonds, 5000)

ggplot(diamonds_sample2, aes(x = carat, y = price, color = depth)) +
  geom_point(alpha = 0.5) +
  ___(
    low = "___",
    high = "___",
    name = "Profondità (%)"
  ) +
  labs(title = "Gradient semplice (2 colori)")

# Note: Gradient buono per valori sequenziali
# Non ottimale per percezione - preferisci viridis


## Esercizio 4.2: Viridis Continuous ---------------------------------
# Obiettivo: Usare viridis per valori continui
#
# Dataset: faithfuld (built-in density dataset)
# Visualizzazione: tile plot (waiting vs eruptions, fill = density)
# Richieste:
# - Usa geom_tile()
# - scale_fill_viridis_c(option = "C") # plasma
# - Osserva: percezione uniforme dei valori

## Soluzione 4.2: Viridis Continuous ---------------------------------
data(faithfuld)

ggplot(faithfuld, aes(x = waiting, y = eruptions, fill = density)) +
  geom_tile() +
  ___(option = "___", name = "Densità") +
  labs(title = "Old Faithful - Densità 2D",
       subtitle = "Palette Viridis (plasma)",
       x = "Tempo di attesa (min)",
       y = "Durata eruzione (min)")

# Note: Viridis eccellente per heatmaps
# Perceptually uniform - differenze di colore = differenze di valore


## Esercizio 4.3: Diverging Scale (Gradient2) ------------------------
# Obiettivo: Usare scala divergente con midpoint
#
# Dataset: mtcars (centra mpg sottraendo la media)
# Visualizzazione: bar plot (rownames vs mpg_centered, fill = mpg_centered)
# Richieste:
# - Calcola mpg_centered = mpg - mean(mpg)
# - Usa scale_fill_gradient2(low = "red", mid = "white", high = "blue", midpoint = 0)
# - Mostra deviazioni dalla media

## Soluzione 4.3: Diverging Scale (Gradient2) ------------------------
mtcars_centered <- mtcars %>% 
  mutate(car = rownames(mtcars),
         mpg_centered = mpg - mean(___))

ggplot(mtcars_centered, aes(x = reorder(car, mpg_centered), y = mpg_centered, fill = mpg_centered)) +
  geom_col() +
  ___(
    low = "___",
    mid = "___",
    high = "___",
    midpoint = ___,
    name = "Deviazione\ndalla media"
  ) +
  coord_flip() +
  labs(title = "Consumo auto: deviazioni dalla media",
       subtitle = "Rosso = sotto media, Blu = sopra media",
       x = NULL,
       y = "MPG (centrato)")

# Note: gradient2 perfetto per valori con punto centrale significativo
# Zero, media, o valore di riferimento


## Esercizio 4.4: Gradientn (Multiple Colors) ------------------------
# Obiettivo: Creare gradient con più colori
#
# Dataset: diamonds (sample 5000)
# Visualizzazione: scatter plot (carat vs price, color = price)
# Richieste:
# - Usa scale_color_gradientn(colors = c("blue", "cyan", "yellow", "orange", "red"))
# - Aggiungi alpha = 0.6
# - Osserva: transizioni tra colori

## Soluzione 4.4: Gradientn (Multiple Colors) ------------------------
ggplot(sample_n(diamonds, 5000), aes(x = carat, y = price, color = price)) +
  geom_point(alpha = 0.6) +
  ___(
    colors = c("___", "___", "___", "___", "___"),
    name = "Prezzo ($)"
  ) +
  labs(title = "Gradient con 5 colori",
       subtitle = "Da blu a rosso passando per cyan-yellow-orange")

# Note: gradientn per transizioni multi-colore
# Non sempre percettivamente uniforme - usa con cautela


## Esercizio 4.5: Limiti e Breaks per Colori -------------------------
# Obiettivo: Controllare range di colori
#
# Dataset: diamonds
# Visualizzazione: scatter plot (carat vs price, color = price)
# Richieste:
# - Usa scale_color_viridis_c()
# - Limita scala colori a price tra 2000 e 15000
# - Imposta breaks a: 2000, 5000, 10000, 15000
# - Usa labels = scales::dollar

## Soluzione 4.5: Limiti e Breaks per Colori -------------------------
ggplot(diamonds, aes(x = carat, y = price, color = price)) +
  geom_point(alpha = 0.3) +
  ___(
    limits = c(___, ___),
    breaks = c(___, ___, ___, ___),
    labels = ___,
    name = "Prezzo"
  ) +
  labs(title = "Scala colori con limiti e breaks custom")

# Note: limits su scala colori funziona come su altre scale
# Valori fuori limite diventano NA (grigi)


# ============================================================================
# PARTE 5: SCALE DIMENSIONE E FORMA (5 esercizi)
# ============================================================================

## Esercizio 5.1: Size vs Size_Area ----------------------------------
# Obiettivo: Confrontare scaling radius vs area
#
# Dataset: mtcars
# Visualizzazione: DUE scatter plots (wt vs mpg, size = hp)
# Richieste:
# - Grafico A: scale_size(range = c(1, 15))
# - Grafico B: scale_size_area(max_size = 15)
# - Osserva: quale rappresenta meglio i valori?

## Soluzione 5.1: Size vs Size_Area ----------------------------------
# Grafico A (radius scaling - SBAGLIATO):
ggplot(mtcars, aes(x = wt, y = mpg, size = hp)) +
  geom_point(alpha = 0.6, color = "steelblue") +
  ___(range = c(1, 15), name = "Cavalli") +
  labs(title = "A: scale_size (radius) - Grandi sembrano TROPPO grandi")

# Grafico B (area scaling - CORRETTO):
ggplot(mtcars, aes(x = wt, y = mpg, size = hp)) +
  geom_point(alpha = 0.6, color = "steelblue") +
  ___(max_size = 15, name = "Cavalli") +
  labs(title = "B: scale_size_area - Percezione corretta")

# Spiegazione:
# - scale_size: mappa valori → radius. Raddoppiando valore, radius × 2, ma area × 4!
# - scale_size_area: mappa valori → area. Raddoppiando valore, area × 2. CORRETTO.
# Occhio percepisce area, non radius → sempre usa scale_size_area()


## Esercizio 5.2: Size_Area con Zero ---------------------------------
# Obiettivo: Verificare che zero → zero area
#
# Dataset: crea dataset custom con alcuni valori a zero
# Visualizzazione: scatter plot con size
# Richieste:
# - Crea data con x, y, size (alcuni size = 0)
# - Usa scale_size_area()
# - Verifica che punti con size = 0 siano invisibili

## Soluzione 5.2: Size_Area con Zero ---------------------------------
data_with_zeros <- data.frame(
  x = 1:10,
  y = 1:10,
  size_val = c(0, 5, 10, 0, 15, 20, 0, 25, 30, 35)
)

ggplot(data_with_zeros, aes(x = x, y = y, size = size_val)) +
  geom_point(color = "steelblue", alpha = 0.7) +
  ___(max_size = 15, name = "Valore") +
  labs(title = "scale_size_area con valori zero",
       subtitle = "Zero → zero area (punti invisibili)")

# Note: scale_size_area garantisce che 0 → 0 area
# scale_size potrebbe dare punto piccolo ma visibile anche per zero


## Esercizio 5.3: Shape Manual ---------------------------------------
# Obiettivo: Assegnare forme manualmente
#
# Dataset: mpg (filtra solo 4 categorie di class)
# Visualizzazione: scatter plot (displ vs hwy, shape = class)
# Richieste:
# - Filtra class in c("compact", "suv", "midsize", "pickup")
# - Usa scale_shape_manual(values = c(16, 17, 15, 18))
# - Aumenta size = 3

## Soluzione 5.3: Shape Manual ---------------------------------------
mpg_4class <- filter(mpg, class %in% c("compact", "suv", "midsize", "pickup"))

ggplot(mpg_4class, aes(x = displ, y = hwy, shape = class)) +
  geom_point(size = 3, color = "steelblue") +
  ___(
    values = c(___, ___, ___, ___),
    name = "Categoria"
  ) +
  labs(title = "Forme personalizzate per 4 categorie")

# Note: Shape numbers: 16=cerchio, 17=triangolo, 15=quadrato, 18=diamante
# Max 6 forme distinguibili - oltre, usa color


## Esercizio 5.4: Filled Shapes (21-25) ------------------------------
# Obiettivo: Usare forme con bordo + riempimento
#
# Dataset: iris
# Visualizzazione: scatter plot (Sepal.Length vs Sepal.Width, shape e fill = Species)
# Richieste:
# - Usa scale_shape_manual(values = c(21, 22, 23))
# - Usa scale_fill_brewer(palette = "Set1")
# - Aggiungi color = "black" e size = 3 in geom_point()

## Soluzione 5.4: Filled Shapes (21-25) ------------------------------
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, shape = Species, fill = Species)) +
  geom_point(size = 3, color = "black") +
  ___(values = c(___, ___, ___), name = "Specie") +
  ___(palette = "Set1", name = "Specie") +
  labs(title = "Forme filled (21-25)",
       subtitle = "Bordo nero, riempimento colorato")

# Note: Shape 21-25 hanno bordo (color) + riempimento (fill) separati
# Permette controllo più fine


## Esercizio 5.5: Combinare Size e Color -----------------------------
# Obiettivo: Mappare 3 variabili (x, y, size, color)
#
# Dataset: mtcars
# Visualizzazione: scatter plot (wt vs mpg, size = hp, color = cyl)
# Richieste:
# - Usa scale_size_area(max_size = 10)
# - Converti cyl a factor
# - Usa scale_color_viridis_d()
# - Osserva: troppe informazioni?

## Soluzione 5.5: Combinare Size e Color -----------------------------
ggplot(mtcars, aes(x = wt, y = mpg, size = hp, color = factor(cyl))) +
  geom_point(alpha = 0.7) +
  ___(max_size = 10, name = "Cavalli") +
  ___(name = "Cilindri") +
  labs(title = "Tre variabili: peso, consumo, cavalli, cilindri",
       subtitle = "Size = hp, Color = cyl",
       x = "Peso (1000 lbs)",
       y = "Miglia per gallone")

# Note: Possibile mappare multiple variabili, ma rischio overload
# Max 3-4 estetiche → leggibilità


# ============================================================================
# PARTE 6: FORMATTAZIONE AVANZATA (5 esercizi)
# ============================================================================

## Esercizio 6.1: Formattazione Numeri -------------------------------
# Obiettivo: Usare scales::comma e number_format
#
# Dataset: economics
# Visualizzazione: line plot (date vs pop)
# Richieste:
# - Usa scale_y_continuous(labels = scales::comma)
# - Aggiungi titolo asse y: "Popolazione USA"
# - Osserva: separatori di migliaia

## Soluzione 6.1: Formattazione Numeri -------------------------------
ggplot(economics, aes(x = date, y = pop)) +
  geom_line(color = "steelblue", size = 1) +
  scale_y_continuous(
    labels = ___,
    name = "Popolazione USA"
  ) +
  labs(title = "Crescita popolazione USA",
       subtitle = "Labels con separatori di migliaia")

# Note: scales::comma aggiunge separatori (1,000,000)
# Per formato Europeo: number_format(big.mark = ".", decimal.mark = ",")


## Esercizio 6.2: Formattazione Percentuali --------------------------
# Obiettivo: Formattare valori come percentuali
#
# Dataset: crea data con proporzioni
# Visualizzazione: bar plot
# Richieste:
# - Crea data con categorie e proporzioni (0-1)
# - Usa scale_y_continuous(labels = scales::percent)
# - Osserva: conversione automatica × 100

## Soluzione 6.2: Formattazione Percentuali --------------------------
data_prop <- data.frame(
  category = c("A", "B", "C", "D"),
  proportion = c(0.15, 0.32, 0.28, 0.25)
)

ggplot(data_prop, aes(x = category, y = proportion)) +
  geom_col(fill = "steelblue") +
  scale_y_continuous(
    labels = ___,
    name = "Percentuale"
  ) +
  labs(title = "Distribuzione per categoria",
       subtitle = "Labels automaticamente × 100 e formattate")

# Note: scales::percent moltiplica automaticamente × 100 e aggiunge %
# Per dati già in percentuale (0-100): percent_format(scale = 1)


## Esercizio 6.3: Formattazione Valuta -------------------------------
# Obiettivo: Formattare come valuta
#
# Dataset: diamonds (media price per cut)
# Visualizzazione: bar plot
# Richieste:
# - Calcola media di price per cut
# - Usa scale_y_continuous(labels = scales::dollar)
# - Per Euro: usa dollar_format(prefix = "€ ")

## Soluzione 6.3: Formattazione Valuta -------------------------------
diamonds_avg <- diamonds %>%
  group_by(cut) %>%
  summarise(avg_price = mean(price))

# Con Dollar:
ggplot(diamonds_avg, aes(x = cut, y = avg_price)) +
  geom_col(fill = "steelblue") +
  scale_y_continuous(
    labels = ___,
    name = "Prezzo medio"
  ) +
  labs(title = "Prezzo medio per taglio (Dollar)")

# Con Euro:
ggplot(diamonds_avg, aes(x = cut, y = avg_price)) +
  geom_col(fill = "steelblue") +
  scale_y_continuous(
    labels = dollar_format(prefix = "___ ", big.mark = ".", decimal.mark = ","),
    name = "Prezzo medio"
  ) +
  labs(title = "Prezzo medio per taglio (Euro)")

# Note: dollar_format() permette customizzazione completa
# prefix, suffix, accuracy, big.mark, decimal.mark


## Esercizio 6.4: Formattazione Date ---------------------------------
# Obiettivo: Formattare etichette date
#
# Dataset: economics
# Visualizzazione: line plot (date vs unemploy)
# Richieste:
# - Usa scale_x_date(date_labels = "%b %Y", date_breaks = "5 years")
# - Prova anche: "%Y", "%d/%m/%Y", "%B %Y"
# - Ruota etichette con theme(axis.text.x = element_text(angle = 45, hjust = 1))

## Soluzione 6.4: Formattazione Date ---------------------------------
ggplot(economics, aes(x = date, y = unemploy)) +
  geom_line(color = "steelblue", size = 1) +
  scale_x_date(
    date_labels = "%b %Y",
    date_breaks = "5 years",
    name = "Data"
  ) +
  scale_y_continuous(
    labels = comma,
    name = "Disoccupati (migliaia)"
  ) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Disoccupazione USA nel tempo",
       subtitle = "Date formattate come Mese Anno")

# Note: date_labels usa formati strftime
# %Y = 2020, %y = 20, %m = 01, %b = Jan, %B = January, %d = 01
# date_breaks = "5 years", "3 months", "2 weeks", etc.


## Esercizio 6.5: Labels Custom con Funzione -------------------------
# Obiettivo: Creare formattatore personalizzato
#
# Dataset: mtcars
# Visualizzazione: scatter plot (wt vs mpg)
# Richieste:
# - Converti wt da 1000 lbs a tonnellate (× 0.5)
# - Usa scale_x_continuous(labels = ~ paste0(.x * 0.5, " ton"))
# - Aggiungi suffisso " km/L" all'asse y (mpg × 0.425)

## Soluzione 6.5: Labels Custom con Funzione -------------------------
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(size = 3, color = "steelblue") +
  scale_x_continuous(
    labels = ~ paste0(.x * 0.5, " ton"),
    name = "Peso"
  ) +
  scale_y_continuous(
    labels = ~ paste0(.x * 0.425, " km/L"),
    name = "Consumo"
  ) +
  labs(title = "Conversione unità custom",
       subtitle = "1000 lbs → tonnellate, mpg → km/L")

# Note: ~ function(.x) o \(x) per lambda
# Permette trasformazioni arbitrarie
# Alternativa: function(x) paste0(x * 0.5, " ton")


# ============================================================================
# ESERCIZI BONUS: INTEGRAZIONE
# ============================================================================

## Esercizio Bonus 1: Publication-Ready Plot -------------------------
# Obiettivo: Creare grafico completo publication-ready
#
# Dataset: diamonds (sample 5000)
# Richieste:
# - Scatter plot: carat vs price, color = cut, size = depth
# - scale_x_log10() con breaks custom
# - scale_y_log10() con labels = dollar
# - scale_color_brewer(palette = "Set1")
# - scale_size_area(max_size = 5)
# - Titoli, sottotitoli, caption
# - Theme minimal

## Bonus 1: Publication-Ready Plot -----------------------------------
diamonds_sample_bonus <- sample_n(diamonds, 5000)

ggplot(diamonds_sample_bonus, aes(x = carat, y = price, color = cut, size = depth)) +
  geom_point(alpha = 0.5) +
  scale_x_log10(
    breaks = c(0.3, 0.5, 1, 2, 3, 5),
    name = "Carati (scala log)"
  ) +
  scale_y_log10(
    labels = dollar,
    breaks = c(500, 1000, 2000, 5000, 10000, 20000),
    name = "Prezzo"
  ) +
  scale_color_brewer(
    palette = "Set1",
    name = "Taglio"
  ) +
  scale_size_area(
    max_size = 5,
    name = "Profondità\n(%)"
  ) +
  labs(
    title = "Relazione tra Carati, Prezzo, Taglio e Profondità",
    subtitle = "Diamanti campione (n=5000), scale logaritmiche",
    caption = "Fonte: ggplot2::diamonds dataset"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    legend.position = "right"
  )

# Note: Combina tutte le best practices
# - Log scales per range ampio
# - Labels formattati
# - ColorBrewer accessibile
# - scale_size_area per percezione corretta
# - Theme pulito
# - Titoli informativi


## Esercizio Bonus 2: Confronto Scale Colori -------------------------
# Obiettivo: Confrontare diverse palette sugli stessi dati
#
# Dataset: mpg
# Richieste:
# - Crea 4 versioni dello stesso scatter plot (displ vs hwy, color = class)
# - Versione A: default
# - Versione B: scale_color_brewer(palette = "Set1")
# - Versione C: scale_color_viridis_d()
# - Versione D: scale_color_grey()
# - Quale funziona meglio per daltonici?

## Bonus 2: Confronto Scale Colori -----------------------------------
# Versione A (default):
p_base <- ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
  geom_point(size = 2) +
  labs(x = "Cilindrata (L)", y = "Consumo autostrada (mpg)")

p_a <- p_base + labs(title = "A: Default (hue)")

# Versione B (ColorBrewer):
p_b <- p_base + 
  scale_color_brewer(palette = "Set1") +
  labs(title = "B: ColorBrewer Set1")

# Versione C (Viridis):
p_c <- p_base + 
  scale_color_viridis_d() +
  labs(title = "C: Viridis D")

# Versione D (Greyscale):
p_d <- p_base + 
  scale_color_grey() +
  labs(title = "D: Greyscale")

# Visualizza tutti (richiede patchwork o gridExtra):
# library(patchwork)
# (p_a | p_b) / (p_c | p_d)

p_a
p_b
p_c
p_d

# Note: Viridis C (o E - cividis) è migliore per daltonici
# Set1 buona per stampa a colori
# Grey per stampa B&W


## Esercizio Bonus 3: Multi-Scale Complex Plot -----------------------
# Obiettivo: Combinare multiple scale in un grafico complesso
#
# Dataset: economics
# Richieste:
# - Line plot: date vs unemploy
# - Secondo asse con popolazione
# - Formattazione date sull'asse x
# - Formattazione comma su assi y
# - Colori custom per le due linee
# - Legenda posizionata in basso
#
# Suggerimento: usa due geom_line() con scale diverse
# (questo è avanzato - richiede reshape dei dati o trick con sec.axis)

## Bonus 3: Multi-Scale Complex Plot ---------------------------------
# Questo richiede manipolazione dei dati
# Approccio: normalizza le due variabili su scale simili

economics_scaled <- economics %>%
  mutate(
    unemploy_scaled = (unemploy - min(unemploy)) / (max(unemploy) - min(unemploy)) * 100000 + 200000,
    pop_scaled = pop
  )

ggplot(economics_scaled, aes(x = date)) +
  geom_line(aes(y = unemploy_scaled, color = "Disoccupati"), size = 1) +
  geom_line(aes(y = pop_scaled, color = "Popolazione"), size = 1) +
  scale_x_date(
    date_labels = "%Y",
    date_breaks = "10 years"
  ) +
  scale_y_continuous(
    labels = comma,
    name = "Valori (scale diverse)"
  ) +
  scale_color_manual(
    name = "Variabile",
    values = c("Disoccupati" = "#E41A1C", "Popolazione" = "#377EB8")
  ) +
  labs(
    title = "Disoccupazione e Popolazione USA",
    subtitle = "Due variabili con scale diverse (normalizzate per visualizzazione)",
    x = "Anno"
  ) +
  theme_minimal() +
  theme(legend.position = "bottom")

# Note: Due assi y separati sono controversi (misleading)
# Meglio: normalizzare, usare facets, o grafici separati
# Se proprio necessario: sec_axis() con trasformazione esplicita


# ============================================================================
# FINE ESERCIZI
# ============================================================================
# 
# Completa gli esercizi sopra per praticare scale e trasformazioni!
# Confronta poi con le soluzioni.
#
# ============================================================================
# ============================================================================
