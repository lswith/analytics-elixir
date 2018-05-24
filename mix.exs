defmodule AnalyticsElixir.Mixfile do
  use Mix.Project

  def project do
    [
      app: :segment,
      version: "1.1.0",
      elixir: "~> 1.5",
      deps: deps(),
      description: "analytics_elixir",
      package: package(),
    ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [
      mod: {Segment.Application, []},
      extra_applications: [:logger],
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 0.13"},
      {:poison, "~> 3.1"},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:mox, ">= 0.0.0", only: :test}
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Luke Swithenbank"],
      licenses: ["MIT"],
      links: %{ "GitHub" => "https://github.com/lswith/analytics-elixir" }
    ]
  end
end
