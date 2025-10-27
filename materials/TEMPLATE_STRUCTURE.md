# Course Materials Structure Template
## REVELO Training - Data Viz 2025

This document describes the standard structure for course chapter materials. Each chapter follows a consistent three-file pattern: presentation, student exercises, and instructor solutions.

---

## 📁 File Structure Overview

Each course chapter consists of **3 coordinated files**:

1. **`XX_topic_name.qmd`** - Quarto RevealJS presentation (theory + live demos)
2. **`XX_topic_name_exercises.R`** - Student R script with empty exercises
3. **`XX_topic_name_exercises_SOLUTIONS.R`** - Instructor R script with complete solutions

Where `XX` = chapter number (e.g., `04_geometrie_base`)

---

## 1️⃣ Presentation File (`XX_topic_name.qmd`)

### Purpose
Interactive slide deck for hands-on workshop combining theory, live examples, and exercise prompts.

### Format
- **Type**: Quarto document (`.qmd`)
- **Output**: RevealJS presentation (HTML slides)
- **Rendering**: `quarto preview XX_topic_name.qmd`

### Structure

#### YAML Header
```yaml
---
title: "Topic Name in ggplot2"
subtitle: "Hands-on Workshop"
author: "Marco Chiapello"
format: 
  revealjs:
    theme: simple
    transition: slide
    slide-number: true
    chalkboard: true
    logo: images/ggplot2_logo.jpg
    footer: "REVELO Training - Data Viz 2025"
    css: presentation-style.css
    title-slide-attributes:
      data-background-image: images/frequency-wave-7776034_1280.jpg
      data-background-size: cover
      data-background-opacity: "0.1"
resources:
  - images/
  - presentation-style.css
---
```

#### Slide Sequence

**1. Opening Slides**
- Slide 1: **Obiettivi della Sessione** - learning goals, approach, aesthetics focus
- Slide 2: **Esercizi Pratici** - overview of exercise file, 30 exercises in 6 parts, download link

**2. Intro Slide**
- Slide 3: **Cos'è una [Concept]?** - definitions, core principles, categories covered

**3. Chapter Pattern (Repeat 6 times)**

Each chapter follows this structure:
```
# Chapter Title {background attributes}

## Concept 1: Name {background attributes}
   - Theory content
   - Code examples
   - Parameters
   - When to use / when not to use

## Concept 2: Name {background attributes}
   - Theory content
   - Code examples
   
## Concept 3: Name {background attributes}
   - Theory content
   
## {background attributes}
   Adesso tocca a te!
   (Transition slide - centered, large text, blank title)
```

**Chapters in geometrie_base example:**
1. Geoms per Relazioni (geom_point, geom_line, geom_path, geom_smooth)
2. Distribuzioni: 1 Variabile (geom_histogram, geom_density, geom_freqpoly, geom_dotplot)
3. Distribuzioni: 2 Variabili (geom_bin2d, geom_hex, geom_density2d)
4. Statistiche Riassuntive (geom_boxplot, geom_violin, geom_bar, geom_col)
5. Incertezza (geom_errorbar, geom_pointrange, geom_ribbon)
6. Combinazioni Avanzate (layering, best practices)

**4. Closing Slide**
- Final slide: **Risorse & Prossimi Passi** - documentation links, cheat sheets, upcoming sessions

### Slide Formatting Rules

**Background attributes** (apply to every slide):
```markdown
{background-image="images/frequency-wave-7776034_1280.jpg" background-size="cover" background-opacity="0.1"}
```

**Transition slides** (between chapters):
```markdown
## {background-image="..." background-size="..." background-opacity="..."}

::: {style="text-align: center; font-size: 3em; margin-top: 200px;"}
**Adesso tocca a te!**
:::
```

**Content slides** use columns, font sizes, callouts:
```markdown
::: {.columns}
::: {.column width="50%"}
::: {style="font-size: 0.7em;"}
Content here
:::
:::
::: {.column width="50%"}
More content
:::
:::
```

**Callout types used:**
- `{.callout-tip}` - helpful hints
- `{.callout-warning}` - cautions
- `{.callout-important}` - key distinctions
- `{.callout-note}` - additional info

**Code blocks**: Plain R syntax (no `{r}` chunk notation)
```markdown
```r
library(ggplot2)
ggplot(data, aes(x = var)) + geom_point()
```
```

### Content Distribution

- **Theory**: ~60% - concepts, parameters, when to use
- **Examples**: ~30% - working code snippets
- **Navigation/Meta**: ~10% - transitions, resources

### Key Principles

1. **Consistency**: All slides use same background image and styling
2. **Progressive disclosure**: Each chapter builds on previous
3. **Bilingual**: Italian slide text, English code
4. **Focus**: Only x/y aesthetics (other aesthetics in later chapters)
5. **Rhythm**: Theory → Transition → Practice (repeated)

---

## 2️⃣ Student Exercise File (`XX_topic_name_exercises.R`)

### Purpose
Hands-on practice script where students write code to complete 30 exercises.

### Format
- **Type**: R script (`.R`)
- **Execution**: Run line-by-line or section-by-section in RStudio

### Structure

#### Header Block
```r
# =============================================================================
# ESERCIZI: [Topic Name] in ggplot2
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
```

#### Setup Section
```r
# SETUP -----------------------------------------------------------------------
library(ggplot2)
library(dplyr)

# Carica datasets
data(mpg)
data(diamonds)
data(economics)
data(faithful)
```

#### Exercise Blocks (30 total, organized in 6 parts)

**Part structure:**
```r
# =============================================================================
# PARTE X: SECTION NAME
# =============================================================================

# ESERCIZIO N: Title --------------------------------------------------------
# Obiettivo: [Clear description of what to accomplish]

# Il tuo codice qui:




```

**Exercise numbering:**
- Part 1: Exercises 1-6
- Part 2: Exercises 7-12
- Part 3: Exercises 13-16
- Part 4: Exercises 17-21
- Part 5: Exercises 22-24
- Part 6: Exercises 25-30

**Data preparation exercises** (when needed):
```r
# ESERCIZIO 21: Preparare Dati Aggregati -------------------------------------
# Obiettivo: Calcola consumo medio per classe e visualizza con geom_col()

# Aggrega dati
mpg_summary <- mpg %>%
  group_by(class) %>%
  summarise(
    mean_hwy = mean(hwy),
    sd_hwy = sd(hwy)
  )

# Visualizza con geom_col


```

#### Footer Block
```r
# =============================================================================
# FINE ESERCIZI
# =============================================================================
# 
# Congratulazioni! Hai completato tutti gli esercizi.
# 
# Prossimi passi:
# - Rivedi gli esercizi dove hai avuto difficoltà
# - Sperimenta con altri dataset (iris, mtcars, ToothGrowth)
# - Prova a combinare 3+ geom in un grafico
# - Esplora la documentazione: ?geom_point, ?geom_histogram, etc.
# 
# Le soluzioni saranno fornite a fine corso!
# =============================================================================
```

### Key Principles

1. **Empty space**: 3-4 blank lines for student code
2. **Clear objectives**: Each exercise has specific goal in Italian
3. **Progressive difficulty**: Basic → Advanced within each part
4. **Self-contained**: Can be worked through independently
5. **No labels**: No `labs()` calls - focus on geoms only
6. **Hints**: Brief guidance in objective statement

---

## 3️⃣ Solutions File (`XX_topic_name_exercises_SOLUTIONS.R`)

### Purpose
Complete working solutions for instructor reference and student review after attempting exercises.

### Format
- **Type**: R script (`.R`)
- **Execution**: Run to verify all code works
- **Distribution**: Share ONLY after students complete exercises

### Structure

#### Header Block
```r
# =============================================================================
# SOLUZIONI: [Topic Name] in ggplot2
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
```

#### Setup Section
**Identical to student file:**
```r
# SETUP -----------------------------------------------------------------------
library(ggplot2)
library(dplyr)

# Carica datasets
data(mpg)
data(diamonds)
data(economics)
data(faithful)
```

#### Solution Blocks (30 total, same organization)

**Solution structure:**
```r
# ESERCIZIO N: Title --------------------------------------------------------
# Obiettivo: [Same objective as student file]

[Complete working code]

# Interpretazione/Comments (when relevant)
```

**Example:**
```r
# ESERCIZIO 1: Scatter Plot Base ----------------------------------------------
# Obiettivo: Creare uno scatter plot per esplorare la relazione tra 
#            cilindrata (displ) e consumo autostrada (hwy)

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point()

# Interpretazione: Relazione negativa - più cilindrata, meno consumo
```

**Multi-option exercises:**
```r
# ESERCIZIO 8: Sperimentare con Bins -----------------------------------------
# Obiettivo: Prova bins = 10, bins = 100, e bins = 40. Quale è migliore?

# bins = 10 (troppo grossolano)
ggplot(diamonds, aes(x = carat)) +
  geom_histogram(bins = 10, fill = "coral", color = "black")

# bins = 100 (troppo dettagliato)
ggplot(diamonds, aes(x = carat)) +
  geom_histogram(bins = 100, fill = "lightgreen", color = "black")

# bins = 40 (equilibrato)
ggplot(diamonds, aes(x = carat)) +
  geom_histogram(bins = 40, fill = "skyblue", color = "black")

# Conclusione: bins = 30-50 bilancia bene dettaglio e leggibilità
```

**Package installation handling:**
```r
# ESERCIZIO 14: Hexbin Alternative -------------------------------------------
# Obiettivo: Ricrea con geom_hex() e scale_fill_viridis_c()
# Nota: Richiede install.packages("hexbin") se non installato

# Installa hexbin se necessario
if (!require("hexbin", quietly = TRUE)) {
  install.packages("hexbin")
  library(hexbin)
}

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_hex(bins = 50) +
  scale_fill_viridis_c(option = "plasma")
```

#### Footer Block
```r
# =============================================================================
# FINE SOLUZIONI
# =============================================================================
# 
# Best Practices Recap:
# 
# 1. Scegli il geom giusto per il tipo di dati
#    - Continuous x continuous → geom_point(), geom_smooth()
#    - Time series → geom_line()
#    - 1 var continua → geom_histogram(), geom_density()
#    - Categorico x continuo → geom_boxplot(), geom_violin()
#    - Big data → geom_hex(), geom_bin2d()
#
# 2. Gestisci overplotting
#    - alpha basso
#    - geom_jitter()
#    - Binning (hex, bin2d)
#
# 3. Combina geom per maggiore informazione
#    - Points + smooth
#    - Violin + boxplot
#    - Histogram + density
#    - Ribbon + line
#
# 4. Sperimenta con parametri
#    - bins, binwidth per histogram
#    - adjust per density
#    - method per smooth
#
# =============================================================================
```

### Key Principles

1. **Complete code**: All exercises fully solved with working code
2. **Same structure**: Mirrors student file exactly (parts, numbering, objectives)
3. **Educational comments**: Interpretations, insights, comparisons
4. **Error-free**: All code tested and verified
5. **No labels**: Like student file, no `labs()` - focus on geoms
6. **Best practices**: Summary section with key takeaways

---

## 🔗 File Relationships & Dependencies

### Cross-File Consistency

**Exercise numbering:**
- Presentation mentions "30 esercizi organizzati in 6 parti"
- Student file has exactly 30 exercises in 6 parts
- Solutions file has same 30 exercises with identical numbering

**Content mapping:**
```
Presentation Chapter 1 → Student File Part 1 → Solutions File Part 1
Presentation Chapter 2 → Student File Part 2 → Solutions File Part 2
...etc
```

**Datasets:**
All three files use same datasets:
- `mpg` (234 rows) - car fuel economy
- `diamonds` (53,940 rows) - diamond characteristics
- `economics` (574 rows) - US economic time series
- `faithful` (272 rows) - Old Faithful geyser eruptions

**Packages:**
All three files require:
- `ggplot2` (core)
- `dplyr` (data manipulation)
- `hexbin` (optional, for geom_hex)

### Exercise-to-Slide Mapping

Each presentation chapter covers concepts tested in corresponding exercise part:

| Chapter | Slides | Exercises | Concepts |
|---------|--------|-----------|----------|
| Relazioni | 3 slides | 1-6 | point, jitter, smooth, line, path |
| Distribuzioni 1D | 3 slides | 7-12 | histogram, density, freqpoly, dotplot |
| Distribuzioni 2D | 2 slides | 13-16 | bin2d, hex, density2d |
| Statistiche | 2 slides | 17-21 | boxplot, violin, bar, col |
| Incertezza | 2 slides | 22-24 | errorbar, pointrange, ribbon |
| Combinazioni | 1 slide | 25-30 | multi-layer, advanced combos |

### Teaching Flow

**During workshop:**

1. **Present theory** (10-15 min per chapter)
   - Instructor shows slides
   - Live coding demonstrations
   - Explain parameters, use cases

2. **Transition slide** ("Adesso tocca a te!")
   - Signals practice time
   - Students open exercise file

3. **Practice time** (15-20 min per part)
   - Students work on exercises
   - Instructor circulates, helps
   - Solutions NOT distributed yet

4. **Review** (5 min per part)
   - Discuss approaches
   - Show solutions (screen share or distribution)
   - Common mistakes

5. **Repeat** for next chapter

**Post-workshop:**
- Solutions file distributed
- Students compare their work
- Practice additional variations

---

## 📋 Template Checklist

When creating new chapter materials, ensure:

### Presentation File
- [ ] YAML header with correct title, logo, background image
- [ ] Slide 1: Obiettivi della Sessione
- [ ] Slide 2: Esercizi Pratici with download link
- [ ] Intro slide explaining core concept
- [ ] 6 chapter sections (adjust number as needed)
- [ ] Each chapter has 1-3 concept slides
- [ ] Transition slide after each chapter ("Adesso tocca a te!")
- [ ] All slides have background attributes
- [ ] Code blocks use plain R syntax (no `{r}`)
- [ ] Final slide: Risorse & Prossimi Passi
- [ ] Renders without errors: `quarto preview XX_topic.qmd`

### Student Exercise File
- [ ] Header with instructions
- [ ] Setup section with libraries and data()
- [ ] 30 exercises organized in 6 parts
- [ ] Each exercise has clear objective in Italian
- [ ] 3-4 blank lines for student code
- [ ] Data preparation exercises include starter code
- [ ] Footer with encouragement and next steps
- [ ] No `labs()` calls (focus on core concept)
- [ ] Runs without errors when completed

### Solutions File
- [ ] Header warns against early distribution
- [ ] Setup identical to student file
- [ ] All 30 exercises with complete working code
- [ ] Objectives copied from student file
- [ ] Interpretive comments where helpful
- [ ] Handles optional package installation
- [ ] Footer with best practices recap
- [ ] All code tested and error-free
- [ ] Exact same structure as student file

### Cross-File Consistency
- [ ] Exercise count matches presentation claim
- [ ] Part names match between all files
- [ ] Datasets match between all files
- [ ] Numbering is consistent (1-30)
- [ ] Objectives are identical in student and solutions
- [ ] Concepts in presentation match exercise topics

---

## 🎯 Design Philosophy

### Learning Objectives
1. **Conceptual understanding** - Why and when to use each technique
2. **Practical skill** - Hands-on coding with immediate feedback
3. **Progressive mastery** - Build from simple to complex
4. **Best practices** - Industry-standard approaches

### Pedagogical Approach
- **Show, then do** - Theory first, practice immediately after
- **Scaffolded learning** - Clear objectives, empty code blocks
- **Delayed solutions** - Encourage genuine attempts before revealing answers
- **Iterative practice** - 30 exercises ensure concept retention

### Accessibility
- **Bilingual** - Italian instructions, English code (international standard)
- **Self-paced** - Students can work at own speed
- **Multiple formats** - Slides (visual), R scripts (hands-on)
- **No dependencies** - Standard R packages, built-in datasets

---

## 📂 File Naming Convention

```
XX_topic_name.qmd                    # Presentation
XX_topic_name_exercises.R            # Student exercises  
XX_topic_name_exercises_SOLUTIONS.R  # Instructor solutions
```

**Where:**
- `XX` = Two-digit chapter number (01, 02, 03, ...)
- `topic_name` = Snake_case topic identifier
- All lowercase, underscores for spaces

**Examples:**
```
04_geometrie_base.qmd
04_geometrie_base_exercises.R
04_geometrie_base_exercises_SOLUTIONS.R

05_aesthetics_avanzate.qmd
05_aesthetics_avanzate_exercises.R
05_aesthetics_avanzate_exercises_SOLUTIONS.R
```

---

## 🔄 Workflow for Creating New Chapter

1. **Plan content**
   - Identify 6 main categories/sections
   - List 30 specific skills/techniques to practice
   - Gather example datasets

2. **Create presentation** (`XX_topic.qmd`)
   - Copy template header from geometrie_base
   - Write objective and exercise overview slides
   - Create 6 chapters with theory content
   - Add transition slides between chapters
   - Create closing slide with resources

3. **Create student exercises** (`XX_topic_exercises.R`)
   - Copy header and setup from geometrie_base
   - Write 30 exercises (5 per part)
   - Ensure clear objectives
   - Leave space for code
   - Add data preparation where needed

4. **Create solutions** (`XX_topic_exercises_SOLUTIONS.R`)
   - Copy structure from student file
   - Fill in all code solutions
   - Test every exercise to ensure it runs
   - Add interpretive comments
   - Write best practices summary

5. **Test & verify**
   - Render presentation: `quarto preview XX_topic.qmd`
   - Run all solution code to verify it works
   - Check consistency: numbering, datasets, packages
   - Review for typos and clarity

6. **Package for distribution**
   - Presentation HTML (generated by Quarto)
   - Student exercises R file
   - Solutions R file (hold until after workshop)

---

## 🎨 Visual & Style Consistency

### Colors & Branding
- **Background**: `frequency-wave-7776034_1280.jpg` (blue wave pattern)
- **Logo**: `ggplot2_logo.jpg`
- **Theme**: RevealJS "simple"
- **Footer**: "REVELO Training - Data Viz 2025"

### Typography
- **Main content**: 0.7-0.85em (varies by slide density)
- **Transition slides**: 3em (large, centered)
- **Code blocks**: Default monospace

### Layout Patterns
- **Two-column slides**: Common (50%/50% split)
- **Single column**: Theory-heavy slides
- **Full-width**: Transitions, resources

---

## 📊 Example Content Density

**Typical slide:**
- 1-2 concept explanations
- 2-3 code examples
- 1 callout box
- 3-5 bullet points

**Typical exercise:**
- 1 clear objective (1-2 lines)
- 3-5 lines of code (in solutions)
- Optional: 1-2 comment lines for interpretation

**Typical presentation chapter:**
- 3-4 slides
- 2-3 main concepts
- 5-8 code examples
- 2-3 callout boxes

---

## ✅ Quality Standards

### Code Quality
- ✅ All code runs without errors
- ✅ Uses standard ggplot2 syntax
- ✅ Follows tidyverse style guide
- ✅ Efficient and readable

### Educational Quality
- ✅ Clear learning objectives
- ✅ Progressive difficulty
- ✅ Relevant examples
- ✅ Comprehensive coverage

### Documentation Quality
- ✅ Objectives in Italian
- ✅ Code in English
- ✅ Helpful comments
- ✅ No typos

---

## 🚀 Quick Reference: Creating Chapter 05

To create materials for chapter 05 (example: Aesthetics Avanzate):

1. Copy `04_geometrie_base.qmd` → `05_aesthetics_avanzate.qmd`
2. Update title, subtitle, content
3. Keep same structure: Objectives → Exercises → Intro → 6 Chapters → Resources
4. Keep transition slides ("Adesso tocca a te!")

5. Copy `04_geometrie_base_exercises.R` → `05_aesthetics_avanzate_exercises.R`
6. Update header
7. Write 30 new exercises in 6 parts
8. Match exercise topics to presentation chapters

9. Copy `05_aesthetics_avanzate_exercises.R` → `05_aesthetics_avanzate_exercises_SOLUTIONS.R`
10. Update header
11. Fill in all solutions
12. Test all code

**Estimated time:** 4-6 hours per complete chapter set

---

## 📝 Notes & Tips

- **Consistency is key**: Students should recognize the pattern across all chapters
- **Test everything**: Run all code before distributing
- **Timing**: Plan ~90 minutes per chapter in workshop (theory + practice)
- **Flexibility**: Adjust exercise count per chapter needs (can be 25-35)
- **Feedback**: Collect student feedback to improve future chapters
- **Updates**: Version control all files, note changes in git commits

---

**Document Version:** 1.0  
**Last Updated:** 27 October 2025  
**Based on:** Chapter 04 - Geometrie Base  
**For use in:** REVELO Training - Data Viz 2025 Course
