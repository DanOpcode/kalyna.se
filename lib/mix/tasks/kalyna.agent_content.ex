defmodule Mix.Tasks.Kalyna.AgentContent do
  use Mix.Task

  @shortdoc "Generate Markdown and static agent discovery documents"
  def run(_args) do
    output = Application.fetch_env!(:tableau, :config) |> Keyword.fetch!(:out_dir)

    {message, status} =
      System.cmd("python3", ["scripts/build-agent-content.py", output], stderr_to_stdout: true)

    if status != 0, do: Mix.raise(message)
    Mix.shell().info(message)
  end
end
