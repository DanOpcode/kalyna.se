defmodule Kalyna.AgentContentTest do
  use ExUnit.Case, async: true

  @root Path.expand("..", __DIR__)

  @tag :tmp_dir
  test "Tableau generates agent resources without intermediate HTML", %{tmp_dir: output} do
    token = %{
      site: %{
        config: %{
          out_dir: output,
          include_dir: Path.join(@root, "extra"),
          url: "https://example.test"
        }
      }
    }

    assert {:ok, ^token} = Kalyna.AgentContentExtension.post_write(token)
    refute File.exists?(Path.join(output, "index.html"))
    assert File.read!(Path.join(output, "index.md")) =~ "## Ett av mina projekt"
    english = File.read!(Path.join(output, "en/index.md"))
    assert english =~ "## One of my projects\n\n### Daily Diff"
    assert english =~ "https://example.test/en/#contact"
    assert File.read!(Path.join(output, "llms.txt")) =~ "https://example.test/en/index.md"
    assert File.exists?(Path.join(output, ".well-known/agent-skills/index.json"))
    assert File.exists?(Path.join(output, ".nojekyll"))
  end

  test "Markdown preserves literal formatting characters and inline links" do
    blocks = [
      {:heading, 2, [{:literal, "A [literal] *heading*"}]},
      {:paragraph, ["Read ", {:link, "/details", [{:literal, "the details"}]}, "."]},
      {:list, [[{:literal, "C#/.NET"}], [{:literal, "Elixir"}]]}
    ]

    markdown = Kalyna.PortfolioMarkdown.render_blocks(blocks, "en", "https://example.test")
    assert markdown =~ ~S(## A \[literal\] \*heading\*)
    assert markdown =~ "Read [the details](<https://example.test/details>)."
    assert markdown =~ "- C#/.NET\n- Elixir"
  end

  test "Markdown reads every assignment and technology from shared experience data" do
    for lang <- ["sv", "en"] do
      markdown = Kalyna.PortfolioMarkdown.render(lang, "https://www.kalyna.se")

      for company <- Kalyna.Experience.companies(), project <- company.projects do
        assert markdown =~ Kalyna.Translations.t(lang, project.assignment)
        assert markdown =~ Kalyna.Translations.t(lang, project.benefit)

        for technology <- project.technologies do
          assert markdown =~ Kalyna.Translations.t(lang, technology)
        end
      end
    end
  end

  test "both languages publish Markdown with experience and contact links" do
    for {directory, heading} <- [{"", "Om Daniel Jonsson"}, {"en/", "About Daniel Jonsson"}] do
      html = File.read!(Path.join(@root, "docs/#{directory}index.html"))
      markdown = File.read!(Path.join(@root, "docs/#{directory}index.md"))
      assert html =~ ~s(type="text/markdown" href="https://www.kalyna.se/#{directory}index.md")
      assert html =~ ~s(rel="describedby" type="text/plain" href="/llms.txt")
      assert markdown =~ "# Kalyna Solutions AB"
      assert markdown =~ heading
      assert markdown =~ "Carmenta"
      assert markdown =~ "mailto:daniel@kalyna.se"
      assert markdown =~ "tel:+46707329868"
      refute markdown =~ "<script"
      refute markdown =~ "setTheme"

      assert File.read!(Path.join(@root, "docs/llms.txt")) =~
               "https://www.kalyna.se/#{directory}index.md"
    end
  end

  test "skill discovery points to an unchanged artifact with a matching digest" do
    index =
      @root
      |> Path.join("docs/.well-known/agent-skills/index.json")
      |> File.read!()
      |> Jason.decode!()

    assert index["$schema"] == "https://schemas.agentskills.io/discovery/0.2.0/schema.json"
    assert [skill] = index["skills"]
    assert skill["type"] == "skill-md"
    assert skill["name"] == "read-kalyna-portfolio"
    artifact = File.read!(@root <> "/docs" <> skill["url"])
    assert artifact == File.read!(@root <> "/extra" <> skill["url"])

    ["", frontmatter, _body] = String.split(artifact, "---", parts: 3)
    metadata = YamlElixir.read_from_string!(frontmatter)
    assert metadata["name"] == skill["name"]
    assert metadata["description"] == skill["description"]

    assert skill["digest"] ==
             "sha256:" <> Base.encode16(:crypto.hash(:sha256, artifact), case: :lower)

    assert File.exists?(Path.join(@root, "docs/.nojekyll"))
  end

  test "content signals allow training, search and AI input" do
    robots = File.read!(Path.join(@root, "docs/robots.txt"))
    assert robots =~ "Content-Signal: search=yes, ai-input=yes, ai-train=yes"
  end
end
