defmodule Kalyna.EnglishPage do
  use Tableau.Page,
    layout: Kalyna.RootLayout,
    title: "Daniel Jonsson – software developer in Stockholm",
    description:
      "Daniel Jonsson, consultant through Kalyna Solutions AB in Stockholm. Full-stack development, DevOps and technical team leadership on site or remotely.",
    permalink: "/en/",
    lang: "en"

  def template(assigns), do: Kalyna.HomePage.template(assigns)
end
