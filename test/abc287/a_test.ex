defmodule Abc287ATest do
  use ExUnit.Case

  test "test1" do
    ret =
      """
      3
      For
      Against
      For
      """
      |> Abc287.A.solve()

    assert ret == "Yes"
  end

  test "test2" do
    ret =
      """
      5
      Against
      Against
      For
      Against
      For

      """
      |> Abc287.A.solve()

    assert ret == "No"
  end


end
