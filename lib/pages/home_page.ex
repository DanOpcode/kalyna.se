defmodule Kalyna.HomePage do
  use Tableau.Page,
    layout: Kalyna.RootLayout,
    permalink: "/"

  use Phoenix.Component

  def template(assigns) do
    ~H"""
    <p>
      hello, world!
    </p>
    """
  end
end
