defmodule LazyInteger do
  @behaviour Ecto.Type

  @moduledoc """
  Custom Ecto Type to parse floats and strings into integers for Ecto Schemas.
  For more information on custom types please refer to
  [the documentation](https://hexdocs.pm/ecto/Ecto.Type.html)
  """

  @doc """
  Returns the integer type underneath LazyInteger.
  """
  @spec type(t) :: :integer
  def type, do: :integer

  @doc """
  Casts the given value to an integer if possible. Returns :error otherwise.
  """
  @spec cast(term) :: {:ok, int} | :error
  def cast(float) when is_float(float), do: {:ok, round(float)}
  def cast(int) when is_integer(int), do: {:ok, int}
  def cast(string) when is_binary(string) and string == "", do: {:ok, nil}
  def cast(string) when is_binary(string) do
    case Integer.parse(string) do
      {int, _} -> {:ok, int}
      _ -> :error
    end
  end
  def cast(_), do: :error

  @doc """
  Loads a value of the given type.
  """
  @spec load(term) :: {:ok, term} | :error
  def load(int) when is_integer(int), do: {:ok, int}
  def load(float) when is_float(float), do: {:ok, float}
  def load(string) when is_binary(string), do: {:ok, string}

  @doc """
  Dumps a value to the given type.
  """
  @spec dump(term) :: {:ok, int} | :error
  def dump(int) when is_integer(int), do: {:ok, int}
  def dump(_), do: :error
end
