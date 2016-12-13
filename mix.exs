defmodule LazyInteger.Mixfile do
  use Mix.Project

  def project do
    [app: :lazy_integer,
     version: "1.0.0",
     elixir: "~> 1.3",
     name: "LazyInteger",
     description: description,
     package: package,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application, do: []

  def description do
    "Ecto type to cast floats or strings to integers for your schemas."
  end

  def package do
    [
      licenses: ["MIT"],
      maintainers: ["Daniel Zendejas"],
      links: %{"GitHub" => "https://github.com/danielzendejas/lazy_integer"}
    ]
  end

  defp deps do
    [{:ecto, "~> 1.0"},
     {:ex_doc, "~> 0.10", only: :dev}]
  end
end
