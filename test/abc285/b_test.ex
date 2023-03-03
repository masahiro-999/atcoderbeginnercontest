defmodule Abc285BTest do
  use ExUnit.Case

  alias Abc285.B, as: Target

  test "test1" do
    ret =
      """
      6
      abcbac
      """
      |> Target.solve()

    assert ret ==
      """
      5
      1
      2
      0
      1
      """
  end


end
