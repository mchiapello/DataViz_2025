# 🧭 Project Blueprint for LLMs

Use this document as the authoritative blueprint to synthesize a new Quarto-based training site that mirrors the structure of this repository while remaining agnostic to specific course content. Follow the guidance below when generating a fresh project.

---

## 1. Goal
Create a modular Quarto website project with:
- Consistent navigation and styling across pages.
- A multi-module teaching structure (presentations plus three exercise variants).
- Ready-to-render output via `quarto preview` and `quarto render`.
- Neutral, reusable placeholder content that can later be replaced with domain-specific material.

---

## 2. High-Level Tasks
1. Scaffold the root directory and metadata files.
2. Configure Quarto project settings.
3. Provide base pages (home, setup, resources) with generic placeholders.
4. Build the `materials/` folder with module templates and exercise variants.
5. Include shared assets (images, data placeholders, CSS, transcripts if needed).
6. Produce deployment-ready build directories (`docs/`, `_freeze/`).

---

## 3. Target Directory Layout
```
Course/
├── _quarto.yml
├── index.qmd
├── README.md
├── resources.qmd
├── setup.qmd
├── styles.css
├── SETUP_GUIDE.md
├── STRUCTURE.md
├── DataViz_Course.Rproj
├── .Rprofile
├── .gitignore
├── .nojekyll
├── .quarto/
├── _freeze/
├── docs/
├── materials/
│   ├── day1.qmd
│   ├── day2.qmd
│   ├── EXERCISES_README.md
│   ├── TEMPLATE_STRUCTURE.md
│   ├── presentation-style.css
│   ├── data/
│   │   └── placeholder datasets & scripts
│   ├── images/
│   │   └── placeholder images/logos
│   └── Module bundles (01–NN)
│       ├── 01_topic.qmd
│       ├── 01_topic_exercises.R
│       ├── 01_topic_exercises_SCAFFOLD.R
│       └── 01_topic_exercises_SOLUTIONS.R
└── transcripts/
    └── optional reference transcripts or notes
```
Notes:
- `_freeze/` and `docs/` are generated after rendering but list them so consuming agents expect their presence.
- Module count (`NN`) can be adjusted; retain the triad of exercise files per module when exercises are required.
- `.quarto/` is used by Quarto for project metadata and extensions; it is typically auto-managed. Include `_extensions/` here only if you add custom or third-party extensions.

---

## 4. Root-Level File Requirements

### Core Configuration Files

#### `_quarto.yml`
Main project configuration with these required sections:

```yaml
project:
  type: website
  output-dir: docs

website:
  title: "COURSE_TITLE"
  navbar:
    background: primary
    left:
      - text: "Home"
        href: index.qmd
      - text: "Materials"
        menu:
          - text: "---Day 1---"
          - text: "Module 01 Title"
            href: materials/01_topic.qmd
          # Additional modules...
      - text: "Resources"
        href: resources.qmd
      - text: "Setup"
        href: setup.qmd
    right:
      - icon: github
        href: https://github.com/REPO_URL
  page-footer:
    left: |
      Built with ❤️, [R](https://cran.r-project.org/) and [Quarto](https://quarto.org/) by INSTRUCTOR_NAME.
    right: |
      © YEAR ORGANIZATION

format:
  html:
    theme: 
      light: cosmo
      dark: darkly
    css: styles.css
    toc: true
    toc-depth: 3
    code-copy: true
    code-fold: false
    fig-width: 8
    fig-height: 6

execute:
  freeze: auto
```

#### `index.qmd`
Landing page with:
- Course title and hero image
- Location/logistics section
- Two-day schedule table (use columns layout)
- Learning objectives list
- Prerequisites
- Basic setup instructions with links to detailed `setup.qmd`

Template structure:
```yaml
---
title: "COURSE_TITLE"
author: "INSTRUCTOR_NAME"
---

![](materials/images/logo.png){width=550px fig-align="center"}

## Location {#location}
VENUE_INFO

## Schedule {#schedule}
::: {.columns}
::: {.column width="48%"}
### Day 1
| Time | Topic |
|------|-------|
| 9:30 | [Module 01](materials/01_topic.qmd) |
:::
::: {.column width="48%"}
### Day 2
| Time | Topic |
|------|-------|
| 9:30 | [Module 06](materials/06_topic.qmd) |
:::
:::
```

#### `setup.qmd`
Environment setup with:
- Software installation instructions (R, RStudio, Quarto)
- Package installation code blocks
- Verification scripts
- Troubleshooting common issues
- Pre-course checklist

#### `resources.qmd`
Resource hub with:
- Table of module files (presentations + exercise variants)
- External documentation links
- Books/tutorials
- Dataset sources
- Community/support links

Example table stub:

```markdown
## Module Files

| Module | Slides | Blank | Scaffold | Solutions |
|--------|--------|-------|----------|-----------|
| Module 01 | [01_topic.qmd](materials/01_topic.qmd) | [01_topic_exercises.R](materials/01_topic_exercises.R) | [01_topic_exercises_SCAFFOLD.R](materials/01_topic_exercises_SCAFFOLD.R) | [01_topic_exercises_SOLUTIONS.R](materials/01_topic_exercises_SOLUTIONS.R) |
| Module 02 | [02_topic.qmd](materials/02_topic.qmd) | [02_topic_exercises.R](materials/02_topic_exercises.R) | [02_topic_exercises_SCAFFOLD.R](materials/02_topic_exercises_SCAFFOLD.R) | [02_topic_exercises_SOLUTIONS.R](materials/02_topic_exercises_SOLUTIONS.R) |
```

#### `styles.css`
Site-wide styling for:
- Typography (font families, sizes)
- Color scheme tokens
- Callout box styling
- Code block appearance
- Table formatting
- Responsive design rules

#### Documentation Files

| File | Purpose | Content |
|------|---------|---------|
| `SETUP_GUIDE.md` | (This file) | LLM blueprint - keep unchanged |
| `STRUCTURE.md` | Directory tree snapshot | Auto-update with structure changes |
| `README.md` | Quick-start guide | Clone, preview, render, deploy instructions |

#### Environment Files

| File | Purpose | Content |
|------|---------|---------|
| `.Rprofile` | R session config | Library loading, option setting (commented) |
| `.gitignore` | Git exclusions | `_freeze/`, `docs/`, `.DS_Store`, `.Rhistory`, `*.Rproj.user` |
| `.nojekyll` | GitHub Pages | Empty file to bypass Jekyll processing |
| `*.Rproj` | RStudio project | Default project settings (use_renv: no) |

Sample environment file templates:

```gitignore
# Quarto build artifacts
_freeze/
docs/
site_libs/

# R/RStudio
.Rhistory
.RData
.Rproj.user/

# macOS
.DS_Store
```

```r
# .Rprofile (minimal example)

options(stringsAsFactors = FALSE)

# Uncomment to set a default CRAN repo
# options(repos = c(CRAN = "https://cloud.r-project.org"))

# Uncomment to pre-load common libraries
# suppressPackageStartupMessages({
#   library(tidyverse)
# })
```

```ini
# DataViz_Course.Rproj (minimal)
Version: 1.0

RestoreWorkspace: No
SaveWorkspace: No
AlwaysSaveHistory: Default

EnableCodeIndexing: Yes
UseSpacesForTab: Yes
NumSpacesForTab: 2
Encoding: UTF-8

RnwWeave: knitr
LaTeX: pdfLaTeX
```

---

## 5. Module Template Specification (`materials/`)

Each module entry uses numeric prefixes (`01_`, `02_`, …) to preserve ordering.

### Day Aggregation Pages

Create summary pages for multi-day courses:

**`day1.qmd` / `day2.qmd`**
- RevealJS or standard HTML format
- List of modules for that day
- Links to slide PDFs (if separate) and R scripts
- Day-specific learning objectives
- "Back to Home" navigation button

Example structure:
```yaml
---
title: "Day 1 - Course Foundations"
format: 
  revealjs:
    css: presentation-style.css
---

::: {.home-button}
[🏠 Back to Home](../index.html)
:::

## Materials
### Slides
- [Module 01](01_topic.qmd)
- [Module 02](02_topic.qmd)

### Scripts
- [01_topic_exercises.R](01_topic_exercises.R)
```

### Presentation Files (`XX_topic.qmd`)

RevealJS presentation with complete YAML header:

```yaml
---
title: "Topic Name"
subtitle: "Hands-on Workshop"
author: "INSTRUCTOR_NAME"
format: 
  revealjs:
    theme: simple
    transition: slide
    slide-number: true
    chalkboard: true
    logo: images/logo.jpg
    footer: "ORGANIZATION - COURSE_NAME YEAR"
    css: presentation-style.css
    title-slide-attributes:
      data-background-image: images/background.jpg
      data-background-size: cover
      data-background-opacity: "0.1"
    menu:
      side: left
      width: normal
      numbers: true
    include-after-body: 
      text: |
        <div class="home-button" style="position: fixed; top: 10px; left: 10px; z-index: 100;">
          <a href="SITE_URL" style="padding: 10px 20px; background-color: #4CAF50; color: white; text-decoration: none; border-radius: 5px; font-size: 16px;">⌂ Home</a>
        </div>
resources:
  - images/
  - presentation-style.css
---
```

**Content structure:**
- Objectives slide with learning goals
- Exercise download links (blank + scaffold variants)
- Theory sections with callouts (`.callout-note`, `.callout-tip`, `.callout-important`)
- Code examples in fenced blocks with syntax highlighting
- Column layouts for side-by-side content
- "Now you try!" practice slides between sections
- Background images on section dividers

### Exercise Files

All three variants share:
- **Header block** with course info, exercise count, part breakdown
- **Setup section** with library loading and data preparation
- **Part dividers** using comment blocks
- **Exercise numbering** in format `## Exercise n.m` (part.number)
- **Objective descriptions** clearly stating what to build

#### Standard Header Template

```r
# =============================================================================
# EXERCISES: Topic Name
# ORGANIZATION - COURSE_NAME YEAR
# =============================================================================
# 
# Instructions:
# - Complete each exercise by writing the required code
# - Run code to verify it works
# - Compare with solutions after the course
# - Experiment with variations!
#
# =============================================================================

# SETUP -----------------------------------------------------------------------
library(PACKAGE_NAME)

# Load datasets
data(DATASET_NAME)


# =============================================================================
# PART 1: SECTION_NAME (N exercises)
# =============================================================================

# EXERCISE 1.1: Title ---------------------------------------------------------
# Objective: Detailed description of what to create
# Dataset: DATASET_NAME
```

#### Variant-Specific Content

| Variant | File Pattern | Content Style |
|---------|-------------|---------------|
| **Blank** | `XX_topic_exercises.R` | Exercise headers + objectives only, empty code blocks for students to fill |
| **Scaffold** | `XX_topic_exercises_SCAFFOLD.R` | Partial code with `___` placeholders for key arguments, includes `## Solution n.m:` comments before code |
| **Solutions** | `XX_topic_exercises_SOLUTIONS.R` | Complete working code with inline comments explaining choices, includes `## Solution n.m:` headers |

**Exercise count consistency:**
- Header declares total (e.g., "30 exercises")
- Part breakdown sums to total (e.g., "Part 1 (5), Part 2 (5)...")
- All three variants have identical numbering
- If exercises removed: update counts in all files + headers

#### Exercise Creation Workflow (Self-Contained)

Follow this order to create the triad. Do not rely on any external files.

1) Create `XX_topic_exercises_SOLUTIONS.R` (full solutions):
  - Include complete, working code for every exercise.
  - Explicitly refer to the module presentation `XX_topic.qmd` for context and scope alignment; solutions should support and be consistent with the content in that presentation.
  - Do not anticipate topics from future modules: only use concepts introduced up to and including this module.
  - Keep dependencies minimal; prefer tidyverse packages explicitly introduced in the current/previous modules (e.g., ggplot2, dplyr, tidyr).
  - Ensure deterministic outputs (e.g., `set.seed(...)` for randomness).
  - Use the standard header template and consistent numbering (`## EXERCISE n.m`).

2) Create `XX_topic_exercises.R` (blank):
  - Start from the SOLUTIONS file and keep the header, part dividers, exercise titles, and objectives.
  - Remove all solution code, leaving empty code regions (commented placeholders are fine).
  - Preserve numbering and dataset references.

3) Create `XX_topic_exercises_SCAFFOLD.R` (guided):
  - Start from the SOLUTIONS file and replace key arguments with `___` placeholders while keeping function calls and pipeline structure intact.
  - Add `## Solution n.m:` comment markers immediately before each scaffolded code chunk.
  - Preserve the header, part dividers, numbering, and dataset references.

Key placeholder guidelines (what to blank out):
- Aesthetics: mappings inside `aes(...)` such as `x`, `y`, `color`, `fill`, `size`, `shape`.
- Geoms: blank the geom function name (e.g., `geom_point` → `___`) and key parameters like `alpha`, `size`, `position`, `bins`, `binwidth`, `stat`.
- Facets: variables in `facet_wrap(~ ...)` and `facet_grid(... ~ ...)`.
- Scales: `limits`, `breaks`, `labels`, and transformations.
- Coordinates: parameters to `coord_*` functions (e.g., `xlim`, `ylim`).
- dplyr/tidyr: arguments to `filter`, `mutate`, `summarise`, `group_by`, `pivot_*`.
- Labels: values in `labs(title=, subtitle=, x=, y=, color=, fill=, caption=)`.

Do not blank:
- Function names except geoms (`ggplot`, `facet_wrap`, `filter`, etc.).
- Overall pipeline structure (`%>%`), or object/dataset names used in the module.

Example transformation (one exercise):

Solution variant:
```r
## EXERCISE 1.1: Scatter plot
# Objective: Plot highway efficiency vs. engine displacement, colored by class, faceted by drive.

library(ggplot2)
ggplot(mpg, aes(displ, hwy, color = class)) +
  geom_point(alpha = 0.6, size = 2) +
  facet_wrap(~ drv) +
  labs(title = "Efficiency vs Displacement",
     x = "Engine Displacement",
     y = "Highway MPG",
     color = "Class")
```

Scaffold variant (derived from Solutions):
```r
## EXERCISE 1.1: Scatter plot
# Objective: Plot highway efficiency vs. engine displacement, colored by class, faceted by drive.
## Solution 1.1:

library(ggplot2)
ggplot(mpg, aes(___, ___, color = ___)) +
  ___(alpha = ___, size = ___) +
  facet_wrap(~ ___) +
  labs(title = "___",
     x = "___",
     y = "___",
     color = "___")
```

Blank variant:
```r
## EXERCISE 1.1: Scatter plot
# Objective: Plot highway efficiency vs. engine displacement, colored by class, faceted by drive.

# (Write your code here)
```

Consistency rules:
- Numbering (`n.m`) must match across all three files.
- The SOLUTIONS file is the source of truth; derive Blank and Scaffold from it.
- After changes (add/remove exercises), update totals and part counts in headers across the triad.

### Shared Documentation

#### `EXERCISES_README.md`
Explains the three-file approach:
- Blank vs Scaffold decision guide
- When to use each variant
- How files relate to presentations
- File naming conventions

#### `TEMPLATE_STRUCTURE.md`
Documents the four-file pattern in depth:
- Presentation structure and YAML
- Exercise header format
- Part organization rules
- Numbering conventions
- Update procedures

Note: This guide is self-sufficient. If `EXERCISES_README.md` or `TEMPLATE_STRUCTURE.md` are missing, follow the exercise creation workflow above.

---

## 6. Data & Assets

### `materials/data/`
Provide example datasets and generation scripts:

**Dataset Scripts** (e.g., `create_custom_dataset.R`):
```r
# =============================================================================
# Script to Generate DATASET_NAME
# =============================================================================
# 
# This script generates a simulated dataset for MODULE_NAME exercises.
#
# Dataset includes:
# - N observations
# - Variables: var1, var2, var3...
# - Purpose: Demonstrate CONCEPT
#
# =============================================================================

library(dplyr)

set.seed(SEED_NUMBER)

# Generate data
dataset_name <- data.frame(
  id = 1:N,
  var1 = rnorm(N, mean = 0, sd = 1),
  var2 = sample(c("A", "B", "C"), N, replace = TRUE)
) %>%
  mutate(
    var3 = var1 * 2 + rnorm(N, 0, 0.5)
  )

# Summary
cat("\n=== DATASET SUMMARY ===\n")
cat("Total observations:", nrow(dataset_name), "\n")
print(summary(dataset_name))

# Save in dual format
saveRDS(dataset_name, "dataset_name.rds")
write.csv(dataset_name, "dataset_name.csv", row.names = FALSE)
cat("\n✓ Dataset saved as 'dataset_name.rds' and 'dataset_name.csv'\n")

# Usage example
# dataset <- readRDS("materials/data/dataset_name.rds")
# # or
# dataset <- read.csv("materials/data/dataset_name.csv")
```

**Placeholder Files:**
- Example spreadsheets (`.xlsx`, `.xls`) for data cleaning exercises
- Sample CSVs with realistic structure
- Small datasets that don't require external downloads

### `materials/images/`
Visual assets with neutral/placeholder content:

**Required:**
- `logo.svg` or `logo.png` - Course/organization logo (550px recommended for index page)
- `background.jpg` - Presentation background image (1280px wide recommended)

**Optional:**
- Diagram images (`.png`, `.jpg`)
- Screenshot placeholders
- Icon sets

**Naming conventions:**
- Use descriptive names: `workflow_diagram.png`, not `img1.png`
- Include dimensions in filename if fixed-size: `banner_1200x400.jpg`
- Use lowercase with underscores: `concept_map.png`

### `materials/presentation-style.css`
RevealJS-specific styling overrides:

```css
/* Custom presentation styles */

/* Home button positioning */
.home-button {
  position: fixed;
  top: 10px;
  left: 10px;
  z-index: 100;
}

/* Slide backgrounds */
.reveal section {
  background-size: cover;
  background-position: center;
}

/* Callout boxes */
.callout-note {
  border-left: 4px solid #3498db;
  background-color: #e8f4f8;
}

.callout-tip {
  border-left: 4px solid #2ecc71;
  background-color: #e8f8f5;
}

.callout-important {
  border-left: 4px solid #e74c3c;
  background-color: #fdf2f2;
}

/* Code styling */
.reveal pre code {
  max-height: 500px;
  font-size: 0.85em;
}

/* Column layouts */
.columns {
  display: flex;
  gap: 2rem;
}
```

### `transcripts/` (Optional)
Reference materials for content development:

- Workshop transcripts (`.txt`, `.md`)
- Video subtitle files (`.vtt`, `.srt`)
- Source documentation
- Analysis scripts (Python/R for processing transcripts)

**Purpose:** Keep original source materials that informed course content, useful for updates or context.

---

## 7. Content Neutrality Rules
- Replace domain-specific names with placeholders (e.g., `INSTRUCTOR_NAME`, `COURSE_YEAR`).
- Use generic module titles such as "Module 01 – Topic Title".
- Provide example code blocks with comments like `# TODO: insert domain-specific example`.
- Avoid referencing proprietary datasets; show how to attach placeholders that can be replaced later.

---

## 8. Workflow & Automation Guidance
```bash
# Clone & enter project
git clone <repo-url>
cd <repo>/Course

# Preview locally with live reload
quarto preview

# Render static output (populate docs/)
quarto render

# Clean generated artifacts
quarto clean
```

When generating the project, ensure these commands succeed without additional configuration.

---

## 9. Validation Checklist

Use this checklist to verify a generated project meets all blueprint requirements:

### Structure Validation
- [ ] Root directory contains all core files (`_quarto.yml`, `index.qmd`, `setup.qmd`, `resources.qmd`, `README.md`, `SETUP_GUIDE.md`, `STRUCTURE.md`)
- [ ] Configuration files present (`.Rprofile`, `.gitignore`, `.nojekyll`, `.Rproj`)
- [ ] `styles.css` exists with base styling rules
- [ ] `materials/` folder created with proper subfolders

### Materials Structure
- [ ] At least 2 example modules demonstrating naming pattern (`01_topic.qmd`, `02_topic.qmd`)
- [ ] Each module has exercise triad (blank, scaffold, solutions) where applicable
- [ ] `day1.qmd` and `day2.qmd` aggregation pages present
- [ ] `EXERCISES_README.md` explains file variants
- [ ] `TEMPLATE_STRUCTURE.md` documents four-file pattern
- [ ] `presentation-style.css` contains RevealJS overrides

### Exercise File Validation
- [ ] All three variants use identical numbering (e.g., Exercise 1.1, 1.2...)
- [ ] Headers declare correct total exercise count
- [ ] Part breakdowns sum to total
- [ ] Blank version has empty code blocks
- [ ] Scaffold version includes `___` placeholders and partial code
- [ ] Solutions version has complete working code with comments
- [ ] All use standard header format (course name, year, instructions)

### Assets Validation
- [ ] `materials/data/` contains at least one example dataset or generation script
- [ ] Scripts save both `.rds` and `.csv` formats
- [ ] `materials/images/` has logo and background placeholders
- [ ] Image files use descriptive lowercase names with underscores
- [ ] Optional `transcripts/` folder present if source materials provided

### Configuration Validation
- [ ] `_quarto.yml` has valid YAML syntax
- [ ] Navbar links to all core pages and materials
- [ ] Theme configured (light/dark)
- [ ] Footer placeholders present
- [ ] `execute.freeze: auto` set for caching
- [ ] Module presentations include home button HTML in `include-after-body`
- [ ] Presentation YAML references `presentation-style.css` and `images/`

### Content Neutrality
- [ ] All instructor names use `INSTRUCTOR_NAME` placeholder
- [ ] Course titles use `COURSE_NAME` or generic titles
- [ ] Years use `YEAR` or `COURSE_YEAR` placeholder
- [ ] URLs use `SITE_URL`, `REPO_URL` placeholders
- [ ] Organizations use `ORGANIZATION` placeholder
- [ ] Dataset names use generic patterns (`DATASET_NAME`)
- [ ] Code examples include `# TODO: insert domain-specific example` comments

### Render Validation
- [ ] `quarto preview` command succeeds without errors
- [ ] `quarto render` generates `docs/` directory
- [ ] `docs/` contains `.html` files for all `.qmd` sources
- [ ] `search.json` generated for site search
- [ ] `site_libs/` directory present with dependencies
- [ ] `_freeze/` directory created with execution cache
- [ ] All presentations render as RevealJS slides
- [ ] Navigation links functional in preview

### Documentation Validation
- [ ] `README.md` includes clone, preview, render commands
- [ ] `STRUCTURE.md` accurately reflects generated directory tree
- [ ] `SETUP_GUIDE.md` (this file) copied verbatim
- [ ] `resources.qmd` has table linking to all module files
- [ ] `setup.qmd` includes package installation instructions

### Git Validation (if version controlled)
- [ ] `.gitignore` excludes `_freeze/`, `docs/`, `*.Rproj.user`, `.DS_Store`, `.Rhistory`
- [ ] `.nojekyll` file present for GitHub Pages
- [ ] Initial commit includes all source files
- [ ] `docs/` folder committed for GitHub Pages deployment

---

---

## 10. Extending the Blueprint

### When Structure Changes
If the project layout evolves (new asset types, different organization, additional template files), update both `STRUCTURE.md` and this blueprint document synchronously to keep LLM-generated projects aligned with the canonical structure.

### Adding New Components

**New asset folders** (e.g., `materials/scripts/`, `materials/slides/`):
1. Add to section 3 "Target Directory Layout" tree
2. Document purpose and content in section 6 "Data & Assets"
3. Update validation checklist section 9
4. Add example content structure/templates

**New file types** (e.g., `.ipynb` notebooks, `.Rmd` legacy files):
1. Add to section 5 "Module Template Specification"
2. Provide complete YAML/header template
3. Specify naming convention
4. Update `resources.qmd` linking example
5. Add to validation checklist

**New page types** (e.g., gallery, FAQ, syllabus):
1. Add to section 4 "Root-Level File Requirements" or appropriate materials section
2. Provide example structure and required sections
3. Add navbar link example in `_quarto.yml` template
4. Document in `README.md` suggested updates

### Version Control
- Update `STRUCTURE.md` immediately when directory tree changes
- Keep this `SETUP_GUIDE.md` as single source of truth for LLM generation
- Document breaking changes in `README.md` changelog section
- Increment version notes in this document header if major restructuring occurs

### Maintaining Neutrality
When adding examples:
- Always use placeholder names (`INSTRUCTOR_NAME`, `DATASET_NAME`, `MODULE_TITLE`)
- Provide generic content that works across domains
- Include comments like `# TODO: customize for your course`
- Keep code examples framework/library agnostic where possible
- Use widely available datasets (built-in R datasets, public domain data)

This ensures the blueprint remains useful for generating projects across different subject areas while preserving the pedagogical structure.
