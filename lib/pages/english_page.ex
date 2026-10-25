defmodule Kalyna.EnglishPage do
  use Tableau.Page,
    layout: Kalyna.RootLayout,
    title: "Daniel Jonsson – C#/.NET, full-stack & DevOps in Stockholm",
    description:
      "Daniel Jonsson, consultant through Kalyna Solutions AB in Stockholm. C#/.NET, full-stack development, DevOps and technical team leadership on site or remotely.",
    permalink: "/en/",
    lang: "en"

  def template(assigns), do: Kalyna.HomePage.template(assigns)
end
