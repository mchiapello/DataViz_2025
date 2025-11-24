# ============================================================================
# ESERCIZI: Temi e Personalizzazione in ggplot2
# ============================================================================
#
# Questo file contiene 29 esercizi pratici per imparare a personalizzare
# i grafici ggplot2 usando temi, element_*() functions, labs() e ggsave().
#
# ISTRUZIONI:
# 1. Leggi attentamente l'obiettivo di ogni esercizio
# 2. Scrivi il codice negli spazi vuoti indicati
# 3. Esegui il codice per vedere il risultato
# 4. Confronta con il file delle soluzioni se necessario
#
# STRUTTURA:
# - Parte 1: Temi Predefiniti (5 esercizi)
# - Parte 2: Funzione theme() Basics (5 esercizi)
# - Parte 3: Funzioni element_*() (5 esercizi)
# - Parte 4: Labels e Titoli (5 esercizi)
# - Parte 5: Personalizzazione Legende (4 esercizi)
# - Parte 6: Temi Custom e Export (5 esercizi)
#
# ============================================================================

# Setup: Carica pacchetti e dati
library(ggplot2)
library(dplyr)

# Carica dataset built-in
data(mpg)
data(diamonds)
data(economics)
data(faithful)
data(mtcars)
data(iris)

# ============================================================================
# PARTE 1: TEMI PREDEFINITI
# ============================================================================

## Esercizio 1.1: Confrontare Theme Gray e Minimal
## Obiettivo: Crea due scatter plot identici del dataset mpg (displ vs hwy),
##            uno con theme_gray() e uno con theme_minimal(), per vedere le differenze.




## Esercizio 1.2: Theme Classic per Pubblicazioni
## Obiettivo: Crea un boxplot di hwy per classe di veicolo usando theme_classic().
##            Questo tema è ideale per pubblicazioni scientifiche.




## Esercizio 1.3: Theme BW per Stampa
## Obiettivo: Crea un grafico a barre del conteggio di veicoli per classe usando
##            theme_bw() con base_size = 14 per renderlo leggibile in stampa.




## Esercizio 1.4: Theme Void per Visualizzazioni Minimali
## Obiettivo: Crea uno scatter plot di Sepal.Length vs Sepal.Width dal dataset iris
##            usando theme_void() per rimuovere tutti gli elementi non-dati.




## Esercizio 1.5: Theme Dark per Presentazioni
## Obiettivo: Crea un density plot di carat dal dataset diamonds usando theme_dark()
##            con fill = "cyan" e alpha = 0.5.




# ============================================================================
# PARTE 2: FUNZIONE theme() BASICS
# ============================================================================

## Esercizio 2.1: Modificare Background del Plot
## Obiettivo: Parti da theme_minimal() e modifica plot.background per avere
##            fill = "lightblue" e panel.background con fill = "white".




## Esercizio 2.2: Personalizzare Panel Border
## Obiettivo: Crea uno scatter plot con theme_minimal() e aggiungi un bordo nero
##            spesso al panel usando panel.border.




## Esercizio 2.3: Rimuovere Griglia Minore
## Obiettivo: Crea un line plot di unemploy nel tempo dal dataset economics,
##            usa theme_minimal() e rimuovi solo panel.grid.minor.




## Esercizio 2.4: Modificare Solo Griglia Verticale
## Obiettivo: Crea un bar chart di class da mpg, rimuovi panel.grid.major.x
##            ma mantieni panel.grid.major.y (utile per leggere i valori).




## Esercizio 2.5: Personalizzare Colore Griglia
## Obiettivo: Crea uno scatter plot e modifica panel.grid.major per avere
##            color = "red" e linetype = "dashed".




# ============================================================================
# PARTE 3: FUNZIONI element_*()
# ============================================================================

## Esercizio 3.1: Ruotare Labels Asse X
## Obiettivo: Crea un bar chart di manufacturer da mpg. Le etichette sono troppo lunghe:
##            ruotale di 45 gradi usando element_text() con angle = 45 e hjust = 1.




## Esercizio 3.2: Personalizzare Titolo Plot
## Obiettivo: Crea uno scatter plot e aggiungi un titolo "Mio Grafico".
##            Usa element_text() per renderlo size = 20, face = "bold", color = "navy".




## Esercizio 3.3: Modificare Aspetto Assi
## Obiettivo: Crea uno scatter plot con axis.line neri e spessi (size = 1)
##            usando element_line(), e rimuovi la griglia con element_blank().




## Esercizio 3.4: Personalizzare Background Legenda
## Obiettivo: Crea uno scatter plot con color = class. Personalizza legend.background
##            con fill = "gray95", color = "black", size = 0.5 usando element_rect().




## Esercizio 3.5: Rimuovere Tick Marks
## Obiettivo: Crea un grafico qualsiasi e rimuovi completamente i tick marks
##            degli assi usando element_blank() per axis.ticks.




# ============================================================================
# PARTE 4: LABELS E TITOLI
# ============================================================================

## Esercizio 4.1: Labels Complete con labs()
## Obiettivo: Crea uno scatter plot di displ vs hwy colorato per class.
##            Aggiungi title, subtitle, caption, e labels per x, y e color usando labs().




## Esercizio 4.2: Rimuovere Titolo Asse X
## Obiettivo: Crea un bar chart di class da mpg e rimuovi il titolo dell'asse X
##            usando x = NULL in labs().




## Esercizio 4.3: Multi-line Title
## Obiettivo: Crea uno scatter plot e aggiungi un titolo su due righe usando
##            "\n" in labs(title = "Riga 1\nRiga 2").




## Esercizio 4.4: Formattare Caption e Subtitle
## Obiettivo: Crea un line plot di economics e aggiungi caption allineato a destra
##            e subtitle grigio usando element_text() con hjust e color appropriati.




## Esercizio 4.5: Rimuovere Titolo Legenda
## Obiettivo: Crea uno scatter plot con color mapping e rimuovi il titolo della
##            legenda usando color = NULL in labs().




# ============================================================================
# PARTE 5: PERSONALIZZAZIONE LEGENDE
# ============================================================================

## Esercizio 5.1: Posizionare Legenda in Basso
## Obiettivo: Crea uno scatter plot con color mapping e sposta la legenda
##            in basso usando legend.position = "bottom".




## Esercizio 5.2: Legenda con Coordinate Precise
## Obiettivo: Posiziona la legenda all'interno del grafico usando coordinate
##            (es. c(0.85, 0.25)) e aggiungi un background bianco con bordo.




## Esercizio 5.3: Layout Orizzontale Legenda
## Obiettivo: Metti la legenda in basso con layout orizzontale usando
##            legend.direction = "horizontal".




## Esercizio 5.4: Personalizzare Testo Legenda
## Obiettivo: Modifica legend.title per essere bold e size = 14,
##            e legend.text per essere italic e size = 11.




# ============================================================================
# PARTE 6: TEMI CUSTOM E EXPORT
# ============================================================================

## Esercizio 6.1: Creare Tema Riutilizzabile
## Obiettivo: Crea una funzione theme_mio() che parte da theme_minimal() e
##            personalizza almeno 3 elementi (es. plot.title, panel.grid, legend.position).




## Esercizio 6.2: Applicare Tema Custom
## Obiettivo: Usa il tuo theme_mio() creato nell'esercizio precedente su un nuovo grafico.




## Esercizio 6.3: Theme Set Globale
## Obiettivo: Imposta theme_minimal() come tema di default per tutta la sessione
##            usando theme_set(), poi crea un grafico per verificare.




## Esercizio 6.4: Salvare con ggsave() - Alta Risoluzione
## Obiettivo: Crea un plot e salvalo come "plot_highres.png" con width = 10,
##            height = 6, dpi = 300 (qualità pubblicazione).




## Esercizio 6.5: Salvare in Formati Multipli
## Obiettivo: Crea un plot e salvalo in tre formati: PNG (web, 72 dpi),
##            PDF (vettoriale), e PNG (pubblicazione, 300 dpi).




# ============================================================================
# FINE ESERCIZI
# ============================================================================
#
# Ottimo lavoro! 🎉
#
# Hai completato tutti e 30 gli esercizi su temi e personalizzazione.
# Ora dovresti essere in grado di:
# - Scegliere il tema appropriato per ogni contesto
# - Personalizzare ogni aspetto visivo con theme() ed element_*()
# - Creare annotazioni complete e professionali
# - Gestire legende in modo avanzato
# - Creare temi riutilizzabili
# - Esportare grafici in alta qualità
#
# PROSSIMI PASSI:
# 1. Confronta le tue soluzioni con il file *_SOLUTIONS.R
# 2. Sperimenta con combinazioni diverse di parametri
# 3. Crea il tuo tema personale per progetti futuri
# 4. Esplora pacchetti esterni come ggthemes e hrbrthemes
#
# ============================================================================
