defmodule Abc289DTest do
  use ExUnit.Case

  test "parse" do
    ret =
      """
      3
      3 4 5
      4
      4 5 6 8
      15
      """
      |> Abc289.D.perse()

    assert ret == {15, [3, 4, 5], %{4 => false, 5 => false, 6 => false, 8 => false}}
  end

  test "solve1" do
    ret =
      """
      3
      3 4 5
      4
      4 5 6 8
      15
      """
      |> Abc289.D.solve()

    assert ret == "Yes"
  end

  test "solve2" do
    ret =
      """
      4
      2 3 4 5
      4
      3 4 5 6
      8
      """
      |> Abc289.D.solve()

    assert ret == "No"
  end

  test "solve3" do
    ret =
      """
      4
      2 5 7 8
      5
      2 9 10 11 19
      20
      """
      |> Abc289.D.solve()

    assert ret == "Yes"
  end
end
