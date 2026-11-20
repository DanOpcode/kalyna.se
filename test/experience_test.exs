defmodule Kalyna.ExperienceTest do
  use ExUnit.Case, async: true

  for lang <- ["sv", "en"], source <- [:template, :published] do
    test "#{lang} #{source} retains the current and completed assignments" do
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

      cards = Regex.split(~r/<div\s+id="company-\d+"/, html) |> tl()
      assert length(cards) == 12
      imy = Enum.at(cards, 1)
      altero = Enum.at(cards, 3)
      assert imy =~ "2024–2026"
      assert altero =~ "2022–2025"
      refute html =~ "2024–pågående"
      refute html =~ "2024–present"
      refute html =~ "2022–pågående"
      refute html =~ "2022–present"

      carmenta = hd(cards)
      assert carmenta =~ "https://carmenta.com/"
      assert carmenta =~ "/images/company_logo_carmenta.svg"
      assert carmenta =~ if(lang == "en", do: "2026–present", else: "2026–pågående")
      assert carmenta =~ if(lang == "en", do: "Show more", else: "Visa mer")
      assert carmenta =~ "content-company-1"

      for technology <- [".NET", "C#", "Docker", "Linux", "Windows"] do
        assert carmenta =~ technology
      end

      panel_numbers =
        Regex.scan(~r/id="content-company-(\d+)"/, html, capture: :all_but_first)
        |> List.flatten()
        |> Enum.map(&String.to_integer/1)

      assert panel_numbers == Enum.to_list(1..12)
    end
  end
end
