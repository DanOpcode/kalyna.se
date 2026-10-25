defmodule Kalyna.PortfolioMarkdown do
  @moduledoc "Render the shared portfolio content directly as Markdown."

  alias Kalyna.PortfolioContent
  import Kalyna.Translations, only: [t: 2]

  def render(lang, base_url) do
    PortfolioContent.sections()
    |> Enum.flat_map(fn
      {:experience, :experience} -> experience()
      {_section, blocks} -> blocks
    end)
    |> render_blocks(lang, base_url)
  end

  def render_blocks(blocks, lang, base_url) do
    context = %{lang: lang, url: URI.merge(base_url, if(lang == "en", do: "/en/", else: "/"))}

    blocks
    |> Enum.map_join("\n\n", &block(&1, context))
    |> Kernel.<>("\n")
  end

  defp block({:heading, level, content}, context),
    do: String.duplicate("#", level) <> " " <> inline(content, context)

  defp block({:paragraph, content}, context), do: inline(content, context)
  defp block({:quote, content}, context), do: "> " <> inline(content, context)

  defp block({:list, items}, context),
    do: Enum.map_join(items, "\n", &("- " <> inline(&1, context)))

  defp block({:image, _, _} = image, context), do: inline([image], context)

  defp inline(parts, context) do
    parts
    |> Enum.map_join(&fragment(&1, context))
    |> String.replace(~r/\s+/, " ")
    |> String.trim()
  end

  defp fragment(key, context) when is_atom(key),
    do: context.lang |> PortfolioContent.copy(key) |> escape()

  defp fragment({:literal, text}, context), do: context.lang |> t(text) |> escape()

  defp fragment({:link, url, content}, context),
    do: "[#{inline(content, context)}](<#{url(url, context)}>)"

  defp fragment({:image, alt, src}, context),
    do: "![#{inline([alt], context)}](<#{url(src, context)}>)"

  defp fragment(text, _context) when is_binary(text), do: text

  defp url(key, context) when is_atom(key), do: url(PortfolioContent.value(key), context)
  defp url(path, context), do: context.url |> URI.merge(path) |> URI.to_string()

  defp escape(text), do: String.replace(text, ~r/[\\`*_\[\]<>]/, &serialize_character/1)

  defp serialize_character(character), do: "\\" <> character

  defp experience do
    [
      {:heading, 2, [{:literal, "Professionell erfarenhet"}]},
      {:paragraph, [{:literal, "Företag jag arbetat med."}]}
      | Enum.flat_map(Kalyna.Experience.companies(), &company/1)
    ]
  end

  defp company(company) do
    title = [{:literal, company.name}]
    title = if company.url, do: [{:link, company.url, title}], else: title

    [
      {:image, {:literal, company.logo.alt}, company.logo.src},
      {:heading, 3, title},
      {:paragraph, [{:literal, company.summary}]}
    ] ++
      if(company.description, do: [{:paragraph, [{:literal, company.description}]}], else: []) ++
      Enum.flat_map(company.projects, &project/1)
  end

  defp project(project) do
    level = if project.title, do: 5, else: 4
    title = if project.title, do: [{:heading, 4, [{:literal, project.title}]}], else: []

    fields =
      for {label, value} <- [{"Uppdrag", project.assignment}, {"Nytta", project.benefit}],
          value,
          block <- [{:heading, level, [{:literal, label}]}, {:paragraph, [{:literal, value}]}],
          do: block

    technologies =
      if project.technologies == [] do
        []
      else
        [
          {:heading, level, [{:literal, "Tekniker"}]},
          {:paragraph, Enum.intersperse(Enum.map(project.technologies, &{:literal, &1}), ", ")}
        ]
      end

    title ++ fields ++ technologies
  end
end
