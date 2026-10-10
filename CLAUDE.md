# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Quarto book that restores Dr. Richard O. Gray's 2011 computational physics lecture notes, with a Python section at the end of most chapters. The live site is at <https://eitanlees.github.io/comphys/>

The original lecture PDFs (`experiments/lectures/lectureN_11.pdf`) are the source of truth for the text. Lecture N maps to chapter `0N-*.qmd`. Preserve Gray's notes; don't rewrite or restyle his text.

Typos in Gray's text (#11) are fixed silently, in prose and in code comments: misspellings, doubled words, `Lets` for `Let's`, and line-break hyphens left over from the PDF. His wording and usage stay (`datafile`, `doneness`), and code itself (identifiers, strings, behaviour) is never changed for spelling. Errors of substance, such as a wrong exercise or equation number or a wrong formula, are not typos: ask the owner before fixing one (Ex 3.2 → 3.1 and ch 6's swapped steps, #10, are examples).

The backlog is the GitHub issue list. Check it before starting work.

## Build Commands

Python, the packages and Quarto itself are pinned in `pyproject.toml` + `uv.lock` (Python version in `.python-version`). Run everything through `uv run`; there is no global `quarto` and no `requirements.txt`:

```bash
# Render the web version into _book/ (every chapter re-runs; a minute or two)
uv run quarto render --to html

# Live preview of one chapter
uv run quarto preview 04-interpolation.qmd --to html
```

Add a package with `uv add <name>`. Upgrade with `uv lock --upgrade` in its own PR, so changed figures or numbers show up in review. Don't `ipykernel install --user`; Quarto finds the venv's kernel on its own.

Plain `uv run quarto render` also builds the PDF, which needs TeX (not installed locally), so the PDF goes unverified.

Both workflows install from the lock with `uv sync --locked`, which fails if `uv.lock` is out of date with `pyproject.toml`. Pushing to `main` triggers the GitHub Action that builds and deploys to gh-pages. Pull requests into `main` get a build check (`pr-build.yml`) that renders the HTML without publishing. It fails on a code-cell error but not on a broken cross-reference (Quarto only warns), so still render locally to verify a change.

## Workflow

Work on a branch and open a pull request; the owner reviews on GitHub. Don't push to `main`.

## Project Structure

- `01-c-intro-1.qmd` … `09-modeling.qmd`: the chapters (1–3 Introduction to C, 4 interpolation, 5 roots, 6 extrema, 7 integration, 8 ODEs, 9 modeling)
- `index.qmd`: preface; `references.qmd` + `references.bib`: bibliography
- `data/`: data files used in examples and exercises (`BK-7.dat`, `boiling.dat`, `data91.dat`, `data94.dat`, `data95.dat`, `decay.out`, `hist.csv`, `MC.csv`)
- `programs/`: C source from the course (`comphys.c`, `comphys.h`, `planck.c`)
- `styles/`: matplotlib styles for the redrawn figures (`flowchart.mplstyle`, `function_plot.mplstyle`)
- `assets/images/`: images that haven't been redrawn
- `experiments/`: gitignored scratch space; holds the lecture PDFs and the matplotlib figure recreations
- `_quarto.yml`: book configuration

## Content Formatting Standards

**Math equations:**

- Inline: `$...$` (NOT `\( \)`)
- Display: `$$...$$` (NOT `\[ \]`)

**Exercises:** Callout notes with a `#nte-ex-<chapter>-<n>` id. Quarto numbers them per chapter and `_quarto.yml` labels them "Exercise", so don't type the number. Add `title=` only for a named exercise:

```qmd
::: {#nte-ex-5-9 .callout-note title="An Iterative Problem"}
Exercise content
:::
```

Refer to one with `@nte-ex-5-9` (renders as a linked "Exercise 5.9"). The automatic numbers match Gray's in every chapter; if you add, remove or reorder an exercise, check they still do.

**Citations:** Use `@cite-key` format (e.g., `@knuth84`). Cite Numerical Recipes with a locator: `[@press92, sec. 10.4]`.

**Figures:** Each chapter runs in one kernel, so matplotlib styles leak between cells. Scope them with `with plt.style.context(...):` and call `plt.show()` inside the block, or the style is lost at draw time:

```python
with plt.style.context("styles/function_plot.mplstyle"):
    fig, ax = plt.subplots()
    ...
    plt.show()
```
