# Matteo Russo — al-folio website

This repository is a ready-to-deploy al-folio/Jekyll rewrite of the previous single-page website. It uses the al-folio v1 gem architecture, so layouts, responsive styling, navigation, dark mode, publication rendering, and icons come from versioned theme gems rather than copied theme internals.

## Site structure

- `_pages/about.md` — biography, research statement, the three homepage news items, and the switch that displays selected publications.
- `_bibliography/papers.bib` — complete publication list and the **only place where homepage publication selection is controlled**.
- `_pages/publications.md` — full Publications page.
- `_pages/teaching.md` — Teaching page.
- `_pages/service.md` — Academic Service page.
- `_pages/visits.md` — separate Visits & Internships page.
- `_data/socials.yml` — email, Google Scholar, DBLP, and optional CV link.
- `assets/img/prof_pic.jpg` — profile photograph.
- `legacy/index.html` — copy of the previous homepage for reference; excluded from the Jekyll build.

There is intentionally **no `_news` Jekyll collection**. al-folio's Cmd/Ctrl-K search indexes all collections, so the three news items are written directly in `_pages/about.md`; they remain visible on the homepage but do not create a `News` section in the search menu.

## Editing the three news items

Edit the three bullets under `## News` in `_pages/about.md`.

## Choosing the five selected publications

You only need to edit `_bibliography/papers.bib`. No HTML and no page Markdown needs to be modified.

For each paper, use either:

```bibtex
selected = {true}
```

or:

```bibtex
selected = {false}
```

Keep exactly five entries set to `true`. The current five are:

1. Nearly-Tight Bounds for Zonotope Containment and Beyond
2. Contextual Online Bilateral Trade
3. Online Convex Optimization with Sublinear Noisy Probes
4. A Learning Perspective on Random-Order Covering Problems
5. A Tight VC-Dimension Analysis of Clustering Coresets with Applications

`Online Learning with Sublinear Best-Action Queries` is currently set to `selected = {false}`.

## Add the CV

Follow `assets/pdf/README.md`. Copy the PDF to `assets/pdf/CV.pdf` and uncomment `cv_pdf` in `_data/socials.yml`.

## Run locally on macOS without Docker

Do not use Apple's system Ruby. Install Ruby through `rbenv`, then run the site with Bundler. For example:

```bash
brew install rbenv ruby-build imagemagick
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init - zsh)"' >> ~/.zshrc
source ~/.zshrc

rbenv install 3.3.5
rbenv local 3.3.5
gem install bundler
bundle install
bundle exec jekyll serve --livereload
```

Open `http://localhost:4000`.

If `ruby --version` still reports Ruby 2.6 or `gem` tries to write into `/Library/Ruby/Gems/2.6.0`, `rbenv` has not been activated in the shell yet.

## Deploy to matteorusso.github.io

1. Replace the contents of the `matteorusso.github.io` repository with this project and push to `main`.
2. In GitHub repository settings, open **Pages** and select the `gh-pages` branch as the deployment source.
3. The included workflow builds the site on every push and deploys `_site` to `gh-pages`.

The configuration already uses:

```yaml
url: https://matteorusso.github.io
baseurl:
```

For a project repository instead of the personal `matteorusso.github.io` repository, set `baseurl` to the repository name, such as `/my-site`.

## Updating al-folio

The al-folio plugin versions are pinned in `Gemfile`. To upgrade later, update the pins, run `bundle update`, and use the bundled audit:

```bash
bundle exec al-folio upgrade audit
```
