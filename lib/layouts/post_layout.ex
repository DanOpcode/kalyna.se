defmodule Kalyna.PostLayout do
  use Tableau.Layout, layout: Kalyna.RootLayout
  use Phoenix.Component

  def template(assigns) do
    ~H"""
    {Phoenix.HTML.raw(render(@inner_content))}
    """
  end
end
