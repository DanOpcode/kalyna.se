defmodule Kalyna.PerformanceTest do
  use ExUnit.Case, async: true

  for relative <- ["index.html", "en/index.html"] do
    test "#{relative} embeds current production CSS and prioritizes the LCP portrait" do
      html = File.read!(Path.expand("../docs/#{unquote(relative)}", __DIR__))
      css = File.read!(Path.expand("../docs/css/site.css", __DIR__))
      assert html =~ "<style>#{css}</style>"
      refute html =~ ~s(rel="stylesheet")
      assert html =~ ~r/src="\/images\/profile1.webp"[^>]*fetchpriority="high"/
    end
  end
end
