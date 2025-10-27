# ============================================================================
# SCALE E TRASFORMAZIONI - ESERCIZI PRATICI
# ============================================================================
# Corso: REVELO Training - Data Viz 2025
# Modulo: 08 - Scale e Trasformazioni
# 
# Obiettivi:
# - Comprendere e applicare scale continue e discrete
# - Utilizzare trasformazioni (log, sqrt, reverse)
# - Personalizzare palette di colori accessibili
# - Controllare breaks, labels, e limiti
# - Formattare assi con il package scales
#
# Istruzioni:
# - Completa ogni esercizio nell'ordine suggerito
# - Osserva come le scale influenzano la percezione
# - Confronta i risultati con le soluzioni
# ============================================================================

# Setup -------------------------------------------------------------------
library(ggplot2)
library(scales)      # Per formattazione labels
library(dplyr)       # Per manipolazione dati

# Carica datasets
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

# Il tuo codice qui:



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

# Grafico A (scale limits):


# Grafico B (coord zoom):


# Domanda: Perché i boxplot sono diversi?


## Esercizio 1.3: Expand e Padding -----------------------------------
# Obiettivo: Controllare lo spazio ai bordi degli assi
#
# Dataset: economics
# Visualizzazione: line plot (date vs unemploy)
# Richieste:
# - Rimuovi completamente il padding su entrambi gli assi
#   (usa expansion(mult = c(0, 0)))
# - Nota come le linee toccano i bordi

# Il tuo codice qui:



## Esercizio 1.4: Breaks Custom --------------------------------------
# Obiettivo: Definire posizioni specifiche per i tick marks
#
# Dataset: mtcars
# Visualizzazione: scatter plot (wt vs mpg)
# Richieste:
# - Imposta breaks sull'asse x a: 2, 3, 4, 5
# - Imposta breaks sull'asse y ogni 5 unità (10, 15, 20, 25, 30)
# - Aggiungi titoli descrittivi

# Il tuo codice qui:



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

# Il tuo codice qui:
diamonds_si1 <- filter(diamonds, clarity == "SI1")




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

# Il tuo codice qui:



## Esercizio 2.2: Log vs Linear --------------------------------------
# Obiettivo: Confrontare scala log vs lineare
#
# Dataset: economics
# Visualizzazione: DUE line plots (date vs pop)
# Richieste:
# - Grafico A: scala y lineare
# - Grafico B: scala y log10
# - Osserva: quale mostra meglio il trend di crescita?

# Grafico A (lineare):


# Grafico B (log):



## Esercizio 2.3: Trasformazione Sqrt --------------------------------
# Obiettivo: Usare trasformazione radice quadrata
#
# Dataset: diamonds
# Visualizzazione: histogram (price)
# Richieste:
# - Crea histogram con bins = 50
# - Applica scale_y_sqrt() all'asse dei conteggi
# - Osserva: distribuzione più simmetrica?

# Il tuo codice qui:



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

# Il tuo codice qui:
mtcars_named <- mtcars %>% mutate(car = rownames(mtcars))




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

# Il tuo codice qui:




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

# Il tuo codice qui:



## Esercizio 3.2: Viridis Discrete -----------------------------------
# Obiettivo: Usare palette viridis per categorie
#
# Dataset: mpg
# Visualizzazione: boxplot (class vs hwy, fill = class)
# Richieste:
# - Usa scale_fill_viridis_d(option = "D")
# - Rimuovi la legenda (guide = "none")
# - Osserva: colori distinguibili?

# Il tuo codice qui:



## Esercizio 3.3: Manual Colors --------------------------------------
# Obiettivo: Definire colori manualmente
#
# Dataset: mpg (filtra solo drv in c("f", "r", "4"))
# Visualizzazione: bar plot (class, fill = drv)
# Richieste:
# - Definisci colori: "f" = "#E41A1C", "r" = "#377EB8", "4" = "#4DAF4A"
# - Usa scale_fill_manual(values = ...)
# - Aggiungi labels: "f" = "Trazione anteriore", "r" = "Posteriore", "4" = "4x4"

# Il tuo codice qui:
mpg_drv <- filter(mpg, drv %in% c("f", "r", "4"))




## Esercizio 3.4: ColorBrewer con Direction --------------------------
# Obiettivo: Invertire palette
#
# Dataset: diamonds (sample 1000 righe)
# Visualizzazione: scatter plot (carat vs price, color = cut)
# Richieste:
# - Usa scale_color_brewer(palette = "Spectral", direction = -1)
# - Aggiungi alpha = 0.6
# - Osserva differenza tra direction = 1 e -1

# Il tuo codice qui:
diamonds_sample <- sample_n(diamonds, 1000)




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

# Il tuo codice qui:




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

# Il tuo codice qui:
diamonds_sample2 <- sample_n(diamonds, 5000)




## Esercizio 4.2: Viridis Continuous ---------------------------------
# Obiettivo: Usare viridis per valori continui
#
# Dataset: faithfuld (built-in density dataset)
# Visualizzazione: tile plot (waiting vs eruptions, fill = density)
# Richieste:
# - Usa geom_tile()
# - scale_fill_viridis_c(option = "C") # plasma
# - Osserva: percezione uniforme dei valori

# Il tuo codice qui:
data(faithfuld)




## Esercizio 4.3: Diverging Scale (Gradient2) ------------------------
# Obiettivo: Usare scala divergente con midpoint
#
# Dataset: mtcars (centra mpg sottraendo la media)
# Visualizzazione: bar plot (rownames vs mpg_centered, fill = mpg_centered)
# Richieste:
# - Calcola mpg_centered = mpg - mean(mpg)
# - Usa scale_fill_gradient2(low = "red", mid = "white", high = "blue", midpoint = 0)
# - Mostra deviazioni dalla media

# Il tuo codice qui:
mtcars_centered <- mtcars %>% 
  mutate(car = rownames(mtcars),
         mpg_centered = mpg - mean(mpg))




## Esercizio 4.4: Gradientn (Multiple Colors) ------------------------
# Obiettivo: Creare gradient con più colori
#
# Dataset: diamonds (sample 5000)
# Visualizzazione: scatter plot (carat vs price, color = price)
# Richieste:
# - Usa scale_color_gradientn(colors = c("blue", "cyan", "yellow", "orange", "red"))
# - Aggiungi alpha = 0.6
# - Osserva: transizioni tra colori

# Il tuo codice qui:




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

# Il tuo codice qui:




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

# Grafico A (radius):


# Grafico B (area - preferito):



## Esercizio 5.2: Size_Area con Zero ---------------------------------
# Obiettivo: Verificare che zero → zero area
#
# Dataset: crea dataset custom con alcuni valori a zero
# Visualizzazione: scatter plot con size
# Richieste:
# - Crea data con x, y, size (alcuni size = 0)
# - Usa scale_size_area()
# - Verifica che punti con size = 0 siano invisibili

# Il tuo codice qui:
data_with_zeros <- data.frame(
  x = 1:10,
  y = 1:10,
  size_val = c(0, 5, 10, 0, 15, 20, 0, 25, 30, 35)
)




## Esercizio 5.3: Shape Manual ---------------------------------------
# Obiettivo: Assegnare forme manualmente
#
# Dataset: mpg (filtra solo 4 categorie di class)
# Visualizzazione: scatter plot (displ vs hwy, shape = class)
# Richieste:
# - Filtra class in c("compact", "suv", "midsize", "pickup")
# - Usa scale_shape_manual(values = c(16, 17, 15, 18))
# - Aumenta size = 3

# Il tuo codice qui:
mpg_4class <- filter(mpg, class %in% c("compact", "suv", "midsize", "pickup"))




## Esercizio 5.4: Filled Shapes (21-25) ------------------------------
# Obiettivo: Usare forme con bordo + riempimento
#
# Dataset: iris
# Visualizzazione: scatter plot (Sepal.Length vs Sepal.Width, shape e fill = Species)
# Richieste:
# - Usa scale_shape_manual(values = c(21, 22, 23))
# - Usa scale_fill_brewer(palette = "Set1")
# - Aggiungi color = "black" e size = 3 in geom_point()

# Il tuo codice qui:




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

# Il tuo codice qui:




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

# Il tuo codice qui:



## Esercizio 6.2: Formattazione Percentuali --------------------------
# Obiettivo: Formattare valori come percentuali
#
# Dataset: crea data con proporzioni
# Visualizzazione: bar plot
# Richieste:
# - Crea data con categorie e proporzioni (0-1)
# - Usa scale_y_continuous(labels = scales::percent)
# - Osserva: conversione automatica × 100

# Il tuo codice qui:
data_prop <- data.frame(
  category = c("A", "B", "C", "D"),
  proportion = c(0.15, 0.32, 0.28, 0.25)
)




## Esercizio 6.3: Formattazione Valuta -------------------------------
# Obiettivo: Formattare come valuta
#
# Dataset: diamonds (media price per cut)
# Visualizzazione: bar plot
# Richieste:
# - Calcola media di price per cut
# - Usa scale_y_continuous(labels = scales::dollar)
# - Per Euro: usa dollar_format(prefix = "€ ")

# Il tuo codice qui:
diamonds_avg <- diamonds %>%
  group_by(cut) %>%
  summarise(avg_price = mean(price))




## Esercizio 6.4: Formattazione Date ---------------------------------
# Obiettivo: Formattare etichette date
#
# Dataset: economics
# Visualizzazione: line plot (date vs unemploy)
# Richieste:
# - Usa scale_x_date(date_labels = "%b %Y", date_breaks = "5 years")
# - Prova anche: "%Y", "%d/%m/%Y", "%B %Y"
# - Ruota etichette con theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Il tuo codice qui:



## Esercizio 6.5: Labels Custom con Funzione -------------------------
# Obiettivo: Creare formattatore personalizzato
#
# Dataset: mtcars
# Visualizzazione: scatter plot (wt vs mpg)
# Richieste:
# - Converti wt da 1000 lbs a tonnellate (× 0.5)
# - Usa scale_x_continuous(labels = ~ paste0(.x * 0.5, " ton"))
# - Aggiungi suffisso " km/L" all'asse y (mpg × 0.425)

# Il tuo codice qui:




# ============================================================================
# ESERCIZI BONUS: INTEGRAZIONE
# ============================================================================

## Bonus 1: Publication-Ready Plot -----------------------------------
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

# Il tuo codice qui:



## Bonus 2: Confronto Scale Colori -----------------------------------
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

# Versione A:


# Versione B:


# Versione C:


# Versione D:



## Bonus 3: Multi-Scale Complex Plot ---------------------------------
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

# Suggerimento: usa due geom_line() con scale diverse
# (questo è avanzato - richiede reshape dei dati o trick con sec.axis)

# Il tuo codice qui:



# ============================================================================
# FINE ESERCIZI
# ============================================================================
# Ottimo lavoro! Hai completato tutti gli esercizi sulle scale.
# 
# Recap concetti chiave:
# - Scale mappano dati → proprietà visive
# - coord_cartesian() per zoom (non scale limits)
# - scale_*_log10() per trasformazioni
# - ColorBrewer e Viridis per accessibilità
# - scale_size_area() per percezione corretta
# - Package scales per formattazione
#
# Prossimi passi:
# - Confronta con le soluzioni
# - Sperimenta con tuoi dati
# - Combina con themes per grafici completi
# ============================================================================
