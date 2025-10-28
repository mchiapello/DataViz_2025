# ============================================================================
# SOLUZIONI: Temi e Personalizzazione in ggplot2
# ============================================================================
#
# Questo file contiene le soluzioni complete per tutti i 30 esercizi.
# Ogni soluzione include:
# - La domanda originale dell'esercizio
# - Codice completo e funzionante
# - Commenti esplicativi sulle scelte fatte
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

## Soluzione 1.1:
# Theme gray (default) - sfondo grigio
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = class)) +
  labs(title = "Con theme_gray()") +
  theme_gray()

# Theme minimal - sfondo bianco, griglia sottile
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = class)) +
  labs(title = "Con theme_minimal()") +
  theme_minimal()

# Il gray background fa "pop" i colori, il minimal è più pulito e moderno


## Esercizio 1.2: Theme Classic per Pubblicazioni
## Obiettivo: Crea un boxplot di hwy per classe di veicolo usando theme_classic().
##            Questo tema è ideale per pubblicazioni scientifiche.

## Soluzione 1.2:
ggplot(mpg, aes(x = class, y = hwy)) +
  geom_boxplot(fill = "steelblue", alpha = 0.7) +
  labs(
    title = "Consumo Autostrada per Classe",
    x = "Classe Veicolo",
    y = "Miglia per Gallone (Highway)"
  ) +
  theme_classic()  # No griglia, assi tradizionali - perfetto per paper


## Esercizio 1.3: Theme BW per Stampa
## Obiettivo: Crea un grafico a barre del conteggio di veicoli per classe usando
##            theme_bw() con base_size = 14 per renderlo leggibile in stampa.

## Soluzione 1.3:
ggplot(mpg, aes(x = class)) +
  geom_bar(fill = "gray40") +
  labs(
    title = "Distribuzione Classi di Veicoli",
    x = "Classe",
    y = "Conteggio"
  ) +
  theme_bw(base_size = 14)  # Black & White, testo grande per stampa


## Esercizio 1.4: Theme Void per Visualizzazioni Minimali
## Obiettivo: Crea uno scatter plot di Sepal.Length vs Sepal.Width dal dataset iris
##            usando theme_void() per rimuovere tutti gli elementi non-dati.

## Soluzione 1.4:
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(size = 3, alpha = 0.7) +
  theme_void()  # Rimuove tutto - solo dati puri, utile per mappe o network


## Esercizio 1.5: Theme Dark per Presentazioni
## Obiettivo: Crea un density plot di carat dal dataset diamonds usando theme_dark()
##            con fill = "cyan" e alpha = 0.5.

## Soluzione 1.5:
ggplot(diamonds, aes(x = carat)) +
  geom_density(fill = "cyan", alpha = 0.5, color = "white") +
  labs(
    title = "Distribuzione Peso Diamanti",
    x = "Carati",
    y = "Densità"
  ) +
  theme_dark()  # Sfondo scuro - riduce affaticamento in presentazioni buie


# ============================================================================
# PARTE 2: FUNZIONE theme() BASICS
# ============================================================================

## Esercizio 2.1: Modificare Background del Plot
## Obiettivo: Parti da theme_minimal() e modifica plot.background per avere
##            fill = "lightblue" e panel.background con fill = "white".

## Soluzione 2.1:
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = class)) +
  labs(title = "Background Personalizzati") +
  theme_minimal() +
  theme(
    plot.background = element_rect(fill = "lightblue"),  # Intero plot
    panel.background = element_rect(fill = "white")       # Solo area dati
  )

# plot.background include tutto (titolo, legenda), panel solo i dati


## Esercizio 2.2: Personalizzare Panel Border
## Obiettivo: Crea uno scatter plot con theme_minimal() e aggiungi un bordo nero
##            spesso al panel usando panel.border.

## Soluzione 2.2:
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = class)) +
  theme_minimal() +
  theme(
    panel.border = element_rect(
      color = "black",
      fill = NA,  # NA = trasparente, non riempie
      size = 2
    )
  )

# fill = NA è fondamentale per non coprire i dati!


## Esercizio 2.3: Rimuovere Griglia Minore
## Obiettivo: Crea un line plot di unemploy nel tempo dal dataset economics,
##            usa theme_minimal() e rimuovi solo panel.grid.minor.

## Soluzione 2.3:
ggplot(economics, aes(x = date, y = unemploy/1000)) +
  geom_line(color = "steelblue", size = 1) +
  labs(
    title = "Disoccupazione USA nel Tempo",
    x = "Anno",
    y = "Disoccupati (migliaia)"
  ) +
  theme_minimal() +
  theme(
    panel.grid.minor = element_blank()  # Rimuove solo griglia minore
  )

# Griglia maggiore aiuta a leggere valori, minore spesso solo rumore visivo


## Esercizio 2.4: Modificare Solo Griglia Verticale
## Obiettivo: Crea un bar chart di class da mpg, rimuovi panel.grid.major.x
##            ma mantieni panel.grid.major.y (utile per leggere i valori).

## Soluzione 2.4:
ggplot(mpg, aes(x = class)) +
  geom_bar(fill = "steelblue") +
  labs(
    title = "Conteggio per Classe",
    x = "Classe Veicolo",
    y = "Conteggio"
  ) +
  theme_minimal() +
  theme(
    panel.grid.major.x = element_blank(),  # Rimuove griglia verticale
    panel.grid.minor = element_blank()      # Rimuove tutta la minore
  )

# Per bar charts verticali, solo le linee orizzontali sono utili


## Esercizio 2.5: Personalizzare Colore Griglia
## Obiettivo: Crea uno scatter plot e modifica panel.grid.major per avere
##            color = "red" e linetype = "dashed".

## Soluzione 2.5:
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  theme_minimal() +
  theme(
    panel.grid.major = element_line(
      color = "red",
      linetype = "dashed",
      size = 0.5
    ),
    panel.grid.minor = element_blank()
  )

# Utile per enfatizzare o de-enfatizzare la griglia secondo necessità


# ============================================================================
# PARTE 3: FUNZIONI element_*()
# ============================================================================

## Esercizio 3.1: Ruotare Labels Asse X
## Obiettivo: Crea un bar chart di manufacturer da mpg. Le etichette sono troppo lunghe:
##            ruotale di 45 gradi usando element_text() con angle = 45 e hjust = 1.

## Soluzione 3.1:
ggplot(mpg, aes(x = manufacturer)) +
  geom_bar(fill = "steelblue") +
  labs(
    title = "Veicoli per Produttore",
    x = "Produttore",
    y = "Conteggio"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(
      angle = 45,   # Rotazione 45 gradi
      hjust = 1,    # Allineamento orizzontale a destra
      vjust = 1     # Allineamento verticale in alto (opzionale)
    )
  )

# hjust = 1 allinea il testo a destra del punto di ancoraggio - essenziale con angle


## Esercizio 3.2: Personalizzare Titolo Plot
## Obiettivo: Crea uno scatter plot e aggiungi un titolo "Mio Grafico".
##            Usa element_text() per renderlo size = 20, face = "bold", color = "navy".

## Soluzione 3.2:
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = class)) +
  labs(title = "Mio Grafico") +
  theme_minimal() +
  theme(
    plot.title = element_text(
      size = 20,
      face = "bold",
      color = "navy",
      hjust = 0.5  # Opzionale: centra il titolo
    )
  )

# face può essere "plain", "bold", "italic", o "bold.italic"


## Esercizio 3.3: Modificare Aspetto Assi
## Obiettivo: Crea uno scatter plot con axis.line neri e spessi (size = 1)
##            usando element_line(), e rimuovi la griglia con element_blank().

## Soluzione 3.3:
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = class)) +
  labs(title = "Assi Personalizzati") +
  theme_minimal() +
  theme(
    axis.line = element_line(
      color = "black",
      size = 1
    ),
    panel.grid = element_blank()  # Rimuove tutta la griglia
  )

# Combinazione comune per look pulito e classico


## Esercizio 3.4: Personalizzare Background Legenda
## Obiettivo: Crea uno scatter plot con color = class. Personalizza legend.background
##            con fill = "gray95", color = "black", size = 0.5 usando element_rect().

## Soluzione 3.4:
ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
  geom_point(size = 3) +
  labs(title = "Legenda Personalizzata") +
  theme_minimal() +
  theme(
    legend.background = element_rect(
      fill = "gray95",
      color = "black",
      size = 0.5
    ),
    legend.key = element_rect(fill = "white")  # Background delle chiavi
  )

# Utile quando posizioni la legenda sopra i dati per renderla distinguibile


## Esercizio 3.5: Rimuovere Tick Marks
## Obiettivo: Crea un grafico qualsiasi e rimuovi completamente i tick marks
##            degli assi usando element_blank() per axis.ticks.

## Soluzione 3.5:
ggplot(mpg, aes(x = class, y = hwy)) +
  geom_boxplot(fill = "steelblue") +
  labs(title = "Senza Tick Marks") +
  theme_minimal() +
  theme(
    axis.ticks = element_blank()  # Rimuove tutti i tick marks
  )

# Combinato con theme_minimal() crea un look molto pulito


# ============================================================================
# PARTE 4: LABELS E TITOLI
# ============================================================================

## Esercizio 4.1: Labels Complete con labs()
## Obiettivo: Crea uno scatter plot di displ vs hwy colorato per class.
##            Aggiungi title, subtitle, caption, e labels per x, y e color usando labs().

## Soluzione 4.1:
ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
  geom_point(size = 3, alpha = 0.7) +
  labs(
    title = "Relazione tra Cilindrata e Consumo",
    subtitle = "Dati EPA per veicoli 1999-2008",
    caption = "Fonte: United States Environmental Protection Agency",
    x = "Cilindrata Motore (litri)",
    y = "Consumo Autostrada (mpg)",
    color = "Classe\nVeicolo"
  ) +
  theme_minimal()

# labs() è il modo più completo per aggiungere annotazioni


## Esercizio 4.2: Rimuovere Titolo Asse X
## Obiettivo: Crea un bar chart di class da mpg e rimuovi il titolo dell'asse X
##            usando x = NULL in labs().

## Soluzione 4.2:
ggplot(mpg, aes(x = class)) +
  geom_bar(fill = "steelblue") +
  labs(
    title = "Distribuzione Classi",
    x = NULL,  # Rimuove titolo asse X
    y = "Conteggio"
  ) +
  theme_minimal()

# x = NULL è diverso da x = "" (stringa vuota) - rimuove completamente


## Esercizio 4.3: Multi-line Title
## Obiettivo: Crea uno scatter plot e aggiungi un titolo su due righe usando
##            "\n" in labs(title = "Riga 1\nRiga 2").

## Soluzione 4.3:
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = class)) +
  labs(
    title = "Consumo Carburante\nvs Cilindrata Motore",
    x = "Cilindrata (litri)",
    y = "MPG Highway"
  ) +
  theme_minimal()

# \n inserisce un "a capo" - utile per titoli lunghi


## Esercizio 4.4: Formattare Caption e Subtitle
## Obiettivo: Crea un line plot di economics e aggiungi caption allineato a destra
##            e subtitle grigio usando element_text() con hjust e color appropriati.

## Soluzione 4.4:
ggplot(economics, aes(x = date, y = unemploy/1000)) +
  geom_line(color = "steelblue", size = 1) +
  labs(
    title = "Disoccupazione USA",
    subtitle = "Andamento storico 1967-2015",
    caption = "Dati: Federal Reserve Economic Data",
    x = "Anno",
    y = "Disoccupati (migliaia)"
  ) +
  theme_minimal() +
  theme(
    plot.subtitle = element_text(
      color = "gray40",
      size = 12
    ),
    plot.caption = element_text(
      hjust = 1,      # Allinea a destra (1 = right, 0 = left, 0.5 = center)
      face = "italic",
      size = 9
    )
  )

# Convention: caption a destra, subtitle grigio per gerarchia visiva


## Esercizio 4.5: Rimuovere Titolo Legenda
## Obiettivo: Crea uno scatter plot con color mapping e rimuovi il titolo della
##            legenda usando color = NULL in labs().

## Soluzione 4.5:
ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
  geom_point(size = 3) +
  labs(
    title = "Consumo vs Cilindrata",
    x = "Cilindrata (L)",
    y = "MPG Highway",
    color = NULL  # Rimuove titolo legenda
  ) +
  theme_minimal()

# Utile quando il mapping è self-explanatory


# ============================================================================
# PARTE 5: PERSONALIZZAZIONE LEGENDE
# ============================================================================

## Esercizio 5.1: Posizionare Legenda in Basso
## Obiettivo: Crea uno scatter plot con color mapping e sposta la legenda
##            in basso usando legend.position = "bottom".

## Soluzione 5.1:
ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
  geom_point(size = 3) +
  labs(
    title = "Consumo vs Cilindrata",
    color = "Classe"
  ) +
  theme_minimal() +
  theme(
    legend.position = "bottom"  # "top", "bottom", "left", "right", "none"
  )

# Posizione bottom è ideale per grafici larghi


## Esercizio 5.2: Legenda con Coordinate Precise
## Obiettivo: Posiziona la legenda all'interno del grafico usando coordinate
##            (es. c(0.85, 0.25)) e aggiungi un background bianco con bordo.

## Soluzione 5.2:
ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
  geom_point(size = 3, alpha = 0.6) +
  labs(title = "Legenda Interna") +
  theme_minimal() +
  theme(
    legend.position = c(0.85, 0.25),  # Coordinate (x, y) da 0 a 1
    legend.background = element_rect(
      fill = "white",
      color = "black",
      size = 0.5
    )
  )

# c(0, 0) = bottom-left, c(1, 1) = top-right


## Esercizio 5.3: Layout Orizzontale Legenda
## Obiettivo: Metti la legenda in basso con layout orizzontale usando
##            legend.direction = "horizontal".

## Soluzione 5.3:
ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
  geom_point(size = 3) +
  labs(color = "Classe Veicolo") +
  theme_minimal() +
  theme(
    legend.position = "bottom",
    legend.direction = "horizontal"  # "vertical" è il default
  )

# Orizzontale salva spazio verticale - ottimo per presentazioni


## Esercizio 5.4: Personalizzare Testo Legenda
## Obiettivo: Modifica legend.title per essere bold e size = 14,
##            e legend.text per essere italic e size = 11.

## Soluzione 5.4:
ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
  geom_point(size = 3) +
  labs(color = "Classe Veicolo") +
  theme_minimal() +
  theme(
    legend.title = element_text(
      face = "bold",
      size = 14,
      color = "navy"
    ),
    legend.text = element_text(
      face = "italic",
      size = 11
    )
  )

# Gerarchia visiva: titolo più grande e bold, testo più piccolo


## Esercizio 5.5: Guides Avanzate - Override Aesthetics
## Obiettivo: Crea uno scatter plot con punti piccoli (size = 1) e alpha = 0.3.
##            Usa guides() e override.aes per rendere le chiavi della legenda
##            più grandi (size = 4) e completamente opache (alpha = 1).

## Soluzione 5.5:
ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
  geom_point(size = 1, alpha = 0.3) +  # Punti piccoli e trasparenti nel plot
  labs(
    title = "Override Aesthetics nella Legenda",
    color = "Classe"
  ) +
  theme_minimal() +
  guides(
    color = guide_legend(
      override.aes = list(
        size = 4,    # Punti grandi nella legenda
        alpha = 1    # Completamente opachi nella legenda
      )
    )
  )

# Essenziale quando i punti nel plot sono difficili da vedere ma vuoi
# legende chiare. override.aes modifica SOLO la legenda, non il plot


# ============================================================================
# PARTE 6: TEMI CUSTOM E EXPORT
# ============================================================================

## Esercizio 6.1: Creare Tema Riutilizzabile
## Obiettivo: Crea una funzione theme_mio() che parte da theme_minimal() e
##            personalizza almeno 3 elementi (es. plot.title, panel.grid, legend.position).

## Soluzione 6.1:
theme_mio <- function(base_size = 12) {
  theme_minimal(base_size = base_size) +
    theme(
      # Titolo grande e bold
      plot.title = element_text(
        size = base_size * 1.5,
        face = "bold",
        hjust = 0,  # Allinea a sinistra
        margin = margin(b = 10)
      ),
      
      # Sottotitolo grigio
      plot.subtitle = element_text(
        size = base_size * 1.1,
        color = "gray40",
        margin = margin(b = 15)
      ),
      
      # Rimuove griglia minore
      panel.grid.minor = element_blank(),
      
      # Griglia maggiore sottile
      panel.grid.major = element_line(
        color = "gray90",
        size = 0.5
      ),
      
      # Legenda in alto senza titolo
      legend.position = "top",
      legend.title = element_blank(),
      
      # Assi bold
      axis.title = element_text(
        size = base_size * 1.1,
        face = "bold"
      )
    )
}

# Ora theme_mio() è disponibile per tutti i grafici


## Esercizio 6.2: Applicare Tema Custom
## Obiettivo: Usa il tuo theme_mio() creato nell'esercizio precedente su un nuovo grafico.

## Soluzione 6.2:
ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
  geom_point(size = 3, alpha = 0.7) +
  labs(
    title = "Usando il Mio Tema Custom",
    subtitle = "Consistenza in tutti i grafici",
    x = "Cilindrata (L)",
    y = "MPG Highway"
  ) +
  theme_mio()  # Applica il tema custom

# Altro esempio con base_size diverso
ggplot(economics, aes(x = date, y = unemploy/1000)) +
  geom_line(color = "steelblue", size = 1) +
  labs(
    title = "Disoccupazione USA",
    subtitle = "1967-2015"
  ) +
  theme_mio(base_size = 16)  # Testo più grande


## Esercizio 6.3: Theme Set Globale
## Obiettivo: Imposta theme_minimal() come tema di default per tutta la sessione
##            usando theme_set(), poi crea un grafico per verificare.

## Soluzione 6.3:
# Imposta tema globale
theme_set(theme_minimal(base_size = 14))

# Ora TUTTI i grafici useranno theme_minimal automaticamente
ggplot(mpg, aes(x = class)) +
  geom_bar(fill = "steelblue") +
  labs(title = "Usa il Tema Globale")

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(size = 3) +
  labs(title = "Anche Questo Usa il Tema Globale")

# Per resettare al default
theme_set(theme_gray())

# theme_set() è perfetto per report con molti grafici che devono essere consistenti


## Esercizio 6.4: Salvare con ggsave() - Alta Risoluzione
## Obiettivo: Crea un plot e salvalo come "plot_highres.png" con width = 10,
##            height = 6, dpi = 300 (qualità pubblicazione).

## Soluzione 6.4:
# Crea il plot
p <- ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
  geom_point(size = 3, alpha = 0.7) +
  labs(
    title = "Consumo Carburante vs Cilindrata",
    subtitle = "Dataset EPA mpg",
    x = "Cilindrata Motore (litri)",
    y = "Consumo Autostrada (mpg)",
    color = "Classe"
  ) +
  theme_minimal(base_size = 14) +
  theme(legend.position = "bottom")

# Salva con alta risoluzione per pubblicazione
ggsave(
  filename = "plot_highres.png",
  plot = p,
  width = 10,
  height = 6,
  units = "in",
  dpi = 300,      # 300 DPI = standard pubblicazioni scientifiche
  bg = "white"    # Sfondo bianco
)

# 300 DPI assicura qualità ottima anche in stampa


## Esercizio 6.5: Salvare in Formati Multipli
## Obiettivo: Crea un plot e salvalo in tre formati: PNG (web, 72 dpi),
##            PDF (vettoriale), e PNG (pubblicazione, 300 dpi).

## Soluzione 6.5:
# Crea plot complesso
p_final <- ggplot(economics, aes(x = date, y = unemploy/1000)) +
  geom_line(color = "steelblue", size = 1.2) +
  geom_smooth(method = "loess", color = "red", se = TRUE, alpha = 0.2) +
  labs(
    title = "Disoccupazione USA 1967-2015",
    subtitle = "Con trend smooth (LOESS)",
    caption = "Fonte: Federal Reserve Economic Data",
    x = "Anno",
    y = "Disoccupati (migliaia)"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", size = 18),
    plot.subtitle = element_text(color = "gray40")
  )

# 1. PNG per Web (72 DPI, dimensioni in pixel)
ggsave(
  "unemployment_web.png",
  plot = p_final,
  width = 1200,
  height = 800,
  units = "px",
  dpi = 72
)

# 2. PDF vettoriale (scalabile senza perdita qualità)
ggsave(
  "unemployment_vector.pdf",
  plot = p_final,
  width = 10,
  height = 6,
  units = "in"
)

# 3. PNG alta risoluzione per pubblicazione (300 DPI)
ggsave(
  "unemployment_publication.png",
  plot = p_final,
  width = 10,
  height = 6,
  units = "in",
  dpi = 300,
  bg = "white"
)

# 4. BONUS: TIFF per alcune riviste scientifiche
ggsave(
  "unemployment_publication.tiff",
  plot = p_final,
  width = 10,
  height = 6,
  units = "in",
  dpi = 300,
  bg = "white",
  compression = "lzw"  # Compressione lossless
)


# ============================================================================
# FINE SOLUZIONI
# ============================================================================
#
# BEST PRACTICES RIASSUNTIVE:
#
# 1. WORKFLOW:
#    - Prima crea il plot (dati + geom)
#    - Poi applica tema predefinito
#    - Infine personalizza con theme()
#
# 2. TEMI PREDEFINITI:
#    - theme_gray(): Default, sfondo grigio
#    - theme_minimal(): Moderno, pulito
#    - theme_classic(): Pubblicazioni accademiche
#    - theme_bw(): Bianco e nero, stampa
#    - theme_void(): Nessun elemento, mappe
#
# 3. element_*() FUNCTIONS:
#    - element_text(): Font, size, color, angle
#    - element_line(): Linee, griglie, assi
#    - element_rect(): Sfondi, bordi
#    - element_blank(): Rimuove elementi
#
# 4. GERARCHIA:
#    - Gli elementi figli ereditano dai genitori
#    - Modifica il genitore per cambiare tutto
#    - Override i figli per eccezioni
#
# 5. LABELS:
#    - Usa sempre labs() per annotazioni complete
#    - title, subtitle, caption, x, y, aesthetics
#    - NULL rimuove un label
#
# 6. LEGENDE:
#    - legend.position: "top", "bottom", "left", "right", "none", c(x,y)
#    - guides() per controllo fine
#    - override.aes per modificare solo legenda
#
# 7. EXPORT:
#    - Web: 72 DPI, PNG
#    - Presentazioni: 150 DPI, PNG/PDF
#    - Pubblicazioni: 300 DPI, PDF/TIFF
#    - Vettoriali: PDF, SVG (scalabili)
#
# 8. RIUSABILITÀ:
#    - Crea funzioni theme_*() custom
#    - Usa theme_set() per consistenza globale
#    - Salva temi in file separati
#
# ============================================================================
