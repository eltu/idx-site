# idx-site

Documentation site for [idx](https://github.com/eltu/idx) — fast BM25 code search for Git repositories.

Live at **[idx.cool](https://idx.cool)**.

## Structure

This repo contains only the site infrastructure. Documentation content lives in the main `idx` repo under `docs/` and is pulled at build time via sparse checkout.

```
idx-site/
├── _layouts/       # Page templates (default, landing)
├── _includes/      # Partials (header, sidebar)
├── assets/         # CSS, fonts, JS
├── _config.yml     # Jekyll configuration
├── index.html      # Homepage
└── CNAME           # Custom domain (idx.cool)
```

## Local development

Requires [Jekyll](https://jekyllrb.com/docs/installation/) and [Bundler](https://bundler.io/).

```bash
# Clone
git clone https://github.com/eltu/idx-site.git
cd idx-site

# Pull docs from idx and serve
make serve
```

`make serve` fetches the `docs/` folder from `eltu/idx` via sparse clone on first run,
then pulls updates on subsequent runs before starting Jekyll with live reload.

To sync docs without serving:

```bash
make sync
```

## Deploy

The site is deployed to GitHub Pages automatically on:

- **Push to `main`** — when site infrastructure changes (layouts, assets, etc.)
- **`repository_dispatch: docs-updated`** — triggered by `eltu/idx` after each release

The deploy workflow (`.github/workflows/deploy.yml`) fetches only the `docs/` subtree
from `eltu/idx` via sparse checkout before building Jekyll, so no docs content is stored in this repo.

## Content

Documentation is maintained in the main repo:

| Content | Location in `eltu/idx` |
|---------|------------------------|
| Feature docs | `docs/features/` |
| Release notes | `docs/releases/` |
| Architecture decisions | `docs/adr/` |
| Benchmarks | `docs/benchmarks/` |

To update content, open a PR in [eltu/idx](https://github.com/eltu/idx). The site rebuilds automatically on the next release.
