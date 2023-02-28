defmodule Abc286BTest do
  use ExUnit.Case

  test "test1" do
    ret =
      """
      4
      naan
      """
      |> Abc286.B.solve()

    assert ret == "nyaan"
  end

  test "test2" do
    ret =
      """
      4
      near
      """
      |> Abc286.B.solve()

    assert ret == "near"
  end

  test "test3" do
    ret =
      """
      8
      national
      """
      |> Abc286.B.solve()

    assert ret == "nyationyal"
  end

end
