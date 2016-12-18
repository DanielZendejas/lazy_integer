defmodule LazyIntegerTest do
  use ExUnit.Case
  alias Ecto.Repo
  import Ecto.Changeset
  
  defmodule TestModule do
    use Ecto.Model

    schema "test_module" do
      field :test_field, LazyInteger
    end
  end

  describe "An attribute with LazyInteger" do
    test "casts a float to an integer correctly" do
      assert changeset_valid?(%{test_field: 1.0})
    end

    test "casts a string to an integer correctly" do
      assert changeset_valid?(%{test_field: "1"})
    end

    test "can receive an integer correctly" do
      assert changeset_valid?(%{test_field: 1})
    end

    test "throws an error in every other case" do
      refute changeset_valid?(%{test_field: "wrong_value"})
      refute changeset_valid?(%{test_field: false})
      refute changeset_valid?(%{test_field: []})
      refute changeset_valid?(%{test_field: %{}})
    end
  end

  defp changeset_valid?(changes) do
    changeset = %TestModule{}
      |> cast(changes, ["test_field"], [])
      |> validate_change(:test_field, fn(_, v) -> if is_integer(v), do: [] end)
      |> Map.get(:valid?)
  end
end
