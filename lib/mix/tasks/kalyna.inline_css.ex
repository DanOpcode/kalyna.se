defmodule Mix.Tasks.Kalyna.InlineCss do
  use Mix.Task

  @shortdoc "Embed the freshly compiled stylesheet in generated HTML"
  def run(_args) do
    # Run after Tailwind, rather than reading CSS while templates compile: this
    # ensures a clean build embeds the current minified stylesheet.
    output = Application.fetch_env!(:tableau, :config) |> Keyword.fetch!(:out_dir)
    css_path = Path.join(output, "css/site.css")
    css = File.read!(css_path)
    if String.trim(css) == "", do: Mix.raise("Cannot inline an empty stylesheet")
    style = "<style>#{css}</style>"

    for path <- Path.wildcard(Path.join(output, "**/*.html")) do
      html = File.read!(path)

      File.write!(
        path,
        String.replace(html, ~s(<link rel="stylesheet" href="/css/site.css">), style)
      )
    end

    # Delete only after every page has been written successfully. Development
    # still needs the external stylesheet for the live-reload server.
    if Mix.env() == :prod, do: File.rm!(css_path)
  end
end
