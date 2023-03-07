defmodule UnionFindTest do
  use ExUnit.Case

  import UnionFind

  test "same" do
    u =
      new(10)
      |> union(1,2)
      |> union(6,7)
      |> union(4,5)
      |> union(2,4)

    assert same(u, 1, 2) == true
    assert same(u, 1, 5) == true
    assert same(u, 1, 7) == false
  end

  test "other func" do
    u =
      new(10)
      |> union(1,2)
      |> union(6,7)
      |> union(4,5)
      |> union(2,4)

    assert members(u, 1) == [5, 4, 2, 1]
    assert roots(u) == [0, 1, 3, 6, 8, 9]
    assert group_count(u) == 6
    assert all_group_members(u) == %{0 => [0], 1 => [5, 4, 2, 1], 3 => [3], 6 => [7, 6], 8 => [8], 9 => [9]}
  end

end
