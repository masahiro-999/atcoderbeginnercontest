defmodule Abc289ATest do
  use ExUnit.Case

  test "test1" do
    ret =
      """
      1100
      """
      |> Abc289.A.solve()

    assert "0011" = ret
  end
end
