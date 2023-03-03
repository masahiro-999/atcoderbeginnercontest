defmodule Abc285ATest do
  use ExUnit.Case

  alias Abc285.A, as: Target

  test "test1" do
    ret =
      """
      1 2
      """
      |> Target.solve()

    assert ret == "Yes"
  end

  test "test2" do
    ret =
      """
      2 8
      """
      |> Target.solve()

    assert ret == "No"
  end

  test "test3" do
    ret =
      """
      5 11
      """
      |> Target.solve()

    assert ret == "Yes"
  end

end
