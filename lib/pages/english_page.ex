defmodule Kalyna.EnglishPage do
  use Tableau.Page,
    layout: Kalyna.RootLayout,
    title: "Full-stack developer in Stockholm",
    permalink: "/en/",
    lang: "en"

  def template(assigns), do: Kalyna.HomePage.template(assigns)
end
