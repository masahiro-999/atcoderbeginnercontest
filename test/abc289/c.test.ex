defmodule Abc289CTest do
  use ExUnit.Case

  test "parse" do

    ret =
    """
    3 3
    2
    1 2
    2
    1 3
    1
    2
    """
    |> Abc289.C.perse()
    assert ret == {3, 3, [["1", "2"], ["1", "3"], ["2"]]}
  end

  test "solve" do

    ret =
    """
    3 3
    2
    1 2
    2
    1 3
    1
    2
    """
    |> Abc289.C.solve()
    assert ret == 3
  end

  test "solve2" do

    ret =
    """
    4 2
    2
    1 2
    2
    1 3
    """
    |> Abc289.C.solve()
    assert ret == 0
  end

  test "solve3" do

    ret =
    """
    6 6
    3
    2 3 6
    3
    2 4 6
    2
    3 6
    3
    1 5 6
    3
    1 3 6
    2
    1 4
    """
    |> Abc289.C.solve()
    assert ret == 18
  end

end
