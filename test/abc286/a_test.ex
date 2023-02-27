defmodule Abc286ATest do
  use ExUnit.Case

  test "test1" do
    ret =
      """
      8 1 3 5 7
      1 2 3 4 5 6 7 8
      """
      |> Abc286.A.solve()

    assert ret == "5 6 7 4 1 2 3 8"
  end

  test "test2" do
    ret =
      """
      5 2 3 4 5
      2 2 1 1 1
      """
      |> Abc286.A.solve()

    assert ret == "2 1 1 2 1"
  end

  test "test3" do
    ret =
      """
      2 1 1 2 2
      50 100
      """
      |> Abc286.A.solve()

    assert ret == "100 50"
  end

  test "test4" do
    ret =
      """
      10 2 4 7 9
      22 75 26 45 72 81 47 29 97 2
      """
      |> Abc286.A.solve()

    assert ret == "22 47 29 97 72 81 75 26 45 2"
  end
end
