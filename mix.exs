defmodule Kalyna.MixProject do
  use Mix.Project

  def project do
    [
      app: :kalyna,
      version: "0.1.0",
      elixir: "~> 1.20",
      start_permanent: Mix.env() == :prod,
      compilers: Mix.compilers(),
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:tableau, "~> 0.30.0"},
      {:tailwind, "~> 0.5.1", runtime: Mix.env() == :dev},
      {:phoenix_live_view, "~> 1.2.12"}

      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp aliases do
    [
      build: [
        "tableau.build",
        "tailwind default --minify",
        "kalyna.inline_css"
      ]
    ]
  end
end
