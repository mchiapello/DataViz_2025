# Course Materials Structure Template
## REVELO Training - Data Viz 2025

This document describes the standard structure for course chapter materials. Each chapter follows a consistent four-file pattern: presentation, student exercises (empty), scaffolded exercises (with hints), and instructor solutions.

---

## 📁 File Structure Overview

Each course chapter consists of **4 coordinated files**:

1. **`XX_topic_name.qmd`** - Quarto RevealJS presentation (theory + live demos)
2. **`XX_topic_name_exercises.R`** - Student R script with empty exercises (blank)
3. **`XX_topic_name_exercises_SCAFFOLD.R`** - Student R script with code hints and blanks (`___`)
4. **`XX_topic_name_exercises_SOLUTIONS.R`** - Instructor R script with complete solutions

Where `XX` = chapter number (e.g., `07_facets_coordinate`)

### File Purpose Summary

- **`.qmd`**: Interactive slides for teaching concepts
- **`_exercises.R`**: Blank template for students who want minimal guidance
- **`_exercises_SCAFFOLD.R`**: Partial code with `___` blanks for guided learning
- **`_SOLUTIONS.R`**: Complete working code for instructor/review

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

## 2️⃣ Student Exercise File - Blank Version (`XX_topic_name_exercises.R`)

### Purpose
Hands-on practice script where students write code **from scratch** to complete 30 exercises. Provides no code hints, only objectives.

### Format
- **Type**: R script (`.R`)
- **Execution**: Run line-by-line or section-by-section in RStudio
- **Difficulty**: Higher - requires students to remember syntax

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

**Part structure (blank version):**
```r
# =============================================================================
# PARTE X: SECTION NAME
# =============================================================================

# ESERCIZIO N: Title --------------------------------------------------------
# Obiettivo: [Clear description of what to accomplish]
# Dataset: [dataset name if specific]

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

### Key Principles (Blank Version)

1. **Empty space**: 3-4 blank lines for student code
2. **Clear objectives**: Each exercise has specific goal in Italian
3. **Progressive difficulty**: Basic → Advanced within each part
4. **Self-contained**: Can be worked through independently
5. **No code hints**: Students must write everything from scratch
6. **Dataset hints**: When specific dataset needed, mentioned in comment

---

## 3️⃣ Student Exercise File - Scaffold Version (`XX_topic_name_exercises_SCAFFOLD.R`)

### Purpose
Guided practice script with **partial code** and `___` blanks for students to fill in. Provides structure while requiring students to complete key parts.

### Format
- **Type**: R script (`.R`)
- **Execution**: Run line-by-line or section-by-section in RStudio
- **Difficulty**: Medium - provides syntax hints and structure

### Structure

#### Header Block
**Identical to blank version** - same instructions.

#### Setup Section
**Identical to blank version** - same libraries and datasets.

#### Exercise Blocks (30 total, organized in 6 parts)

**Part structure (scaffold version):**
```r
# =============================================================================
# PARTE X: SECTION NAME
# =============================================================================

# ESERCIZIO N: Title --------------------------------------------------------
# Obiettivo: [Clear description of what to accomplish]
# Dataset: [dataset name if specific]

ggplot(___, aes(x = ___, y = ___)) +
  ___() +
  ___(~ ___)

# [Optional: Teaching note explaining concept]
```

**Examples of scaffolding:**

**Basic function call:**
```r
# ESERCIZIO 3: Histogram con Facet
# Obiettivo: Histogram di hwy, facet per drv (tipo trazione)
#            bins = 15

ggplot(mpg, aes(x = hwy)) +
  ___(bins = ___, fill = "steelblue", color = "black") +
  facet_wrap(~ ___)
```

**Multiple approaches:**
```r
# ESERCIZIO 7: Grid Solo Righe
# Obiettivo: Boxplot di class vs hwy
#            Facet grid solo righe per year

ggplot(mpg, aes(x = class, y = hwy)) +
  geom_boxplot() +
  facet_grid(rows = vars(___))

# Alternativa con formula:
ggplot(mpg, aes(x = class, y = hwy)) +
  geom_boxplot() +
  facet_grid(___ ~ .)
```

**Teaching notes:**
```r
# ESERCIZIO 15: Quando NON Usare Free Scales
# Obiettivo: Bar plot count di class, facet per year
#            Confronta scales

# Scales fixed (MIGLIORE per confronti):
ggplot(mpg, aes(x = class)) +
  geom_bar(fill = "steelblue") +
  facet_wrap(~ year, scales = "___")

# Scales free_y (INGANNA - sembra simile conteggio):
ggplot(mpg, aes(x = class)) +
  geom_bar(fill = "coral") +
  facet_wrap(~ year, scales = "___")

# Conclusione: per confrontare magnitudini, usa scales fisse!
```

#### Footer Block
**Identical to blank version** - same encouragement and next steps.

### Key Principles (Scaffold Version)

1. **Partial code**: Provide structure, require students to fill key parts
2. **`___` blanks**: Clear indicators where student input needed
3. **Function names given**: Focus on arguments and parameters
4. **Teaching notes**: Inline comments explain concepts or warn about pitfalls
5. **Multiple approaches**: Show alternative syntax when relevant
6. **Progressive scaffolding**: Less guidance in later exercises

### Scaffolding Strategy

**High scaffolding (early exercises):**
- Provide full `ggplot()` call structure
- Show parameter names
- Only blank out variable names and key values

**Medium scaffolding (middle exercises):**
- Provide function names but blank out more arguments
- Require students to remember parameter names

**Low scaffolding (later exercises):**
- Provide minimal structure
- Require students to complete larger code sections

---

## 4️⃣ Solutions File (`XX_topic_name_exercises_SOLUTIONS.R`)

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
2. **Same structure**: Mirrors student files exactly (parts, numbering, objectives)
3. **Educational comments**: Interpretations, insights, comparisons
4. **Error-free**: All code tested and verified
5. **Best practices**: Summary section with key takeaways

---

## 🔗 File Relationships & Dependencies

### Cross-File Consistency

**Exercise numbering:**
- Presentation mentions "30 esercizi organizzati in 6 parti"
- Blank exercises file has exactly 30 exercises in 6 parts
- Scaffold file has same 30 exercises with partial code
- Solutions file has same 30 exercises with complete code

**Content mapping:**
```
Presentation Chapter 1 → Exercises Part 1 → Scaffold Part 1 → Solutions Part 1
Presentation Chapter 2 → Exercises Part 2 → Scaffold Part 2 → Solutions Part 2
...etc
```

**Datasets:**
All four files use same datasets:
- `mpg` (234 rows) - car fuel economy
- `diamonds` (53,940 rows) - diamond characteristics
- `economics` (574 rows) - US economic time series
- `faithful` (272 rows) - Old Faithful geyser eruptions

**Packages:**
All four files require:
- `ggplot2` (core)
- `dplyr` (data manipulation)
- Optional packages as needed (e.g., `hexbin` for geom_hex, `lubridate` for dates)

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
   - Students choose blank OR scaffold file
   - Advanced students: blank version (no hints)
   - Beginners: scaffold version (guided)
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
- [ ] Slide 2: Esercizi Pratici with download links for BOTH exercise files
- [ ] Intro slide explaining core concept
- [ ] 6 chapter sections (adjust number as needed)
- [ ] Each chapter has 1-3 concept slides
- [ ] Transition slide after each chapter ("Adesso tocca a te!")
- [ ] All slides have background attributes
- [ ] Code blocks use plain R syntax (no `{r}`)
- [ ] Final slide: Risorse & Prossimi Passi
- [ ] Renders without errors: `quarto preview XX_topic.qmd`

### Student Exercise File - Blank Version
- [ ] Header with instructions
- [ ] Setup section with libraries and data()
- [ ] 30 exercises organized in 6 parts
- [ ] Each exercise has clear objective in Italian
- [ ] Dataset comment when specific dataset needed
- [ ] 3-4 blank lines for student code
- [ ] NO code hints or templates
- [ ] Data preparation exercises include data creation code only
- [ ] Footer with encouragement and next steps
- [ ] Structure identical to scaffold version

### Student Exercise File - Scaffold Version
- [ ] Header identical to blank version
- [ ] Setup identical to blank version
- [ ] 30 exercises organized in 6 parts (same structure)
- [ ] Each exercise has objectives identical to blank version
- [ ] Partial code with `___` blanks for key parts
- [ ] Teaching notes inline where helpful
- [ ] Alternative approaches shown when relevant
- [ ] Progressive scaffolding (more → less help)
- [ ] Footer identical to blank version
- [ ] All scaffold code syntactically valid (can run with blanks filled)

### Solutions File
- [ ] Header warns against early distribution
- [ ] Setup identical to exercise files
- [ ] All 30 exercises with complete working code
- [ ] Objectives copied exactly from exercise files
- [ ] Interpretive comments where helpful
- [ ] Handles optional package installation
- [ ] Footer with best practices recap
- [ ] All code tested and error-free
- [ ] Exact same structure as exercise files

### Cross-File Consistency
- [ ] Exercise count matches presentation claim (usually 30)
- [ ] Part names match across all 4 files
- [ ] Datasets match across all 4 files
- [ ] Numbering is consistent (1-30) across all files
- [ ] Objectives are identical in blank, scaffold, and solutions
- [ ] Concepts in presentation match exercise topics
- [ ] Scaffold code → complete code in solutions (no gaps)
- [ ] Blank version has NO code where scaffold has templates

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
XX_topic_name.qmd                      # Presentation
XX_topic_name_exercises.R              # Student exercises (blank)
XX_topic_name_exercises_SCAFFOLD.R     # Student exercises (with hints)
XX_topic_name_exercises_SOLUTIONS.R    # Instructor solutions
```

**Where:**
- `XX` = Two-digit chapter number (01, 02, 03, ...)
- `topic_name` = Snake_case topic identifier
- All lowercase, underscores for spaces
- `_SCAFFOLD` suffix indicates guided version
- `_SOLUTIONS` suffix indicates complete answers

**Examples:**
```
07_facets_coordinate.qmd
07_facets_coordinate_exercises.R
07_facets_coordinate_exercises_SCAFFOLD.R
07_facets_coordinate_exercises_SOLUTIONS.R

08_scale_trasformazioni.qmd
08_scale_trasformazioni_exercises.R
08_scale_trasformazioni_exercises_SCAFFOLD.R
08_scale_trasformazioni_exercises_SOLUTIONS.R
```

---

## 🔄 Workflow for Creating New Chapter

1. **Plan content**
   - Identify 6 main categories/sections
   - List 30 specific skills/techniques to practice
   - Gather example datasets

2. **Create presentation** (`XX_topic.qmd`)
   - Copy template header from existing chapter
   - Write objective and exercise overview slides
   - Mention BOTH exercise files in slide 2
   - Create 6 chapters with theory content
   - Add transition slides between chapters
   - Create closing slide with resources

3. **Create blank exercises** (`XX_topic_exercises.R`)
   - Copy header and setup from existing chapter
   - Write 30 exercises (5 per part)
   - Ensure clear objectives with Dataset comments
   - Leave 3-4 blank lines for code
   - NO code hints or templates
   - Add data preparation where needed

4. **Create scaffold exercises** (`XX_topic_exercises_SCAFFOLD.R`)
   - Copy structure from blank file (same header, setup, objectives)
   - Add partial code with `___` blanks
   - Include teaching notes inline
   - Show alternative approaches where relevant
   - Ensure progressive scaffolding (less help over time)
   - Keep footer identical to blank version

5. **Create solutions** (`XX_topic_exercises_SOLUTIONS.R`)
   - Copy structure from exercise files
   - Fill in ALL code solutions
   - Test EVERY exercise to ensure it runs
   - Add interpretive comments
   - Write best practices summary

6. **Test & verify**
   - Render presentation: `quarto preview XX_topic.qmd`
   - Run all solution code to verify it works
   - Verify scaffold code is syntactically valid
   - Check consistency: numbering, datasets, packages across all 4 files
   - Ensure objectives match exactly in blank, scaffold, and solutions
   - Review for typos and clarity

7. **Package for distribution**
   - Presentation HTML (generated by Quarto)
   - Blank exercises R file
   - Scaffold exercises R file
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

## 🚀 Quick Reference: Creating Chapter 08

To create materials for chapter 08 (example: Scale Trasformazioni):

1. Copy `07_facets_coordinate.qmd` → `08_scale_trasformazioni.qmd`
2. Update title, subtitle, content
3. Keep same structure: Objectives → Exercises → Intro → 6 Chapters → Resources
4. Keep transition slides ("Adesso tocca a te!")
5. Update slide 2 to link to both exercise files

6. Copy `07_facets_coordinate_exercises.R` → `08_scale_trasformazioni_exercises.R`
7. Update header
8. Write 30 new exercises in 6 parts (blank version - no code)
9. Match exercise topics to presentation chapters

10. Copy `08_scale_trasformazioni_exercises.R` → `08_scale_trasformazioni_exercises_SCAFFOLD.R`
11. Keep header and objectives identical
12. Add partial code with `___` blanks
13. Add teaching notes inline
14. Ensure progressive scaffolding

15. Copy `08_scale_trasformazioni_exercises.R` → `08_scale_trasformazioni_exercises_SOLUTIONS.R`
16. Update header (warn against early distribution)
17. Fill in all solutions
18. Test all code

**Estimated time:** 6-8 hours per complete chapter set (4 files)

---

## 📝 Notes & Tips

- **Consistency is key**: Students should recognize the pattern across all chapters
- **Test everything**: Run all code before distributing
- **Timing**: Plan ~90 minutes per chapter in workshop (theory + practice)
- **Flexibility**: Adjust exercise count per chapter needs (can be 25-35)
- **Student choice**: Let students pick blank OR scaffold based on skill level
- **Scaffolding philosophy**: Provide just enough help to keep students moving, not full solutions
- **Feedback**: Collect student feedback to improve future chapters
- **Updates**: Version control all files, note changes in git commits

### Blank vs Scaffold Decision Guide

**Use Blank Version when:**
- Students have prior ggplot2 experience
- Focus is on problem-solving, not syntax learning
- Students are comfortable with R documentation
- Workshop has adequate time for struggling/exploration

**Use Scaffold Version when:**
- Students are new to ggplot2
- Syntax is complex or has many parameters
- Limited time and must cover all exercises
- Students need confidence boost with partial success

**Best Practice:** Offer both, let students choose based on comfort level. Advanced students often start with blank and switch to scaffold if stuck.

---

**Document Version:** 2.0  
**Last Updated:** 24 November 2025  
**Based on:** Chapter 07 - Facets e Coordinate  
**For use in:** REVELO Training - Data Viz 2025 Course
