defmodule LazyInteger do
  @behaviour Ecto.Type
  def type, do: :integer

  def cast(float) when is_float(float), do: {:ok, round(float)}
  def cast(int) when is_integer(int), do: {:ok, int}
  def cast(string) when is_binary(string) do
    case Integer.parse(string) do
      {int, _} -> {:ok, int}
      _ -> :error
    end
  end
  def cast(_), do: :error

  def load(int) when is_integer(int), do: {:ok, int}
  def load(float) when is_float(float), do: {:ok, float}
  def load(string) when is_binary(string), do: {:ok, string}

  def dump(int) when is_integer(int), do: {:ok, int}
  def dump(_), do: :error
end
