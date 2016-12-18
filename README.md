# LazyInteger

Ecto type to cast floats or strings to integers for your schemas.

## Installation

[Available in Hex](https://hex.pm/packages/lazy_integer/1.0.0), the package can be installed as:

  1. Add `lazy_integer` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:lazy_integer, "~> 1.0.0"}]
    end
    ```

  2. Ensure `lazy_integer` is started before your application:

    ```elixir
    def application do
      [applications: [:lazy_integer]]
    end
    ```

## Usage

Use LazyInteger as a type for your Ecto Schemas:

  ```elixir
  defmodule YourProject.Thing do
    use Ecto.Model

    schema "things" do
      field :first_name, :string
      field :second_name, :string
      field :age, LazyInteger
    end
  end
  ```
