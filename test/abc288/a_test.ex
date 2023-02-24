defmodule Abc288ATest do
  use ExUnit.Case

  test "test1" do
    ret =
      """
      4
      3 5
      2 -6
      -5 0
      314159265 123456789
      """
      |> Abc288.A.solve()

    assert ret ==
    """
    8
    -4
    -5
    437616054
    """
  end
end
