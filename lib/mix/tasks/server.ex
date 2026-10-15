defmodule Mix.Tasks.Kalyna.Server do
  use Mix.Task

  @shortdoc "Starts Tableau with live reload on port 4000"
  @impl Mix.Task
  def run(_args) do
    if Mix.env() != :dev, do: Mix.raise("The development server requires MIX_ENV=dev")

    # Tableau 0.30 hardcodes port 4999. Start its normal development children
    # with our Bandit configuration instead of its Server child.
    Application.put_env(:tableau, :server, false)
    Code.put_compiler_option(:ignore_module_conflict, true)
    Mix.Task.run("app.start", ["--preload-modules"])

    children =
      [
        WebDevUtils.FileSystem,
        {Bandit, scheme: :http, plug: TableauDevServer.Router, port: 4000},
        WebDevUtils.CodeReloader
      ] ++ TableauDevServer.ServerSupervisor.asset_children()

    {:ok, _pid} = Supervisor.start_link(children, strategy: :one_for_one)
    Mix.shell().info("Development server: http://localhost:4000")
    Mix.Tasks.Run.run(["--no-halt"])
  end
end
