# AGENTS.md

This file provides guidance to coding agents when working with code in this repository.

## Project Overview

This is a static website built with Tableau, an Elixir-based static site generator. The project uses Phoenix LiveView components for templating and TailwindCSS for styling.

## GitHub

This repository is hosted on GitHub. Use `git` to push branches and `gh` to manage issues and pull requests.

## Common Commands

### Development Server
```bash
mix deps.get
mix tableau.server
```
Server runs at http://localhost:4999 with live reload enabled.

### Production Build
```bash
MIX_ENV=prod mix build
```
This runs the `build` alias which executes `tableau.build` and `tailwind default --minify`.

GitHub Pages publishes committed `docs/` files from `main`; it does not run the Elixir build. After source or asset changes, run the production build and include the generated `docs/` changes in the PR.

### Code Formatting
```bash
mix format
```

### Testing
```bash
mix test
npm test
```

Browser tests use the current mise-managed `@playwright/cli` and matching Chromium supplied by dev-machine. The VM updates these daily. Do not install or pin a separate project Playwright package or browser.

ExUnit checks restored content in templates and committed output. Playwright builds the production site and tests both languages, experience cards, contact links, images, responsive layout, and theme preferences on desktop and mobile Chromium.

### Create New Post
```bash
mix kalyna.gen.post "Post Title"
```
Creates a new markdown post in `_posts/` with proper frontmatter.

## Architecture

### Core Components
- **Layouts**: Located in `lib/layouts/`
  - `RootLayout` - Base HTML structure with conditional live reload in dev
  - `PostLayout` - For blog posts (referenced in post frontmatter)

- **Pages**: Located in `lib/pages/`
  - Pages use `Tableau.Page` and Phoenix Components
  - `HomePage` serves the root path with `RootLayout`

- **Configuration**:
  - `config/config.exs` - Base configuration for Tableau, Tailwind, and extensions
  - `config/dev.exs` - Development settings (includes draft posts/pages)
  - `config/prod.exs` - Production settings

### Content Structure
- **Posts**: Markdown files in `_posts/` (published) and `_drafts/` (dev only)
- **Pages**: Markdown files in `_pages/` (published) and `_wip/` (dev only)
- **Assets**: CSS in `assets/css/`, output to `docs/css/`
- **Generated Site**: Output in `docs/` directory

### Extensions Enabled
- Page Extension (static pages)
- Post Extension (blog posts with dates)
- Data Extension
- Sitemap Extension
- RSS Extension (titled "kalyna")

### Styling
- Tailwind CSS CLI version is pinned in `config/config.exs` under `config :tailwind, version: ...`
- The `:tailwind` dependency in `mix.exs` is the Elixir installer and has its own version
- Development builds watch `assets/css/site.css`
- CSS output to `docs/css/site.css`
- Live reload in development mode

### Development Features
- File watching for `.ex`, `.md`, and asset files
- Live reload injected only in development
- Future posts visible in dev but not production
