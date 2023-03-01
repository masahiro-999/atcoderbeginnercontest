defmodule Abc287BTest do
  use ExUnit.Case

  test "test1" do
    ret =
      """
      3 3
      142857
      004159
      071028
      159
      287
      857
      """
      |> Abc287.B.solve()

    assert ret == 2
  end

  test "test2" do
    ret =
      """
      5 4
      235983
      109467
      823476
      592801
      000333
      333
      108
      467
      983
      """
      |> Abc287.B.solve()

    assert ret == 3
  end

  test "test3" do
    ret =
      """
      4 4
      000000
      123456
      987111
      000000
      000
      111
      999
      111
      """
      |> Abc287.B.solve()

    assert ret == 3
  end


end
