defmodule Kalyna.AgentContentTest do
  use ExUnit.Case, async: true

  @root Path.expand("..", __DIR__)

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
