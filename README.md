# kalyna

## Getting Started

Once you bootstrap and enter your project, fetch your dependencies and start the build server. The server is available at http://localhost:4999

```shell
cd kalyna
mix deps.get

mix tableau.server
```

## Draft Posts and WIP Pages

Posts and pages that are not ready for production can be saved to the `_drafts` and `_wip` directories respectively.

These are controlled via application configuration, as seen in `config/dev.exs` and `config/prod.exs`

## Production Builds

To build for production, run the `mix build` alias to build your site and compile any assets (depends on what asset you chose when generating your site).

Running your build with `MIX_ENV=prod` is important so that the live reload JS script is not loaded, and also allows you to configure your app differently in dev vs prod, like showing future posts in dev, but not in prod.

```shell
MIX_ENV=prod mix build
```

## Publishing to GitHub Pages

GitHub Pages publishes the committed `docs/` directory on `main`. The Pages deployment does not run Tableau or Tailwind. After changing templates, content or styles, rebuild and include the generated files in the same pull request:

```shell
MIX_ENV=prod mix build
git add docs/
```

Review the generated diff before committing. Keep `config :tableau, :config, out_dir: "docs"`, the Tailwind output (`docs/css/site.css`), and the GitHub Pages source (`main`, `/docs`) aligned. Production builds remove the intermediate CSS file after embedding it in the HTML;
do not commit a separate `docs/css/site.css`. The custom domain comes from `extra/CNAME`, which the build copies to `docs/CNAME`.

## Tests

Run the Elixir regression tests with `mix test`. Run browser tests with:

```shell
npm ci
npx playwright install chromium
npm test
```

Playwright builds the production site and starts a temporary static server on port 4100. Desktop and mobile Chromium tests cover both languages, contact links, experience cards, image loading, the Carmenta logo, mobile overflow, and system/light/dark preferences (including blocked storage). Failed tests retain traces in `test-results/`. Use `npm run test:ui` for the interactive runner.

## Homepage performance

The homepage uses committed WebP derivatives of the original PNG/JPEG images in
`extra/images/`. Regenerate them after replacing an original:

```shell
python3 -m venv /tmp/kalyna-image-tools
/tmp/kalyna-image-tools/bin/pip install Pillow==12.2.0
/tmp/kalyna-image-tools/bin/python scripts/optimize-images.py
MIX_ENV=prod mix build
```

Portrait sources remain JPEGs and must be square and at least 576 × 576 pixels.
The script generates 192, 384, and 576 pixel WebP versions; the homepage uses
`srcset` to choose a version for its 192-pixel portrait boxes on 1×, 2×, and 3× screens.
All company logos use SVGs. Five are traced from retained raster artwork; see
the regeneration instructions in [the company logo audit](notes/company-logos.md).
Social preview images are unchanged.
The root layout embeds `assets/js/theme.js` at build time so the saved theme applies
before first paint without a blocking JavaScript request. The production build embeds the freshly minified stylesheet after Tailwind
finishes, then removes `docs/css/site.css` from the production output after all
pages are written successfully. Development still uses the external
stylesheet for live reload. Inlining adds the CSS to each page response and trades
cross-page stylesheet caching for faster first rendering on this small site.

See [the company logo audit](notes/company-logos.md) for vector sources, trace
limitations, and a side-by-side comparison.

The cache lifetimes and injected `cdn-cgi` email decoding script reported in issue
#52 are controlled by the hosting/CDN configuration, outside the static build.
Review those settings separately. If extending asset cache lifetimes, use versioned
asset URLs or a cache invalidation strategy so updates reach returning visitors.
