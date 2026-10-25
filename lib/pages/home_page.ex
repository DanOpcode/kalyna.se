defmodule Kalyna.HomePage do
  use Tableau.Page,
    layout: Kalyna.RootLayout,
    title: "Daniel Jonsson – C#/.NET, fullstack & DevOps i Stockholm",
    description:
      "Daniel Jonsson, konsult genom Kalyna Solutions AB i Stockholm. C#/.NET, fullstack-utveckling, DevOps och teknisk teamledning på plats eller på distans.",
    permalink: "/",
    lang: "sv"

  use Phoenix.Component

  import Kalyna.PortfolioComponents, only: [portfolio: 1]

  def template(assigns) do
    assigns = Map.put(assigns, :lang, Map.get(assigns.page, :lang, "sv"))

    ~H"""
    <.portfolio lang={@lang} />
    """
  end
end
