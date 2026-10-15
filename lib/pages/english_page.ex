defmodule Kalyna.EnglishPage do
  use Tableau.Page,
    layout: Kalyna.RootLayout,
    permalink: "/en/",
    lang: "en"

  def template(assigns), do: Kalyna.HomePage.template(assigns)
end
