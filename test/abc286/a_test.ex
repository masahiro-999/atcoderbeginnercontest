defmodule Abc286ATest do
  use ExUnit.Case

  setup do
    inout = [
      [
        """
        8 1 3 5 7
        1 2 3 4 5 6 7 8
        """,
        "5 6 7 4 1 2 3 8"
      ],
      [
        """
        5 2 3 4 5
        2 2 1 1 1
        """,
        "2 1 1 2 1"
      ],
      [
        """
        2 1 1 2 2
        50 100
        """,
        "100 50"
      ],
      [
        """
        10 2 4 7 9
        22 75 26 45 72 81 47 29 97 2
        """,
        "22 47 29 97 72 81 75 26 45 2"
      ]
    ]

    {:ok, inout: inout}
  end

  test "solve all", %{inout: inout} do
    inout
    |> Enum.map(fn [input, output] ->
      input
      # |> Abc286.A.parse()
      |> IO.inspect(label: "input")

      assert Abc286.A.solve(input) == output
    end)
  end

  test "solve 1", %{inout: inout} do
    [input, output] = hd(inout)
    assert Abc286.A.solve(input) == output
  end

  test "solve 2", %{inout: inout} do
    [input, output] = hd(tl(inout))
    assert Abc286.A.solve(input) == output
  end

  test "solve 3", %{inout: inout} do
    [input, output] = hd(tl(tl(inout)))
    assert Abc286.A.solve(input) == output
  end

  test "solve 4", %{inout: inout} do
    [input, output] = hd(tl(tl(tl(inout))))
    assert Abc286.A.solve(input) == output
  end
end
