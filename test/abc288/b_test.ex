defmodule Abc288BTest do
  use ExUnit.Case

  test "test1" do
    ret =
      """
      5 3
      abc
      aaaaa
      xyz
      a
      def
      """
      |> Abc288.B.solve()

    assert ret ==
    """
    aaaaa
    abc
    xyz
    """
  end

  test "test2" do
    ret =
      """
      4 4
      z
      zyx
      zzz
      rbg
      """
      |> Abc288.B.solve()

    assert ret ==
    """
    rbg
    z
    zyx
    zzz
    """
  end

  test "test3" do
    ret =
      """
      3 1
      abc
      arc
      agc
      """
      |> Abc288.B.solve()

    assert ret ==
    """
    abc
    """
  end

end
