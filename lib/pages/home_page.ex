defmodule Kalyna.HomePage do
  use Tableau.Page,
    layout: Kalyna.RootLayout,
    title: "Fullstack-utvecklare i Stockholm",
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
