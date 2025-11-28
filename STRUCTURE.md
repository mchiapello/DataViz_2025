# 📁 Course Directory Overview

```
Course/
├── _quarto.yml
├── index.qmd
├── README.md
├── resources.qmd
├── setup.qmd
├── styles.css
├── SETUP_GUIDE.md
├── STRUCTURE.md               # Questo file (panoramica aggiornata)
├── DataViz_Course.Rproj
├── .Rprofile
├── .gitignore
├── .nojekyll
├── .quarto/                   # Configurazioni interne generate da Quarto
├── _freeze/                   # Cache HTML/PNG creata da Quarto
├── docs/                      # Sito statico pubblicabile (render più recente)
├── materials/                 # Materiali didattici principali
│   ├── day1.qmd
│   ├── day2.qmd
│   ├── EXERCISES_README.md
│   ├── TEMPLATE_STRUCTURE.md
│   ├── presentation-style.css
│   ├── data/
│   │   ├── create_volcano_data.R
│   │   ├── survey_data_spreadsheet_messy.xls
│   │   └── survey_sorting_exercise.xlsx
│   ├── images/
│   │   ├── GoG.jpeg
│   │   ├── frequency-wave-7776034_1280.jpg
│   │   ├── ggplot2_blank.png
│   │   ├── ggplot2_layers.png
│   │   ├── ggplot2_logo.jpg
│   │   ├── ggplot2_logo.svg
│   │   └── tidy-1.png
│   └── Capitoli 01–11 (slide + esercizi)
│       ├── 01_introduzione.qmd
│       ├── 02_gestione_tabelle.qmd
│       ├── 03_grammar_of_graphics.qmd
│       ├── 04_geometrie_base.qmd
│       │   ├── 04_geometrie_base_exercises.R
│       │   ├── 04_geometrie_base_exercises_SCAFFOLD.R
│       │   └── 04_geometrie_base_exercises_SOLUTIONS.R
│       ├── 05_estetiche_mappature.qmd
│       │   ├── 05_estetiche_mappature_exercises.R
│       │   ├── 05_estetiche_mappature_exercises_SCAFFOLD.R
│       │   └── 05_estetiche_mappature_exercises_SOLUTIONS.R
│       ├── 06_recap_giorno1.qmd
│       ├── 07_facets_coordinate.qmd
│       │   ├── 07_facets_coordinate_exercises.R
│       │   ├── 07_facets_coordinate_exercises_SCAFFOLD.R
│       │   └── 07_facets_coordinate_exercises_SOLUTIONS.R
│       ├── 08_scale_trasformazioni.qmd
│       │   ├── 08_scale_trasformazioni_exercises.R
│       │   ├── 08_scale_trasformazioni_exercises_SCAFFOLD.R
│       │   └── 08_scale_trasformazioni_exercises_SOLUTIONS.R
│       ├── 09_themes_personalizzazione.qmd
│       │   ├── 09_themes_personalizzazione_exercises.R
│       │   ├── 09_themes_personalizzazione_exercises_SCAFFOLD.R
│       │   └── 09_themes_personalizzazione_exercises_SOLUTIONS.R
│       ├── 10_visualizzazioni_avanzate.qmd
│       │   ├── 10_visualizzazioni_avanzate_exercises.R
│       │   ├── 10_visualizzazioni_avanzate_exercises_SCAFFOLD.R
│       │   └── 10_visualizzazioni_avanzate_exercises_SOLUTIONS.R
│       └── 11_conclusioni_qa.qmd
├── transcripts/               # Trascrizioni e script di supporto
│   ├── COMPLETE_WORKSHOP_SUMMARY.md
│   ├── analyze_transcript.py
│   ├── ggplot2_part2_cleaned.txt
│   ├── ggplot2_workshop_part2.en.vtt
│   ├── pedersen_ggplot2_workshop.en.vtt
│   ├── pedersen_transcript_clean.txt
│   └── pedersen_transcript_cleaned.txt
└── (altri asset generati dentro `_freeze/` e `docs/`)
```

## 🔑 Core Project Files
- `_quarto.yml`, `index.qmd`, `setup.qmd`, `resources.qmd`: definiscono struttura, navigazione e contenuti chiave del sito.
- `styles.css` e `materials/presentation-style.css`: gestiscono gli stili rispettivamente per il sito e per le slide RevealJS.
- `README.md`, `SETUP_GUIDE.md`: istruzioni operative (clonazione, render, deploy) e guida dettagliata al corso.
- `.Rprofile`: imposta l'ambiente R consigliato per studenti e docenti.

## 📦 Teaching Materials (`materials/`)
- **Capitoli 01–11**: ogni modulo include la presentazione `.qmd` e, dove applicabile, tre file di esercizi (versione studente, scaffold con blank e soluzioni complete).
- **Dataset di supporto**: file Excel per la gestione tabelle e lo script `create_volcano_data.R`, che genera il dataset `volcano_data` usato nelle lezioni sulle visualizzazioni avanzate.
- **Risorse condivise**: immagini, template di stile delle presentazioni e documentazione di riferimento (`EXERCISES_README.md`, `TEMPLATE_STRUCTURE.md`).

## 🌐 Generated Output
- `docs/`: ultima build statica del sito pronta per GitHub Pages.
- `_freeze/`: cache e asset generati da Quarto per render incrementali (normalmente da non modificare a mano).

## 🗂️ Transcripts & Reference Material
La cartella `transcripts/` raccoglie trascrizioni complete, file VTT e script di analisi che supportano la creazione dei contenuti didattici.

## 🆕 Aggiornamenti Recenti
- Creato `materials/data/create_volcano_data.R` e linkato in `resources.qmd` per riprodurre il dataset usato nei volcano plots.
- Rimossa la slide "Clustering e Riordinamento" dal capitolo 10 e allineati gli esercizi correlati.
- Cap. 09: Parte 5 ora contiene 4 esercizi (totale 29) in tutte le varianti (`exercises`, `SCAFFOLD`, `SOLUTIONS`).

## 🚀 Workflow Riepilogativo
```bash
# Preview locale con live reload
quarto preview

# Render completo del sito
quarto render

# Pulizia cache/output
quarto clean
```

Aggiorna questo documento quando vengono aggiunti nuovi capitoli, dataset o risorse in modo che resti la fonte di riferimento per l'organizzazione del repository.
