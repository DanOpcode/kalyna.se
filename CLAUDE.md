# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a static website built with Tableau, an Elixir-based static site generator. The project uses Phoenix LiveView components for templating and TailwindCSS for styling.

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

### Code Formatting
```bash
mix format
```

### Testing
```bash
mix test
```

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
- **Assets**: CSS in `assets/css/`, output to `_site/css/`
- **Generated Site**: Output in `_site/` directory

### Extensions Enabled
- Page Extension (static pages)
- Post Extension (blog posts with dates)
- Data Extension
- Sitemap Extension
- RSS Extension (titled "kalyna")

### Styling
- TailwindCSS v4.1.0 configured to watch `assets/css/site.css`
- CSS output to `_site/css/site.css`
- Live reload in development mode

### Development Features
- File watching for `.ex`, `.md`, and asset files
- Live reload injected only in development
- Future posts visible in dev but not production
