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

Review the generated diff before committing. Keep `config :tableau, :config, out_dir: "docs"`, the Tailwind output (`docs/css/site.css`), and the GitHub Pages source (`main`, `/docs`) aligned. The custom domain comes from `extra/CNAME`, which the build copies to `docs/CNAME`.
