defmodule Abc292ATest do
  use ExUnit.Case
  alias Abc292.A, as: Target

  setup do
    inout = [
      [
        """
        abc
        """,
        "ABC"
      ]
    ]

    {:ok, inout: inout}
  end

  test "solve all", %{inout: inout} do
    inout
    |> Enum.map(fn [input, output] ->
      input
      |> Target.parse()
      |> IO.inspect(label: "input")

      assert Target.solve(input) == output
    end)
  end

  # test "solve 1", %{inout: inout} do
  #   [input, output] = hd(inout)
  #   assert Abc286.A.solve(input) == output
  # end

  # test "solve 2", %{inout: inout} do
  #   [input, output] = hd(tl(inout))
  #   assert Abc286.A.solve(input) == output
  # end

  # test "solve 3", %{inout: inout} do
  #   [input, output] = hd(tl(tl(inout)))
  #   assert Abc286.A.solve(input) == output
  # end

  # test "solve 4", %{inout: inout} do
  #   [input, output] = hd(tl(tl(tl(inout))))
  #   assert Abc286.A.solve(input) == output
  # end
end
