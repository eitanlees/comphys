# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Quarto-based computational physics textbook that converts old lecture notes into a modern book format with integrated Python examples. The live site is at <https://eitanlees.github.io/comphys/>

## Build Commands

```bash
# Preview a chapter locally
quarto preview 04-interpolation.qmd

# Render the full book
quarto render

# Publish to GitHub Pages (usually not needed - CI handles this)
quarto publish gh-pages

# Install Python dependencies
pip install -r requirements.txt
```

Pushing to `main` triggers automatic GitHub Actions build and deploy to gh-pages.

## Project Structure

- `.qmd` files in root: Book chapters (04-interpolation, 05-roots, 06-extrema, 07-integration, 08-odes, 09-modeling)
- `experiments/`: Jupyter notebooks for drafting content or figured before including in chapters
- `data/`: Data files used in examples (BK-7.dat, boiling.dat, decay.out)
- `assets/`: Supporting images
- `_quarto.yml`: Book configuration
- `references.bib`: BibTeX bibliography

## Content Formatting Standards

**Math equations:**

- Inline: `$...$` (NOT `\( \)`)
- Display: `$$...$$` (NOT `\[ \]`)

**Exercises:** Format as callout notes:

```qmd
::: {.callout-note title="Exercise X.Y"}
Exercise content
:::
```

**Citations:** Use `@cite-key` format (e.g., `@knuth84`)
