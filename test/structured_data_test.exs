defmodule Kalyna.StructuredDataTest do
  use ExUnit.Case, async: true

  test "published homepages identify the company and website with a shared publisher" do
    for path <- ["/", "/en/"] do
      html = File.read!(Path.expand("../docs#{path}index.html", __DIR__))
      [_, json] = Regex.run(~r/<script type="application\/ld\+json">(.*?)<\/script>/s, html)
      data = Jason.decode!(json)
      assert data["@context"] == "https://schema.org"
      [organization, website] = data["@graph"]
      assert organization["@type"] == "Organization"
      assert organization["name"] == "Kalyna Solutions AB"
      assert organization["url"] == "https://www.kalyna.se/"
      assert organization["logo"] == "https://www.kalyna.se/images/favicon-512x512.png"
      assert website["@type"] == "WebSite"
      assert website["publisher"]["@id"] == organization["@id"]
      assert website["inLanguage"] == ["sv", "en"]
    end
  end

  test "organization data stays on homepages" do
    for path <- ["/", "/en/", "/articles/example/"] do
      html =
        %{
          page: %{lang: "en", permalink: path},
          site: %{config: %{url: "https://www.kalyna.se"}},
          inner_content: []
        }
        |> Kalyna.RootLayout.template()
        |> IO.iodata_to_binary()

      assert String.contains?(html, "application/ld+json") == path in ["/", "/en/"]
    end
  end
end
