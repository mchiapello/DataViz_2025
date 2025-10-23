# 🎨 Corso di Data Visualization con ggplot2

## Infrastruttura Creata ✅

Ho creato una completa infrastruttura Quarto per il tuo corso di Data Visualization con ggplot2, simile al sito RNASeq che hai condiviso.

### 📁 Struttura del Progetto

```
Course/
├── _quarto.yml              # Configurazione principale Quarto
├── index.qmd                # Homepage con info corso
├── setup.qmd                # Istruzioni installazione
├── resources.qmd            # Risorse e riferimenti
├── styles.css               # CSS personalizzato
├── README.md                # Documentazione progetto
├── .gitignore              # File da ignorare in Git
├── .nojekyll               # Per GitHub Pages
├── .Rprofile               # Configurazione R per il corso
│
└── materials/              # Materiali didattici
    ├── day1.qmd           # Programma e materiali Giorno 1
    ├── day2.qmd           # Programma e materiali Giorno 2
    ├── exercises.qmd      # Esercizi con soluzioni
    └── images/            # Immagini
        └── ggplot2_logo.svg
```

### 🎯 Caratteristiche Principali

1. **Homepage (`index.qmd`)**
   - Informazioni logistiche
   - Programma completo 2 giorni
   - Obiettivi del corso
   - Prerequisiti
   - Info docente
   - Istruzioni installazione

2. **Setup (`setup.qmd`)**
   - Guida installazione R e RStudio
   - Lista pacchetti necessari
   - Codice per verifica installazione
   - Struttura progetto consigliata
   - Troubleshooting problemi comuni
   - Checklist pre-corso

3. **Risorse (`resources.qmd`)**
   - Documentazione ufficiale
   - Libri (gratuiti e a pagamento)
   - Tutorial e video
   - Dataset per esercitarsi
   - Pacchetti ggplot2 extensions
   - Community e supporto
   - Strumenti online

4. **Materiali Giorno 1 (`materials/day1.qmd`)**
   - Programma dettagliato con orari
   - Fondamenti ggplot2
   - Grammar of Graphics
   - Geometrie base (point, line, bar, histogram, boxplot)
   - Estetiche e mappature
   - Facets e coordinate
   - Esempi di codice R
   - Esercizi pratici

5. **Materiali Giorno 2 (`materials/day2.qmd`)**
   - Recap Giorno 1
   - Scale e trasformazioni
   - Themes e personalizzazione
   - Visualizzazioni avanzate
   - Smoothing, density plots, violin plots
   - Heatmaps e labels
   - Combinare grafici con patchwork
   - Progetto finale
   - Best practices

6. **Esercizi (`materials/exercises.qmd`)**
   - Esercizi Giorno 1 (4 esercizi)
   - Esercizi Giorno 2 (4 esercizi)
   - Challenge projects
   - Soluzioni collapsable (details/summary)

### 🎨 Design e Styling

- **Theme**: Cosmo (light) / Darkly (dark mode)
- **Colori**: Schema professionale blu/grigio
- **Responsive**: Ottimizzato per mobile e desktop
- **Navigazione**: Navbar con dropdown menu
- **Footer**: Credits e copyright
- **CSS personalizzato**: Per tabelle, codice, callouts, ecc.

### 🚀 Come Utilizzare

#### 1. Preview Locale

```bash
cd Course
quarto preview
```

Questo aprirà il sito in un browser locale con live reload.

#### 2. Build del Sito

```bash
quarto render
```

Genera i file HTML nella cartella `docs/`.

#### 3. Deploy su GitHub Pages

```bash
# Inizializza Git (se non già fatto)
git init
git add .
git commit -m "Initial course website"

# Crea repository su GitHub e collegalo
git remote add origin https://github.com/yourusername/dataviz-course.git
git push -u origin main

# Vai su GitHub Settings > Pages
# Source: Deploy from a branch
# Branch: main, Folder: /docs
# Save
```

Il sito sarà disponibile su `https://yourusername.github.io/dataviz-course/`

### 📝 Personalizzazione

#### Aggiornare Informazioni Corso

Modifica `index.qmd`:
- Cambia location, date, orari
- Aggiorna info docente
- Modifica email e link Slack

#### Aggiungere Contenuti

1. **Slides**: 
   - Crea `materials/slides/`
   - Aggiungi PDF o Quarto presentations
   - Linka in day1.qmd e day2.qmd

2. **Scripts**:
   - Crea `materials/scripts/day1/` e `materials/scripts/day2/`
   - Aggiungi file .R
   - Linka nelle pagine materiali

3. **Dataset**:
   - Crea `materials/data/`
   - Aggiungi CSV, RData, ecc.
   - Documenta in setup.qmd

#### Modificare Theme

In `_quarto.yml`:

```yaml
format:
  html:
    theme: 
      light: cosmo  # prova: flatly, litera, minty, etc.
      dark: darkly  # prova: slate, solar, superhero, etc.
```

#### Aggiungere Pagine

1. Crea nuovo file `.qmd`
2. Aggiungi alla navbar in `_quarto.yml`:

```yaml
navbar:
  left:
    - text: "Nuova Pagina"
      href: nuova-pagina.qmd
```

### 🎓 Workflow Durante il Corso

1. **Pre-corso**:
   - Condividi link al sito
   - Partecipanti installano software seguendo `setup.qmd`
   - Download materiali

2. **Durante**:
   - Proietta le pagine day1/day2
   - Codice live da copiare/seguire
   - Esercizi individuali/di gruppo

3. **Post-corso**:
   - Aggiungi soluzioni esercizi
   - Upload progetti dei partecipanti
   - Link a risorse aggiuntive

### 📦 Pacchetti R Suggeriti

Il sito include già liste complete, ma i principali sono:

```r
# Essenziali
install.packages("tidyverse")  # include ggplot2

# Aggiuntivi
install.packages(c(
  "scales", "patchwork", "ggthemes", 
  "palmerpenguins", "viridis", "ggrepel"
))
```

### 🔧 Comandi Utili

```bash
# Preview con live reload
quarto preview

# Render tutto
quarto render

# Render singolo file
quarto render index.qmd

# Check configurazione
quarto check

# Pulire file generati
quarto clean
```

### 📚 Prossimi Passi

1. **Personalizza contenuti**:
   - [ ] Aggiorna informazioni in `index.qmd`
   - [ ] Modifica programma se necessario
   - [ ] Aggiungi tue slide/script
   - [ ] Carica dataset

2. **Aggiungi materiali**:
   - [ ] Crea cartelle slides/ e scripts/
   - [ ] Prepara esercizi e soluzioni
   - [ ] Aggiungi immagini/screenshots

3. **Deploy**:
   - [ ] Crea repository GitHub
   - [ ] Push del codice
   - [ ] Attiva GitHub Pages
   - [ ] Testa il sito pubblico

4. **Promuovi**:
   - [ ] Condividi link con partecipanti
   - [ ] Aggiungi al tuo sito/CV
   - [ ] Social media announcement

### 💡 Tips

- **Immagini**: Usa immagini reali al posto del placeholder SVG
- **Video**: Puoi embeddare video YouTube nelle pagine
- **Quiz**: Aggiungi quiz interattivi con shinylive
- **Download**: Offri ZIP con tutti i materiali
- **Feedback**: Crea form per raccogliere feedback
- **Certificati**: Template per certificati di partecipazione

### 🆘 Supporto

Se hai domande o problemi:

1. Consulta [Quarto Documentation](https://quarto.org/docs/guide/)
2. [Quarto Community](https://github.com/quarto-dev/quarto-cli/discussions)
3. [ggplot2 Reference](https://ggplot2.tidyverse.org/)

### 🎉 Pronto!

La tua infrastruttura è pronta! Ora puoi:

1. Fare preview locale con `quarto preview`
2. Personalizzare i contenuti
3. Aggiungere i tuoi materiali
4. Fare il deploy su GitHub Pages

**Buon corso! 🚀📊🎨**
