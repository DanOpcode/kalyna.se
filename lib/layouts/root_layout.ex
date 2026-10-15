defmodule Kalyna.RootLayout do
  use Tableau.Layout
  use Phoenix.Component

  import Kalyna.Translations, only: [t: 2]

  def template(assigns) do
    assigns = Map.put(assigns, :lang, Map.get(assigns.page, :lang, "sv"))

    ~H"""
    <!DOCTYPE html>
    <html lang={@lang}>
      <head>
        <meta charset="utf-8" />
        <script src="/js/theme.js">
        </script>
        <meta http_equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <title>
          {[@page[:title], "Kalyna Solutions AB"]
          |> Enum.filter(& &1)
          |> Enum.intersperse("|")
          |> Enum.join(" ")}
        </title>

        <meta
          name="description"
          content={t(@lang, "Egenkonsult i Stockholm som erbjuder fullstack-utveckling.")}
          key="desc"
        />
        <meta property="og:type" content="website" />
        <meta property="og:title" content="Kalyna Solutions AB" />
        <meta
          property="og:description"
          content={t(@lang, "Egenkonsult i Stockholm som erbjuder fullstack-utveckling.")}
        />
        <meta property="og:image" content="/apple-touch-icon.png" />
        <meta property="twitter:card" content="summary_large_image" />
        <meta property="twitter:creator" content="DanOpcode" />
        <meta property="twitter:title" content="Kalyna Solutions AB" />
        <meta
          property="twitter:description"
          content={t(@lang, "Egenkonsult i Stockholm som erbjuder fullstack-utveckling.")}
        />
        <meta
          property="twitter:image"
          content="https://raw.githubusercontent.com/matachi/kalyna.se/main/public/logo.png"
        />
        <meta
          property="twitter:image:alt"
          content={t(@lang, "Företagsloggo för Kalyna Solutions AB.")}
        />
        <link rel="apple-touch-icon" sizes="180x180" href="/images/apple-touch-icon.png" />
        <link rel="icon" type="image/png" sizes="16x16" href="/images/favicon-16x16.png" />
        <link rel="icon" type="image/png" sizes="32x32" href="/images/favicon-32x32.png" />
        <link rel="icon" type="image/png" sizes="48x48" href="/images/favicon-48x48.png" />
        <link rel="icon" type="image/png" sizes="192x192" href="/images/favicon-192x192.png" />
        <link rel="icon" type="image/png" sizes="512x512" href="/images/favicon-512x512.png" />

        <link rel="me" href="https://mastodon.social/@DanOpcode" />
        <meta name="fediverse:creator" content="@DanOpcode@mastodon.social" />

        <link rel="alternate" hreflang="sv" href="https://www.kalyna.se/" />
        <link rel="alternate" hreflang="en" href="https://www.kalyna.se/en/" />
        <link rel="alternate" hreflang="x-default" href="https://www.kalyna.se/" />
        <link rel="stylesheet" href="/css/site.css" />
      </head>

      <body>
        <main>
          {render(@inner_content)}
        </main>
      </body>

      {if Mix.env() == :dev, do: Phoenix.HTML.raw(Tableau.live_reload(assigns))}
    </html>
    """
    |> Phoenix.HTML.Safe.to_iodata()
  end
end
