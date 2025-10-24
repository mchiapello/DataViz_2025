# Complete Summary: Thomas Lin Pedersen's ggplot2 Workshop (Parts 1 & 2)

**Instructor**: Thomas Lin Pedersen (ggplot2 maintainer at RStudio/Posit)  
**Total Duration**: ~4.5 hours  
**Date**: April 2020 (Celebration R Conference - Corona Edition)  

**Videos**:
- Part 1: [Plotting Anything with ggplot2](https://www.youtube.com/watch?v=h29g21z0a68) (~2.5 hours)
- Part 2: [ggplot2 Extensions](https://www.youtube.com/watch?v=0m4yywqNPVY) (~2 hours)

---

## Workshop Overview

This comprehensive two-part workshop provides an in-depth exploration of ggplot2, taught by one of its main maintainers. The approach emphasizes **theoretical foundations first** (Grammar of Graphics), then practical implementation, and finally the rich **extension ecosystem**.

### Core Philosophy Across Both Parts
- **Theory first**: Understanding the grammar makes everything intuitive
- **Logic over memorization**: Learn the system, not individual functions
- **Reproducibility**: Keep everything in code
- **Composability**: Components work together seamlessly
- **Extensions**: ggplot2 is a platform, not just a package

---

# PART 1: Grammar of Graphics & Core ggplot2

## 1. The Grammar of Graphics (Theory)

### 1.1 Foundations
- **Grammar of Graphics** - theoretical framework by Leland Wilkinson (1999)
- Not about WHY (best practices) or beauty or algorithms
- **Focus**: How to design a system that can create any visualization

### 1.2 Core Philosophy
- The "gg" in ggplot2 stands for Grammar of Graphics
- Foundation for: ggplot2, Tableau (originally Polaris), Vega-lite
- Provides systematic way to think about plot construction

### 1.3 Key Concepts
- **Deconstruction of graphics** into reusable components
- All charts (bar, line, scatter) share common elements
- Elements: scales, coordinates, statistical transformations
- Components can be mixed and matched to create any visualization

---

## 2. ggplot2 Core Components

### 2.1 Layers and Geometries
**Geoms (geometries)**: Visual marks that represent data
- `geom_histogram()`, `geom_bar()`, `geom_line()`, `geom_point()`, etc.
- Multiple layers can be combined
- Each layer can have different geometries

### 2.2 Aesthetics (Mapping)
**Aesthetics**: Visual properties that can represent data
- Position (x, y)
- Color and fill
- Size, shape, line type
- Alpha (transparency)

**Critical Distinction - Mapping vs Setting**:
- **Mapping**: `aes(color = variable)` - maps data to aesthetic
- **Setting**: `color = "blue"` - fixed value

**Common Beginner Confusion - color vs fill**:
- `color`: stroke/outline color
- `fill`: interior color
- Histograms, bars → use `fill`
- Lines, points → use `color`

### 2.3 Scales
**Scale functions**: Control how data values map to visual values

Pattern: `scale_[aesthetic]_[type]()`
- `scale_color_continuous()`
- `scale_fill_discrete()`
- `scale_x_log10()`

**ColorBrewer integration**: `scale_color_brewer()`
- Qualitative palettes (categorical data)
- Diverging palettes
- Sequential palettes
- Named palettes: "Set1", "Set2", etc.

### 2.4 Statistical Transformations
Data transformations before plotting:
- Histograms: bin data and count
- Bar charts: count observations
- Smoothing lines: fit statistical models
- Most geoms have default stats
- Can be customized or bypassed

### 2.5 Facets (Small Multiples)
**Faceting**: Split data into multiple subplots

Powerful for:
- Decluttering complex visualizations
- Comparing subgroups
- Plot-driven data investigation
- Brain reuses visual patterns across panels
- Panel layout can carry meaning

### 2.6 Coordinates
**Coordinate system**: Physical mapping of aesthetics to display
- Different from scales
- Operates after scaling, before final rendering
- Types: Cartesian (default), Polar, Map projections
- The "fabric" you're plotting into

### 2.7 Position Adjustments
Modify position of elements within layer:
- `position = "stack"` (default for histograms/bars)
- `position = "identity"` (no adjustment)
- `position = "dodge"` (side-by-side)
- `position = "jitter"` (add random noise)
- Critical for overlapping data

### 2.8 Theming System
Complete control over non-data elements:
- `theme()` function for customization
- Built-in themes: `theme_minimal()`, `theme_classic()`, `theme_dark()`

**Element functions**:
- `element_text()` - text properties
- `element_line()` - line properties
- `element_rect()` - rectangle/background properties
- `element_blank()` - remove element

Can create completely custom looks and panel configurations.

---

## 3. Key Learning Principles from Part 1

### 3.1 Logic Over Memorization
Don't memorize every function - understand the **logic**:
- Want to change how data looks? → Look at **geoms**
- Want to change colors/sizes/scales? → Look at **scales**
- Want to change non-data elements? → Look at **themes**
- Want to split into subplots? → Look at **facets**

### 3.2 Composability
- Components are designed to work together
- Grammar allows systematic exploration
- Same principles apply across different visualization types

### 3.3 Theoretical Foundation Benefits
- Makes ggplot2 intuitive once you understand the logic
- Enables creation of novel visualizations
- Reduces cognitive load - understand the "why" behind the API

---

# PART 2: Extensions & Advanced Techniques

## 4. Plot Composition with Patchwork

### 4.1 Why Plot Composition?
- **Storytelling**: Single plots rarely tell the complete story
- **Multiple perspectives**: Show data from different angles
- **Coordinated views**: Related visualizations work together

### 4.2 Historical Solutions
- `grid.arrange()` from gridExtra
- `plot_grid()` from cowplot
- `ggarrange()` from ggpubr
- Faceting (hacky approach, not ideal)

### 4.3 Patchwork Package
**Thomas's recommendation** for modern plot composition:
- Most recent and intuitive solution
- Designed specifically for ggplot2

**Basic Syntax**:
```r
p1 + p2           # Side by side
p1 / p2           # Stacked vertically
p1 + p2 + p3      # Multiple plots
(p1 + p2) / p3    # Nested layouts
```

### 4.4 Advanced Layout Control
**Textual design specification**:
```r
layout <- "
AAB
AAC
DDC
"
p1 + p2 + p3 + p4 + plot_layout(design = layout)
```
- Letters/numbers define plot placement
- Matrix-like specification
- Extremely flexible for complex layouts

### 4.5 Fine-tuning
- `plot_layout()` controls overall composition
- Axis alignment options
- Manual scale matching: `scale_*_continuous(limits = ...)`
- Unified titles across multiple plots
- Subplot labeling (A, B, C, etc.)
- Legend management: collect, remove, or keep separate

### 4.6 Reproducibility Focus
- **Don't export to Illustrator** for composition
- Keep everything in code
- Fully reproducible workflows

---

## 5. Animation with gganimate

### 5.1 Why Animation?
- **Presentations**: Reveal information gradually
- **Exploring patterns**: Show change over time/states
- **Engagement**: More impactful than static plots
- **Understanding**: Transitions help comprehension

### 5.2 gganimate Philosophy
- Grammar-based approach (like ggplot2)
- Start with static ggplot
- Add animation layers
- Renders to GIF or video

### 5.3 Core Animation Concepts

**Transitions** - How data changes between states:
- `transition_states()` - discrete states
- `transition_time()` - continuous time
- `transition_reveal()` - progressive reveal
- `transition_filter()` - conditional display

**Views** - How plot window changes:
- Follow data transformations
- Zoom effects

**Shadows** - Show data history/future:
- Wake effects
- Trails

**Ease** - Control animation smoothness:
- Easing functions for natural motion

### 5.4 Practical Applications
- Time series: temporal evolution
- Presentations: build plots layer by layer
- Categorical changes: transition between groups
- Gradual reveals for storytelling

### 5.5 Rendering Options
- Outputs: GIF, MP4, other formats
- Control frame rate and resolution
- Embeddable in R Markdown/Quarto

---

## 6. Text Annotations with ggrepel

### 6.1 The Annotation Problem
- **Overlapping labels**: Common issue with geom_text
- **Manual positioning**: Tedious and non-reproducible
- **Illustrator dependence**: Want to avoid external tools

### 6.2 ggrepel Package Solution
**Key features**:
- `geom_text_repel()`: Automatic label positioning
- `geom_label_repel()`: Labels with backgrounds
- **Algorithm**: Pushes labels away from each other and points
- Connecting lines to original positions
- Constraints: keep within plot bounds

### 6.3 Customization
- Customizable repulsion force
- Bounding boxes
- Direction constraints (x-only, y-only)
- Segment styling (connecting lines)

### 6.4 Best Practices
- Start with ggrepel for automatic positioning
- Fine-tune with parameters if needed
- **Keep everything in code** for reproducibility
- Avoid manual Illustrator adjustments

---

## 7. Network Visualization with ggraph

### 7.1 Specialized Plot Types
**Beyond standard plots**:
- Trees and dendrograms
- Network/graph diagrams
- Hierarchical data
- Relational structures

### 7.2 Alternative Packages
- **ggtree**: Phylogenetic trees (biology focus)
- **ggdag**: Directed Acyclic Graphs
- **ggraph**: General-purpose networks (Thomas's package)

### 7.3 ggraph + tidygraph Workflow

**tidygraph**: Tidy manipulation of network data
- Works like dplyr but for graphs
- `mutate()`, `filter()` for networks
- Node and edge operations

**ggraph**: Visualization layer
- Built on ggplot2 principles
- Specialized geoms for networks

**Basic syntax**:
```r
ggraph(graph_object) +
  geom_edge_link() +      # Draw edges
  geom_node_point() +     # Draw nodes
  geom_node_text()        # Label nodes
```

### 7.4 Key Network Concepts

**Layouts** - How to position nodes:
- Force-directed
- Circular
- Tree layouts
- Manual positioning

**Edges** - Connection types:
- Straight links
- Arcs, diagonals
- Fan spreads (multiple edges)

**Nodes** - Point representations:
- Standard point geoms
- Custom shapes
- Labels and annotations

### 7.5 Integration with ggplot2
- ggraph creates ggplot2 objects
- Can use standard ggplot2 geoms
- Can use ggforce geoms (like `geom_mark_hull()`)
- Full theming and scale support

### 7.6 Example Applications
- Social networks (Zachary's Karate Club)
- Community detection coloring
- Group highlighting
- Edge weighting

---

## 8. Additional Tools: ggforce

### 8.1 ggforce Overview
"Grab bag" of useful extensions - not just one focus

### 8.2 Highlighting with Hulls
- `geom_mark_hull()`: Draw convex hulls around groups
- `geom_mark_circle()`: Circles around groups
- `geom_mark_ellipse()`: Ellipses around groups
- Automatic label placement
- Background highlighting

### 8.3 Additional Geometries
Various specialized geoms for specific visualization needs

---

## 9. The Extension Ecosystem

### 9.1 ggplot2 Extensions Gallery
- **URL**: https://exts.ggplot2.tidyverse.org/gallery/
- Curated list of extensions
- Categorized by function
- Not comprehensive but covers major packages

### 9.2 Extension Categories

**Themes & Aesthetics**:
- ggthemes, hrbrthemes, tvthemes

**Color Scales**:
- viridis, scico, paletteer

**New Geometries**:
- ggridges, ggbeeswarm

**Specialized Plots**:
- ggalluvial, treemapify

**Interactivity**:
- plotly, ggiraph

**Composition**:
- patchwork, cowplot

**Annotation**:
- ggrepel, ggforce

**Animation**:
- gganimate

**Networks & Trees**:
- ggraph, ggtree, ggdag

**Spatial**:
- sf integration

**And many more...**

### 9.3 Extension Philosophy
- ggplot2 is a **platform**, not just a package
- Grammar enables consistent extension development
- Extensions integrate seamlessly
- Mix and match multiple extensions

---

## 10. Learning Resources

### 10.1 Official Documentation
**ggplot2 book** (3rd edition)
- Author: Hadley Wickham
- Free online: https://ggplot2-book.org/
- Will include extension development guide

### 10.2 Recommended Books

**1. "Data Visualization: A Practical Introduction"**
- Author: Kieran Healy
- Free: https://socviz.co/
- Focus: Using ggplot2 for daily work
- Practical examples

**2. "Fundamentals of Data Visualization"**
- Author: Claus Wilke (ggplot2 core team)
- Free: https://clauswilke.com/dataviz/
- Focus: Theory and design principles
- Language-agnostic (examples use ggplot2)

**3. "R Graphics Cookbook"**
- Author: Winston Chang
- Practical recipes for common plots

**4. "R for Data Science"**
- Authors: Hadley Wickham & Garrett Grolemund
- Free: https://r4ds.hadley.nz/
- Comprehensive tidyverse introduction

### 10.3 Community Resources
- Extension package websites (vignettes and documentation)
- RStudio Community forums
- #rstats Twitter community
- Stack Overflow ggplot2 tag
- GitHub repositories

---

## 11. Key Takeaways from Complete Workshop

### 11.1 Foundational Principles
1. **Grammar provides structure**: Understanding theory makes practice intuitive
2. **Logic over memorization**: Learn the system, not individual functions
3. **Composability**: Components work together seamlessly
4. **Reproducibility**: Everything in code, version-controlled

### 11.2 Essential Skills
1. **Aesthetic mapping**: Distinguish mapping from setting values
2. **Color vs fill**: Common pain point - address explicitly
3. **Position adjustments**: Critical for overlapping data
4. **Faceting**: Powerful for data exploration
5. **Theming**: Customize beyond defaults
6. **Composition**: Tell stories with multiple plots

### 11.3 Advanced Techniques
1. **Patchwork**: Modern plot composition
2. **ggrepel**: Solve annotation challenges
3. **gganimate**: Add temporal dimension
4. **ggraph**: Visualize networks and relationships
5. **Extensions**: Explore ecosystem for specialized needs

### 11.4 Professional Workflow
1. Keep everything in code (avoid Illustrator)
2. Use version control
3. Document your visualizations
4. Share reproducible examples
5. Explore extensions before reinventing

---

## 12. Integration into DataViz Course

### 12.1 Topics Already Covered in Your Curriculum
✅ **Day 1**:
- Grammar of Graphics (9:30-10:45)
- Basic geoms (11:15-12:30)
- Aesthetics (13:30-15:00)
- Facets (15:30-16:30)

✅ **Day 2**:
- Scales (10:00-10:45)
- Themes (11:15-12:30)
- Advanced visualizations (13:30-15:00)

### 12.2 Additional Topics to Consider

**High Priority**:
- **Patchwork** for plot composition
  - Essential for final projects
  - Professional skill
  - Add to Day 2 Advanced section

- **ggrepel** for text annotations
  - Common pain point
  - Quick win for better plots
  - Include in Day 2 morning

- **Position adjustments**
  - Often overlooked
  - Important for clarity
  - Add to Day 1 geoms section

**Medium Priority**:
- **Extension gallery** as resource
  - Help students discover tools
  - Encourage exploration
  - Include in resources page

- **Color vs fill distinction**
  - Dedicate explicit time
  - Common beginner confusion
  - Emphasize in Day 1

**Optional/Advanced**:
- **gganimate** if time permits
  - Exciting for presentations
  - Optional final project component
  - Self-study resource

- **ggraph** for networks
  - Specialized use case
  - Optional advanced topic
  - Mention in extensions overview

### 12.3 Video Recommendations for Students

**Pre-course preparation**:
- Watch Part 1 for theoretical foundation
- Aligns with Day 1 content

**Post-course review**:
- Part 1: Reinforce core concepts
- Part 2: Explore extensions

**Final project support**:
- Part 2 for advanced techniques
- Composition strategies
- Professional workflows

### 12.4 Key Messages for Students
1. Don't recreate what exists - explore extensions first
2. Understand the grammar - memorization becomes unnecessary
3. Keep workflows reproducible - avoid manual editing
4. Composition is key for storytelling with data
5. The ggplot2 ecosystem is vast and growing
6. Focus on logic over memorization

---

## 13. Teaching Approach (from Thomas)

### 13.1 Pedagogical Strategy
1. **Theory first**: Grammar of Graphics provides mental model
2. **Live coding**: Show real implementation
3. **Exercises interspersed**: Practice reinforces learning
4. **Solutions provided**: Learn from examples
5. **Real datasets**: Use familiar, accessible data
6. **Build complexity gradually**: Layer concepts systematically

### 13.2 Workshop Structure
- Part 1: Theory + Core API (~2.5 hours)
- Part 2: Extensions + Advanced (~2 hours)
- Total: ~4.5 hours (demonstrates need for adequate time)

### 13.3 Thomas's Teaching Style
- Emphasizes understanding over memorization
- Acknowledges alternatives but recommends best tools
- Live coding with explanations
- Theoretical backbone throughout
- Former bioinformatician - understands scientific needs

---

## 14. Context & Background

### 14.1 Instructor Credentials
**Thomas Lin Pedersen**:
- Main maintainer of ggplot2 at RStudio (now Posit)
- Developer of: patchwork, ggraph, gganimate, ggforce
- Former bioinformatician
- Active in R community (Twitter: @thomasp85, GitHub: thomasp85)
- Data Imaginist blog: https://www.data-imaginist.com/

### 14.2 Workshop Context
- April 2020 "Corona Edition"
- Thomas's first screencast/webinar
- Originally in-person at Celebration R Conference
- Adapted during COVID-19 lockdown
- Community learning initiative

### 14.3 Datasets Used
- `faithful` - Old Faithful geyser data
- `mpg` - Fuel economy data
- `msleep` - Mammal sleep data
- Zachary's Karate Club (networks)
- Various ggplot2 built-in datasets

---

## 15. Summary Checklist for Instructors

### Essential Concepts to Cover
- [ ] Grammar of Graphics theory
- [ ] Aesthetics: mapping vs setting
- [ ] Color vs fill distinction
- [ ] Geoms and layers
- [ ] Scales (continuous and discrete)
- [ ] Faceting for small multiples
- [ ] Position adjustments
- [ ] Theming system
- [ ] Plot composition with patchwork
- [ ] Text annotations with ggrepel

### Advanced Topics (time permitting)
- [ ] Statistical transformations
- [ ] Coordinate systems
- [ ] Animation with gganimate
- [ ] Network plots with ggraph
- [ ] Extension ecosystem overview

### Key Skills to Develop
- [ ] Read ggplot2 code and understand structure
- [ ] Compose multiple plots for storytelling
- [ ] Customize themes for publication
- [ ] Solve label overlap problems
- [ ] Navigate extension ecosystem
- [ ] Write reproducible visualization code

### Resources to Share
- [ ] Both workshop videos
- [ ] ggplot2 book (online)
- [ ] Extension gallery
- [ ] Recommended books (Healy, Wilke)
- [ ] Cheatsheets
- [ ] Package documentation

---

**Document Information**  
**Generated**: October 2025  
**Sources**: 
- YouTube video h29g21z0a68 (Part 1)
- YouTube video 0m4yywqNPVY (Part 2)
- Auto-generated transcripts processed and analyzed

**For**: DataViz_2025 Course  
**Repository**: github.com/mchiapello/DataViz_2025  
**Instructor**: Marco Chiapello

---

*This comprehensive summary combines both parts of Thomas Lin Pedersen's ggplot2 workshop into a single reference document for course planning and student resources.*
