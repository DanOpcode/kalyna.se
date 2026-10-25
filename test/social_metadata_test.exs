defmodule Kalyna.SocialMetadataTest do
  use ExUnit.Case, async: true

  @origin "https://www.kalyna.se"
  @image "#{@origin}/images/social-card.png"

  for lang <- ["sv", "en"], source <- [:template, :published] do
    test "#{lang} #{source} has consistent sharing metadata" do
      lang = unquote(lang)
      path = if lang == "en", do: "/en/", else: "/"

      title =
        if lang == "en",
          do: "Daniel Jonsson – C#/.NET, full-stack & DevOps in Stockholm",
          else: "Daniel Jonsson – C#/.NET, fullstack & DevOps i Stockholm"

      html =
        case unquote(source) do
          :template ->
            render(%{lang: lang, permalink: path, title: title})

          :published ->
            File.read!(Path.expand("../docs#{path}index.html", __DIR__))
        end

      metadata = metadata(html)
      assert html =~ ~s(rel="canonical" href="#{@origin}#{path}")
      assert metadata["og:url"] == "#{@origin}#{path}"
      assert metadata["og:image"] == @image
      assert metadata["twitter:image"] == @image
      assert metadata["og:image:type"] == "image/png"
      assert metadata["og:image:width"] == "1200"
      assert metadata["og:image:height"] == "630"

      assert metadata["og:title"] ==
               "#{String.replace(title, "&", "&amp;")} | Kalyna Solutions AB"

      assert metadata["twitter:title"] == metadata["og:title"]
      assert metadata["twitter:description"] == metadata["og:description"]
      assert metadata["description"] == metadata["og:description"]
      assert metadata["og:image:alt"] == metadata["twitter:image:alt"]
      assert metadata["twitter:card"] == "summary_large_image"
      assert metadata["twitter:creator"] == "@DanOpcode"
      assert metadata["og:locale"] == if(lang == "en", do: "en_GB", else: "sv_SE")
      assert metadata["og:locale:alternate"] == if(lang == "en", do: "sv_SE", else: "en_GB")

      if lang == "en" do
        assert metadata["og:description"] =~
                 if(unquote(source) == :template,
                   do: "Independent consultant",
                   else: "Daniel Jonsson"
                 )

        assert metadata["og:image:alt"] ==
                 "Kalyna Solutions AB: full-stack development in Stockholm, with kalyna berries and circuit traces above the skyline."
      else
        assert metadata["og:description"] =~
                 if(unquote(source) == :template, do: "Egenkonsult", else: "Daniel Jonsson")

        assert metadata["og:image:alt"] ==
                 "Kalyna Solutions AB: fullstack-utveckling i Stockholm, med kalynabär och kretsbanor över stadens silhuett."
      end

      refute html =~ "raw.githubusercontent.com"
      refute html =~ ~s(content="/apple-touch-icon.png")
    end
  end

  test "other pages keep their own canonical URL and metadata" do
    html =
      render(%{
        lang: "en",
        permalink: "/articles/example/",
        title: "Example",
        description: "A specific page."
      })

    metadata = metadata(html)
    assert metadata["og:url"] == "#{@origin}/articles/example/"
    assert metadata["og:title"] == "Example | Kalyna Solutions AB"
    assert metadata["twitter:title"] == metadata["og:title"]
    assert metadata["og:description"] == "A specific page."
    refute html =~ "hreflang="
    refute metadata["og:locale:alternate"]
  end

  test "the deployed preview image matches its declared dimensions" do
    source = File.read!(Path.expand("../extra/images/social-card.png", __DIR__))
    deployed = File.read!(Path.expand("../docs/images/social-card.png", __DIR__))
    assert source == deployed
    assert <<137, 80, 78, 71, 13, 10, 26, 10, _::binary>> = deployed
    assert <<_::binary-size(16), 1200::32, 630::32, _::binary>> = deployed
  end

  defp render(page) do
    %{page: page, site: %{config: %{url: @origin}}, inner_content: []}
    |> Kalyna.RootLayout.template()
    |> IO.iodata_to_binary()
  end

  defp metadata(html) do
    Regex.scan(~r/<meta\s[^>]+>/, html)
    |> Map.new(fn [tag] ->
      attrs =
        Regex.scan(~r/([\w:]+)="([^"]*)"/, tag, capture: :all_but_first)
        |> Map.new(fn [name, value] -> {name, value} end)

      {attrs["property"] || attrs["name"], attrs["content"]}
    end)
  end
end
