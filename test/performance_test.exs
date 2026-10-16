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

  test "all company logos use SVGs and traced logos contain only vector paths" do
    for relative <- ["index.html", "en/index.html"] do
      html = File.read!(Path.expand("../docs/#{relative}", __DIR__))
      sources = Regex.scan(~r/src="(\/images\/company_logo_[^"]+)"/, html)
      assert length(sources) == 12
      for [_, source] <- sources, do: assert(String.ends_with?(source, ".svg"))
    end

    for name <- ~w(altero avarn idagree labgruppen) do
      svg = File.read!(Path.expand("../docs/images/company_logo_#{name}.svg", __DIR__))
      assert svg =~ "<path"
      refute svg =~ ~r/<(?:image|script|text)\b|data:image|href=/
    end
  end
end
