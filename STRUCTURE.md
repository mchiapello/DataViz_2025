# 📁 Complete Directory Structure

```
DataViz/
├── Course/                              🎓 NUOVO CORSO WEBSITE
│   ├── _quarto.yml                     ⚙️  Configurazione Quarto
│   ├── index.qmd                       🏠 Homepage
│   ├── setup.qmd                       🔧 Istruzioni Setup
│   ├── resources.qmd                   📚 Risorse
│   ├── styles.css                      🎨 CSS Personalizzato
│   ├── README.md                       📖 Documentazione
│   ├── SETUP_GUIDE.md                  📝 Guida Setup Completa
│   ├── .gitignore                      🚫 Git ignore file
│   ├── .nojekyll                       🔗 GitHub Pages config
│   ├── .Rprofile                       ⚙️  R configurazione
│   │
│   └── materials/                      📦 Materiali Corso
│       ├── day1.qmd                    📅 Giorno 1
│       ├── day2.qmd                    📅 Giorno 2
│       ├── exercises.qmd               ✏️  Esercizi
│       └── images/                     🖼️  Immagini
│           └── ggplot2_logo.svg        🎨 Logo
│
├── ggplot2_knowledge_source.md         📚 Knowledge Base (già creato)
│
├── Data/                               📊 Dataset
│   ├── Antihypertensive_Therapy.csv
│   ├── cv_diseases_1.csv
│   ├── cv_diseases_2.csv
│   ├── cv_diseases_3.csv
│   └── gene_expression_7vs7.txt
│
├── Scripts/                            💻 Scripts R
│   └── DataViz.R
│
├── Scripts_specialised/                🔬 Scripts Specializzati
│   ├── 000_measles_and_temps_heatmaps.R
│   ├── 001_essentials.R
│   ├── 002_oneVariable.R
│   ├── 003_twoVariable.R
│   ├── 004_scatter_basics.R
│   ├── 005_volcanoPlot.R
│   ├── 006_GOterms.R
│   ├── 007_heatmaps.R
│   ├── essential_00_colorsAndPalettes.R
│   ├── essential_02_oneVariable.R
│   ├── essential_03_twoVariable.R
│   ├── MechanicsOfDataViz.Rmd
│   ├── special_XX_hourlyTemperatures.R
│   └── upsetr.R
│
├── ggplot2-main/                       📦 ggplot2 Source (reference)
│   └── [ggplot2 repository contents]
│
└── Theory/                             📖 Teoria
```

## 🎯 Il Nuovo Sito Corso

### Struttura Completa Post-Build

Dopo aver eseguito `quarto render`, la struttura sarà:

```
Course/
├── _quarto.yml
├── index.qmd
├── setup.qmd
├── resources.qmd
├── styles.css
├── README.md
├── SETUP_GUIDE.md
├── .gitignore
├── .nojekyll
├── .Rprofile
│
├── materials/
│   ├── day1.qmd
│   ├── day2.qmd
│   ├── exercises.qmd
│   └── images/
│       └── ggplot2_logo.svg
│
└── docs/                               🌐 SITO GENERATO (GitHub Pages)
    ├── index.html
    ├── setup.html
    ├── resources.html
    ├── materials/
    │   ├── day1.html
    │   ├── day2.html
    │   ├── exercises.html
    │   └── images/
    ├── site_libs/                      📚 Librerie Quarto
    ├── search.json                     🔍 Indice ricerca
    └── styles.css
```

## 📝 Files Principali

### Configurazione
- **`_quarto.yml`**: Configurazione principale (navbar, theme, output)
- **`.gitignore`**: Esclusioni Git
- **`.nojekyll`**: Disabilita Jekyll per GitHub Pages
- **`.Rprofile`**: Configurazione R per il corso

### Contenuti
- **`index.qmd`**: Homepage con info corso
- **`setup.qmd`**: Guida installazione completa
- **`resources.qmd`**: Risorse e riferimenti
- **`materials/day1.qmd`**: Materiali primo giorno
- **`materials/day2.qmd`**: Materiali secondo giorno
- **`materials/exercises.qmd`**: Esercizi con soluzioni

### Styling
- **`styles.css`**: CSS personalizzato per il sito

### Documentazione
- **`README.md`**: Documentazione tecnica progetto
- **`SETUP_GUIDE.md`**: Guida completa setup e uso

## 🚀 Quick Start Commands

```bash
# Navigate to Course directory
cd /Users/chiapell/personale/REVELO/DataViz/Course

# Preview site locally
quarto preview

# Build site
quarto render

# Check Quarto installation
quarto check
```

## 🌐 URLs

### Locale (dopo quarto preview)
- Homepage: http://localhost:XXXX/
- Setup: http://localhost:XXXX/setup.html
- Resources: http://localhost:XXXX/resources.html
- Day 1: http://localhost:XXXX/materials/day1.html
- Day 2: http://localhost:XXXX/materials/day2.html
- Exercises: http://localhost:XXXX/materials/exercises.html

### GitHub Pages (dopo deploy)
- https://yourusername.github.io/dataviz-course/
- https://yourusername.github.io/dataviz-course/setup.html
- https://yourusername.github.io/dataviz-course/resources.html
- etc.

## 📦 Contenuti da Aggiungere (TODO)

### Slides (da creare)
```
materials/slides/
├── 01_introduction.pdf
├── 02_grammar_of_graphics.pdf
├── 03_basic_geoms.pdf
├── 04_aesthetics.pdf
├── 05_facets_coords.pdf
├── 06_scales.pdf
├── 07_themes.pdf
├── 08_advanced_viz.pdf
└── 09_best_practices.pdf
```

### Scripts (da creare)
```
materials/scripts/
├── day1/
│   ├── 01_intro.R
│   ├── 02_grammar.R
│   ├── 03_geoms.R
│   ├── 04_aesthetics.R
│   └── 05_facets.R
└── day2/
    ├── 06_scales.R
    ├── 07_themes.R
    └── 08_advanced.R
```

### Dataset (opzionale)
```
materials/data/
├── penguins.csv
├── diamonds_sample.csv
└── custom_dataset.csv
```

### Soluzioni Esercizi (da creare)
```
materials/exercises/
├── day1_solutions.R
└── day2_solutions.R
```

## 🎨 Personalizzazione Rapida

### Cambiare Colori
Modifica `_quarto.yml`:
```yaml
format:
  html:
    theme: 
      light: [cosmo, custom.scss]  # crea custom.scss
```

### Aggiungere Logo Reale
Sostituisci `materials/images/ggplot2_logo.svg` con PNG/JPG

### Modificare Footer
Modifica `_quarto.yml`:
```yaml
website:
  page-footer:
    left: "Il tuo testo"
    right: "© 2025"
```

## 📊 Statistiche

### Files Creati: 13
- Quarto files (.qmd): 5
- Config files: 4
- Documentation: 3
- Assets: 1

### Linee di Codice: ~3,000+
- QMD content: ~2,500
- CSS: ~200
- Config: ~100
- Documentation: ~200

### Pagine Web: 6
- Homepage
- Setup
- Resources
- Day 1 materials
- Day 2 materials
- Exercises

## ✅ Checklist Completamento

### ✅ Infrastruttura
- [x] Configurazione Quarto
- [x] Struttura directory
- [x] Files di configurazione
- [x] CSS personalizzato
- [x] Documentazione

### ✅ Contenuti Base
- [x] Homepage con programma
- [x] Setup instructions
- [x] Resources page
- [x] Day 1 materials
- [x] Day 2 materials
- [x] Exercises with solutions

### 📝 Da Completare (quando pronto)
- [ ] Aggiungere slides PDF
- [ ] Aggiungere scripts R
- [ ] Aggiungere dataset custom
- [ ] Aggiungere immagini reali
- [ ] Personalizzare informazioni contatto
- [ ] Test deploy GitHub Pages
- [ ] Condividere con partecipanti

## 🎓 Pronto per l'Uso!

Il sito è completamente funzionale e pronto per:
1. Preview locale
2. Personalizzazione contenuti
3. Deploy su GitHub Pages
4. Uso nel corso

Hai tutto il necessario per un corso professionale di Data Visualization! 🚀
