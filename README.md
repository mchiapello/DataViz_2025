# Data Visualization con ggplot2 - Course Website

Sito web del corso di Data Visualization con ggplot2 tenuto da Marco Chiapello.

## 🚀 Quick Start

### Prerequisiti

- R (≥ 4.0)
- RStudio
- Quarto CLI

### Setup

1. Clone questo repository:
```bash
git clone https://github.com/yourusername/dataviz-course.git
cd dataviz-course/Course
```

2. Installa Quarto:
   - Scarica da [https://quarto.org/docs/get-started/](https://quarto.org/docs/get-started/)

3. Preview del sito:
```bash
quarto preview
```

4. Build del sito:
```bash
quarto render
```

Il sito verrà generato nella cartella `docs/`.

## 📁 Struttura del Progetto

```
Course/
├── _quarto.yml           # Configurazione Quarto
├── index.qmd             # Homepage
├── setup.qmd             # Istruzioni setup
├── resources.qmd         # Risorse e riferimenti
├── styles.css            # CSS personalizzato
├── materials/            # Materiali del corso
│   ├── day1.qmd         # Giorno 1
│   ├── day2.qmd         # Giorno 2
│   ├── exercises.qmd    # Esercizi
│   └── images/          # Immagini
└── docs/                # Sito generato (Git Pages)
```

## 🎨 Personalizzazione

### Modifica il Theme

Edita `_quarto.yml` per cambiare theme e colori:

```yaml
format:
  html:
    theme: 
      light: cosmo
      dark: darkly
```

Theme disponibili: cosmo, flatly, litera, minty, pulse, sandstone, simplex, sketchy, slate, solar, spacelab, superhero, united, yeti

### Aggiungi Contenuti

1. Modifica i file `.qmd` esistenti
2. Aggiungi nuove pagine nella navbar in `_quarto.yml`
3. Aggiungi immagini in `materials/images/`

### CSS Personalizzato

Modifica `styles.css` per personalizzare l'aspetto del sito.

## 📝 Content Creation

### Formato Quarto Markdown

I file `.qmd` supportano:

- **Markdown** standard
- **Codice R** eseguibile
- **YAML** front matter
- **Callouts** (note, warning, tip, important)

Esempio di chunk R:

````markdown
```{r}
#| echo: true
#| eval: false
library(ggplot2)
ggplot(mtcars, aes(wt, mpg)) + geom_point()
```
````

### Callouts

```markdown
:::{.callout-note}
Questo è un messaggio informativo.
:::

:::{.callout-warning}
Attenzione!
:::

:::{.callout-tip}
Un suggerimento utile.
:::
```

## 🌐 Deploy su GitHub Pages

1. Crea un repository su GitHub

2. Assicurati che `_quarto.yml` abbia:
```yaml
project:
  output-dir: docs
```

3. Commit e push:
```bash
git add .
git commit -m "Initial course website"
git push origin main
```

4. Su GitHub:
   - Settings → Pages
   - Source: Deploy from a branch
   - Branch: main
   - Folder: /docs
   - Save

5. Il sito sarà disponibile su: `https://yourusername.github.io/repository-name/`

## 🔧 Comandi Utili

```bash
# Preview in tempo reale
quarto preview

# Render tutto
quarto render

# Render singolo file
quarto render index.qmd

# Check del progetto
quarto check

# Pulire i file generati
quarto clean
```

## 📚 Aggiungere Materiali

### Slides

1. Crea una cartella `materials/slides/`
2. Aggiungi PDF o Quarto presentations
3. Linka nelle pagine day1.qmd e day2.qmd

### Scripts

1. Crea una cartella `materials/scripts/`
2. Aggiungi file R
3. Linka nelle pagine materiali

### Dataset

1. Crea una cartella `materials/data/`
2. Aggiungi CSV, RData, etc.
3. Documenta in setup.qmd

## 🎓 Uso nel Corso

Durante il corso:

1. I partecipanti visitano il sito per:
   - Informazioni logistiche
   - Download materiali
   - Consultare riferimenti
   - Esercizi e soluzioni

2. Aggiornamenti in tempo reale:
   - Modifica i file `.qmd`
   - `quarto render`
   - Git push
   - Sito aggiornato in pochi minuti

## 📖 Documentazione Quarto

- [Quarto Website Guide](https://quarto.org/docs/websites/)
- [Quarto Publishing](https://quarto.org/docs/publishing/github-pages.html)
- [Quarto Reference](https://quarto.org/docs/reference/)

## 🤝 Contributing

Per suggerimenti o correzioni:

1. Fork il repository
2. Crea un branch (`git checkout -b feature/improvement`)
3. Commit (`git commit -am 'Add improvement'`)
4. Push (`git push origin feature/improvement`)
5. Apri una Pull Request

## 📧 Contatti

- Email: [your.email@example.com]
- Slack: [REVELO Training](https://revelotraining.slack.com/)
- Website: [https://yourusername.github.io/dataviz-course/](https://yourusername.github.io/dataviz-course/)

## 📄 Licenza

Questo materiale didattico è rilasciato sotto licenza [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).

## 🙏 Acknowledgments

- [Quarto](https://quarto.org/) per il fantastico sistema di pubblicazione
- [ggplot2](https://ggplot2.tidyverse.org/) e Hadley Wickham
- [The Carpentries](https://carpentries.org/) per l'ispirazione pedagogica
- Tutti i partecipanti ai corsi passati

---

**Built with ❤️, R, and Quarto by Marco Chiapello**
