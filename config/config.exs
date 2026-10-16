import Config

config :tableau, :reloader,
  patterns: [
    ~r"^lib/.*\.ex$",
    ~r"^(_posts|_pages|_drafts|_wip)/.*\.md$",
    ~r"^assets/.*\.(css|js)$",
    ~r"^extra/"
  ]

config :web_dev_utils, :reload_log, true
# uncomment this if you use something like ngrok
# config :web_dev_utils, :reload_url, "'wss://' + location.host + '/ws'"

config :tailwind,
  version: "4.3.3",
  default: [
    args: ~w(
    --input=assets/css/site.css
    --output=docs/css/site.css
    )
  ]

config :tableau, :assets, tailwind: {Tailwind, :install_and_run, [:default, ~w(--watch)]}

config :tableau, :config,
  url: "http://localhost:4999",
  out_dir: "docs",
  markdown: [
    mdex: [
      extension: [
        table: true,
        header_ids: "",
        tasklist: true,
        strikethrough: true,
        autolink: true,
        alerts: true,
        footnotes: true
      ],
      render: [unsafe: true],
      syntax_highlight: [formatter: {:html_inline, theme: "neovim_dark"}]
    ]
  ]

config :tableau, Tableau.PageExtension, enabled: true
config :tableau, Tableau.PostExtension, enabled: true
config :tableau, Tableau.DataExtension, enabled: true
config :tableau, Tableau.SitemapExtension, enabled: true

# Enable a feed when the site publishes posts.
config :tableau, Tableau.RSSExtension, enabled: false

config :elixir, :time_zone_database, Tz.TimeZoneDatabase

import_config "#{Mix.env()}.exs"
