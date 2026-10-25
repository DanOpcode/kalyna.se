defmodule Kalyna.AgentContentExtension do
  @moduledoc "Publish Markdown and static discovery resources during Tableau builds."
  use Tableau.Extension, key: :agent_content

  @impl true
  def post_write(%{site: %{config: config}} = token) do
    output = config.out_dir

    for {lang, path} <- [{"sv", "index.md"}, {"en", "en/index.md"}] do
      target = Path.join(output, path)
      File.mkdir_p!(Path.dirname(target))
      File.write!(target, Kalyna.PortfolioMarkdown.render(lang, config.url))
    end

    File.touch!(Path.join(output, ".nojekyll"))
    File.write!(Path.join(output, "llms.txt"), content_index(config.url))
    publish_skills(config.include_dir, output)
    {:ok, token}
  end

  defp content_index(base_url) do
    """
    # Kalyna Solutions AB

    > Daniel Jonsson's software development consultancy in Stockholm, Sweden.

    ## Portfolio

    - [Svenska](#{URI.merge(base_url, "/index.md")}): Erfarenhet, expertis och kontaktuppgifter.
    - [English](#{URI.merge(base_url, "/en/index.md")}): Experience, expertise and contact details.
    """
  end

  defp publish_skills(include_dir, output) do
    relative = ".well-known/agent-skills"
    source = Path.join(include_dir, relative)
    target = Path.join(output, relative)
    File.mkdir_p!(Path.dirname(target))
    File.cp_r!(source, target)

    skills =
      for path <- Path.wildcard(Path.join(source, "*/SKILL.md")) do
        artifact = File.read!(path)
        ["", yaml, _body] = String.split(artifact, "---", parts: 3)
        metadata = YamlElixir.read_from_string!(yaml)
        name = path |> Path.dirname() |> Path.basename()
        ^name = Map.fetch!(metadata, "name")

        %{
          name: name,
          type: "skill-md",
          description: Map.fetch!(metadata, "description"),
          url: "/#{relative}/#{name}/SKILL.md",
          digest: "sha256:" <> Base.encode16(:crypto.hash(:sha256, artifact), case: :lower)
        }
      end

    index = %{
      "$schema" => "https://schemas.agentskills.io/discovery/0.2.0/schema.json",
      "skills" => skills
    }

    File.write!(Path.join(target, "index.json"), Jason.encode!(index, pretty: true) <> "\n")
  end
end
