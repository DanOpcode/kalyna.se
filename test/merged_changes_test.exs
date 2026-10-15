defmodule Kalyna.MergedChangesTest do
  use ExUnit.Case, async: true

  for lang <- ["sv", "en"], source <- [:template, :published] do
    test "#{lang} #{source} retains the contact address and three theme choices" do
      lang = unquote(lang)

      html =
        case unquote(source) do
          :template ->
            %{page: %{lang: lang}}
            |> Kalyna.HomePage.template()
            |> Phoenix.HTML.Safe.to_iodata()
            |> IO.iodata_to_binary()

          :published ->
            relative = if lang == "en", do: "en/index.html", else: "index.html"
            File.read!(Path.expand("../docs/#{relative}", __DIR__))
        end

      assert html =~ "mailto:daniel@kalyna.se"
      refute html =~ "daniel.jonsson@kalyna.se"
      assert html =~ ~s(id="theme-preference")

      for preference <- ["system", "light", "dark"] do
        assert html =~ ~s(value="#{preference}")
      end

      assert html =~ if(lang == "en", do: "Theme", else: "Tema")
      assert html =~ if(lang == "en", do: "Light", else: "Ljust")
      assert html =~ if(lang == "en", do: "Dark", else: "Mörkt")
      refute html =~ "toggleTheme()"
    end
  end
end
