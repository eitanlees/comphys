# Computational Physics

Dr. Richard O. Gray's 2011 computational physics lecture notes (Appalachian
State), restored as a [Quarto](https://quarto.org/) book, with a Python section
of my own at the end of most chapters.

<https://eitanlees.github.io/comphys/>

Found a mistake? Please [open an issue](https://github.com/eitanlees/comphys/issues).
See [CONTRIBUTING.md](CONTRIBUTING.md) for how that works.

## Building

The Python packages are in `requirements.txt`. With [uv](https://docs.astral.sh/uv/),
one command brings in those and Quarto itself, without adding anything to the repo:

```bash
uv run --no-project --with-requirements requirements.txt --with quarto-cli quarto render --to html
```

That renders the web version into `_book/`. Every chapter's code re-runs, so it
takes a minute or two. Swap `render --to html` for `preview 04-interpolation.qmd`
to get a live preview of one chapter that re-renders on save.

Plain `quarto render` also builds the PDF, which needs a TeX install.

## Publishing

Pushing to `main` publishes the site. The GitHub Action in
`.github/workflows/quarto-publish.yml` renders the book and pushes it to the
`gh-pages` branch. Pull requests don't get a build, so render locally before
merging.

## Layout

- `01-c-intro-1.qmd` … `09-modeling.qmd`: the chapters, one per lecture
  (1–3 Introduction to C, 4 interpolation, 5 roots, 6 extrema, 7 integration,
  8 ODEs, 9 modeling).
- `index.qmd`: the preface. `references.qmd` and `references.bib`: the bibliography.
- `data/`: data files the exercises use.
- `programs/`: C source from the course (`comphys.c`, `comphys.h`, `planck.c`).
- `styles/`: matplotlib styles for the redrawn figures.
- `assets/images/`: images that haven't been redrawn.
- `experiments/`: scratch space, gitignored. It holds the original lecture
  PDFs, which are the source of truth for the text.

The to-do list lives in the [issues](https://github.com/eitanlees/comphys/issues).

## Dev Log

**2026-05-25**:

Well I guess I have set things up so the build happens when I push to main. So I guess it's pretty dummy proof.

**2025-10-20**:

I am picking this project up after a long time away.

I did not take notes when setting up the Quarto site initially.

I assume I followed the instructions at [quarto-github-pages](https://quarto.org/docs/publishing/github-pages.html) to set up the site.
