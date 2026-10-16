defmodule Kalyna.PerformanceTest do
  use ExUnit.Case, async: true

  for relative <- ["index.html", "en/index.html"] do
    test "#{relative} embeds current production CSS and prioritizes the LCP portrait" do
      html = File.read!(Path.expand("../docs/#{unquote(relative)}", __DIR__))
      assert [_, css] = Regex.run(~r/<style>(.*?)<\/style>/s, html)
      assert css =~ "@layer"
      assert css =~ "tailwindcss"
      refute File.exists?(Path.expand("../docs/css/site.css", __DIR__))
      refute html =~ ~s(rel="stylesheet")
      assert html =~ ~r/src="\/images\/profile1.webp"[^>]*fetchpriority="high"/
    end
  end

  test "company logos use original SVGs or WebP raster fallbacks" do
    raster_names = ~w(altero avarn idagree labgruppen)

    for relative <- ["index.html", "en/index.html"] do
      html = File.read!(Path.expand("../docs/#{relative}", __DIR__))
      sources = Regex.scan(~r/src="(\/images\/company_logo_([^".]+)\.[^"]+)"/, html)
      assert length(sources) == 12

      for [_, source, name] <- sources do
        extension = if name in raster_names, do: ".webp", else: ".svg"
        assert String.ends_with?(source, extension)
        assert File.exists?(Path.expand("../docs#{source}", __DIR__))
      end
    end

    for name <- raster_names do
      refute File.exists?(Path.expand("../docs/images/company_logo_#{name}.svg", __DIR__))
    end
  end
end
