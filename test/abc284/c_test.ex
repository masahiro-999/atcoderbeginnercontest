defmodule Abc284CTest do
  use ExUnit.Case
  alias Abc284.C, as: Target

  setup do
    inout = [
      [
        """
        5 3
        1 2
        1 3
        4 5
        """,
        "2"
      ],
      [
        """
        5 0
        """,
        "5"
      ],
      [
        """
        4 6
        1 2
        1 3
        1 4
        2 3
        2 4
        3 4
        """,
        "1"
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
