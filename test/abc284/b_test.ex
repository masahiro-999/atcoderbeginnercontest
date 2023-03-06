defmodule Abc284BTest do
  use ExUnit.Case
  alias Abc284.B, as: Target

  setup do
    inout = [
      [
        """
        4
        3
        1 2 3
        2
        20 23
        10
        6 10 4 1 5 9 8 6 5 1
        1
        1000000000
        """,
        """
        2
        1
        5
        0
        """
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
