# Kalyna

<img src="extra/images/logo-128.webp" alt="Kalyna Solutions logo" width="96" align="right">

Kalyna is the consulting site and portfolio of Daniel Jonsson, a software
developer based in Stockholm. It showcases his work in full-stack development,
DevOps, and technical team leadership, with selected projects, work history,
and ways to get in touch.

**Visit kalyna.se** · [Svenska](https://www.kalyna.se/) · [English](https://www.kalyna.se/en/)

The site is built with Tableau, an Elixir static site generator, using Phoenix
components and Tailwind CSS. Both languages share the same templates, and the
build also generates Markdown versions of the portfolio.

## Run locally

From the repository root, with Elixir 1.20 and Erlang/OTP installed, run

```sh
mix deps.get
mix tableau.server
```

Open [localhost:4999](http://localhost:4999/) for a live-reloading preview.

## Edit the site

| To update | Edit |
| --- | --- |
| Portfolio copy and links | [`lib/portfolio_content.ex`](lib/portfolio_content.ex) |
| Work history | [`lib/experience.ex`](lib/experience.ex) |
| English translations | [`lib/translations.ex`](lib/translations.ex) |
| Page templates and styles | [`lib/pages/`](lib/pages/) and [`assets/css/site.css`](assets/css/site.css) |

Use `_drafts/` for unpublished posts and `_wip/` for unpublished pages. If you
replace an original image, run [`python3 scripts/optimize-images.py`](scripts/optimize-images.py)
with ImageMagick 7 installed to regenerate the WebP assets. See the
[company logo notes](notes/company-logos.md) for logo sources.

## Test and publish

Run `mix test` for the Elixir checks. In the [dev-machine](https://gitlab.com/DanOpcode/dev-machine)
environment, `npm test` also checks both languages on desktop and mobile
Chromium using the VM's Playwright installation.

```sh
MIX_ENV=prod mix build
```

GitHub Pages serves the committed [`docs/`](docs/) directory from `main`.
Rebuild after changing site content, templates, or assets, and include the
generated changes in the same pull request.
