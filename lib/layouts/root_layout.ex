defmodule Kalyna.RootLayout do
  use Tableau.Layout
  use Phoenix.Component

  import Kalyna.Translations, only: [t: 2]

  # Keep theme selection before first paint without a blocking network request.
  @external_resource Path.expand("../../assets/js/theme.js", __DIR__)
  @theme_script File.read!(@external_resource)

  def template(assigns) do
    lang = Map.get(assigns.page, :lang, "sv")
    permalink = Map.get(assigns.page, :permalink, "/")
    base_url = assigns.site.config.url

    title =
      [assigns.page[:title], "Kalyna Solutions AB"]
      |> Enum.filter(& &1)
      |> Enum.join(" | ")

    assigns =
      Map.merge(assigns, %{
        lang: lang,
        theme_script: @theme_script,
        title: title,
        description:
          assigns.page[:description] ||
            t(lang, "Egenkonsult i Stockholm som erbjuder fullstack-utveckling."),
        canonical_url: URI.merge(base_url, permalink) |> URI.to_string(),
        social_image_url: URI.merge(base_url, "/images/social-card.png") |> URI.to_string(),
        locale: if(lang == "en", do: "en_GB", else: "sv_SE"),
        alternate_locale: if(lang == "en", do: "sv_SE", else: "en_GB"),
        translated_homepage: permalink in ["/", "/en/"],
        markdown_url: URI.merge(base_url, permalink <> "index.md") |> URI.to_string(),
        swedish_url: URI.merge(base_url, "/") |> URI.to_string(),
        english_url: URI.merge(base_url, "/en/") |> URI.to_string(),
        structured_data:
          Jason.encode!(%{
            "@context" => "https://schema.org",
            "@graph" => [
              %{
                "@type" => "Organization",
                "@id" => "#{base_url}/#organization",
                "name" => "Kalyna Solutions AB",
                "url" => "#{base_url}/",
                "logo" => URI.merge(base_url, "/images/favicon-512x512.png") |> URI.to_string(),
                "email" => "daniel@kalyna.se"
              },
              %{
                "@type" => "WebSite",
                "@id" => "#{base_url}/#website",
                "name" => "Kalyna Solutions AB",
                "url" => "#{base_url}/",
                "inLanguage" => ["sv", "en"],
                "publisher" => %{"@id" => "#{base_url}/#organization"},
                "about" => %{"@id" => "#{base_url}/#daniel-jonsson"}
              },
              %{
                "@type" => "Person",
                "@id" => "#{base_url}/#daniel-jonsson",
                "name" => "Daniel Jonsson",
                "url" => "#{base_url}/#about",
                "jobTitle" => Kalyna.PortfolioContent.copy(lang, :developer_role),
                "worksFor" => %{"@id" => "#{base_url}/#organization"},
                "image" =>
                  URI.merge(base_url, Kalyna.PortfolioContent.value(:portrait_one_src))
                  |> URI.to_string(),
                "sameAs" =>
                  Enum.map(
                    [
                      :kvadrat_profile_url,
                      :mastodon_url,
                      :linkedin_url,
                      :youtube_url,
                      :x_url,
                      :github_url,
                      :blog_url
                    ],
                    &Kalyna.PortfolioContent.value/1
                  )
              }
            ]
          })
          |> String.replace("<", "\\u003c")
      })

    ~H"""
    <!DOCTYPE html>
    <html lang={@lang}>
      <head>
        <meta charset="utf-8" />
        <script>
          <%= Phoenix.HTML.raw(@theme_script) %>
        </script>
        <meta http_equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <title>{@title}</title>
        <link rel="canonical" href={@canonical_url} />
        <link :if={@translated_homepage} rel="alternate" type="text/markdown" href={@markdown_url} />
        <link rel="describedby" type="text/plain" href="/llms.txt" />
        <meta name="description" content={@description} />

        <meta property="og:type" content="website" />
        <meta property="og:site_name" content="Kalyna Solutions AB" />
        <meta property="og:title" content={@title} />
        <meta property="og:description" content={@description} />
        <meta property="og:url" content={@canonical_url} />
        <meta property="og:locale" content={@locale} />
        <meta :if={@translated_homepage} property="og:locale:alternate" content={@alternate_locale} />
        <meta property="og:image" content={@social_image_url} />
        <meta property="og:image:type" content="image/png" />
        <meta property="og:image:width" content="1200" />
        <meta property="og:image:height" content="630" />
        <meta
          property="og:image:alt"
          content={
            t(
              @lang,
              "Kalyna Solutions AB: fullstack-utveckling i Stockholm, med kalynabär och kretsbanor över stadens silhuett."
            )
          }
        />

        <meta name="twitter:card" content="summary_large_image" />
        <meta name="twitter:creator" content="@DanOpcode" />
        <meta name="twitter:title" content={@title} />
        <meta name="twitter:description" content={@description} />
        <meta name="twitter:image" content={@social_image_url} />
        <meta
          name="twitter:image:alt"
          content={
            t(
              @lang,
              "Kalyna Solutions AB: fullstack-utveckling i Stockholm, med kalynabär och kretsbanor över stadens silhuett."
            )
          }
        />
        <link rel="apple-touch-icon" sizes="180x180" href="/images/apple-touch-icon.png" />
        <link rel="icon" type="image/png" sizes="16x16" href="/images/favicon-16x16.png" />
        <link rel="icon" type="image/png" sizes="32x32" href="/images/favicon-32x32.png" />
        <link rel="icon" type="image/png" sizes="48x48" href="/images/favicon-48x48.png" />
        <link rel="icon" type="image/png" sizes="192x192" href="/images/favicon-192x192.png" />
        <link rel="icon" type="image/png" sizes="512x512" href="/images/favicon-512x512.png" />

        <link rel="me" href="https://mastodon.social/@DanOpcode" />
        <meta name="fediverse:creator" content="@DanOpcode@mastodon.social" />

        <link :if={@translated_homepage} rel="alternate" hreflang="sv" href={@swedish_url} />
        <link :if={@translated_homepage} rel="alternate" hreflang="en" href={@english_url} />
        <link :if={@translated_homepage} rel="alternate" hreflang="x-default" href={@swedish_url} />
        <script :if={@translated_homepage} type="application/ld+json">
          <%= Phoenix.HTML.raw(@structured_data) %>
        </script>
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
