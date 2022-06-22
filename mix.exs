defmodule ExJack.MixProject do
  use Mix.Project

  @source_url "https://github.com/fraihaav/ex_jack"
  @version "0.1.0-dev"
  @description "JACK audio interface for Elixir using Rustler-based NIF."

  def project do
    [
      app: :ex_jack,
      version: @version,
      source_url: @source_url,
      description: @description,
      elixir: "~> 1.13",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      compilers: Mix.compilers(),
      deps: deps(),
      docs: docs(),
      package: package()
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
      # {:elixir_make, "~> 0.6", runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.28.3", only: :dev, runtime: false},
      {:benchee, "~> 1.0", only: [:test, :dev]},
      {:rustler_precompiled, "~> 0.3"},
      {:credo, "~> 1.3", only: [:dev, :test], runtime: false},
	  {:rustler, ">= 0.0.0"}
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: [
        "README.md",
        "LICENSE",
        "CHANGELOG.md"
      ],
      source_ref: "v#{@version}",
      source_url: @source_url,
      groups_for_modules: [],
      skip_undefined_reference_warnings_on: ["CHANGELOG.md"]
    ]
  end

  defp package do
    [
      files: ~w[
        lib
        native/ex_jack/src
        native/ex_jack/Cargo.*
        native/ex_jack/README.md
        native/ex_jack/.cargo
        checksum-Elixir.ExJack.Native.exs
        .formatter.exs
        mix.exs
        README.md
        LICENSE
        CHANGELOG.md
      ],
      licenses: ["MIT"],
      maintainers: ["Adrian Fraiha"],
      links: %{
        "GitHub" => @source_url,
        "Changelog" => "https://hexdocs.pm/ex_jack/changelog.html"
      }
    ]
  end
end
