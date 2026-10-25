defmodule Kalyna.StructuredDataTest do
  use ExUnit.Case, async: true

  test "published homepages link Daniel, his company, and the website" do
    for {path, role} <- [{"/", "Systemutvecklare"}, {"/en/", "Software developer"}] do
      html = File.read!(Path.expand("../docs#{path}index.html", __DIR__))
      [_, json] = Regex.run(~r/<script type="application\/ld\+json">(.*?)<\/script>/s, html)
      data = Jason.decode!(json)
      assert data["@context"] == "https://schema.org"
      graph = Map.new(data["@graph"], &{&1["@type"], &1})
      organization = Map.fetch!(graph, "Organization")
      website = Map.fetch!(graph, "WebSite")
      person = Map.fetch!(graph, "Person")
      assert organization["@type"] == "Organization"
      assert organization["name"] == "Kalyna Solutions AB"
      assert organization["url"] == "https://www.kalyna.se/"
      assert organization["logo"] == "https://www.kalyna.se/images/favicon-512x512.png"
      assert website["@type"] == "WebSite"
      assert website["publisher"]["@id"] == organization["@id"]
      assert website["inLanguage"] == ["sv", "en"]
      assert person["@id"] == "https://www.kalyna.se/#daniel-jonsson"
      assert person["name"] == "Daniel Jonsson"
      assert person["alternateName"] == "DanOpcode"
      assert is_binary(person["description"])
      assert organization["legalName"] == Kalyna.PortfolioContent.value(:company_name)
      assert organization["vatID"] == Kalyna.PortfolioContent.value(:company_vat)
      assert organization["telephone"] == Kalyna.PortfolioContent.value(:phone_number)
      ids = Enum.map(data["@graph"], & &1["@id"])
      assert length(Enum.uniq(ids)) == length(ids)

      for node <- data["@graph"], {_key, %{"@id" => reference}} <- node do
        assert reference in ids
      end

      assert person["jobTitle"] == role
      assert person["url"] == "https://www.kalyna.se/#about"
      assert person["image"] == "https://www.kalyna.se/images/profile1-576.webp"
      assert person["worksFor"] == %{"@id" => organization["@id"]}
      assert website["about"] == %{"@id" => person["@id"]}

      assert person["sameAs"] == [
               "https://www.kvadrat.se/anlita-kvadrat/hitta-konsult/daniel-jonsson/",
               "https://mastodon.social/@DanOpcode",
               "https://linkedin.com/in/DanOpcode",
               "https://www.youtube.com/@DanOpcode",
               "https://x.com/DanOpcode",
               "https://github.com/DanOpcode",
               "https://www.danopcode.com/"
             ]

      for key <- [:kvadrat_profile_url, :mastodon_url, :linkedin_url, :youtube_url, :blog_url] do
        assert html =~ ~s(href="#{Kalyna.PortfolioContent.value(key)}")
      end
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
