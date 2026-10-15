defmodule Kalyna.CrawlerMetadataTest do
  use ExUnit.Case, async: true

  test "published robots file advertises the production sitemap" do
    source = File.read!(Path.expand("../extra/robots.txt", __DIR__))
    published = File.read!(Path.expand("../docs/robots.txt", __DIR__))
    assert source == published
    assert published =~ "User-agent: *\nAllow: /"
    assert published =~ "Sitemap: https://www.kalyna.se/sitemap.xml"
    sitemap = File.read!(Path.expand("../docs/sitemap.xml", __DIR__))
    assert sitemap =~ "<loc>https://www.kalyna.se/</loc>"
    assert sitemap =~ "<loc>https://www.kalyna.se/en/</loc>"
  end

  test "the empty placeholder RSS feed is not published" do
    refute File.exists?(Path.expand("../docs/feed.xml", __DIR__))
  end
end
