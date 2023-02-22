defmodule Abc289ATest do
  use ExUnit.Case

  alias Abc289.Graph

  test "test1" do
    g = Graph.new()
    g = Graph.add_vertice_to_graph(g, {1, 2})
    assert %Graph{num: 1, vertices: %{1 => 0, 2 => 0}} = g
  end

  test "test2" do
    g = Graph.new()
    g = Graph.add_vertice_to_graph(g, {1, 2})
    g = Graph.add_vertice_to_graph(g, {3, 4})
    assert %Graph{num: 2, vertices: %{1 => 0, 2 => 0, 3 => 1, 4 => 1}} = g
  end

  test "test3" do
    g = Graph.new()
    g = Graph.add_vertice_to_graph(g, {1, 2})
    g = Graph.add_vertice_to_graph(g, {2, 3})
    assert %Graph{num: 1, vertices: %{1 => 0, 2 => 0, 3 => 0}} = g
  end

  test "test4" do
    g = Graph.new()
    g = Graph.add_vertice_to_graph(g, {1, 3})
    g = Graph.add_vertice_to_graph(g, {2, 3})
    assert %Graph{num: 1, vertices: %{1 => 0, 2 => 0, 3 => 0}} = g
  end

  test "test5" do
    g = Graph.new()
    g = Graph.add_vertice_to_graph(g, {1, 2})
    g = Graph.add_vertice_to_graph(g, {3, 4})
    g = Graph.add_vertice_to_graph(g, {1, 4})
    assert %Graph{vertices: %{1 => 0, 2 => 0, 3 => 0, 4 => 0}} = g
  end

  test "test6" do
    g = Graph.new()
    g = Graph.add_vertice_to_graph(g, {1, 2})
    g = Graph.add_vertice_to_graph(g, {3, 4})
    g = Graph.add_vertice_to_graph(g, {2, 5})
    assert Graph.get_vertices(g, 1) == [1, 2, 5]
    assert Graph.get_vertices(g, 3) == [3, 4]
  end

  test "test7" do
    g = Graph.new()
    g = Graph.add_vertice_to_graph(g, {1, 2})
    assert Graph.get_vertices(g, 4) == []
  end

  test "solve1" do
    ret =
      """
      5 3
      1 3 4
      """
      |> Abc289.B.solve()

    assert ret == "2 1 5 4 3"
  end

  test "solve2" do
    ret =
      """
      5 0
      """
      |> Abc289.B.solve()

    assert ret == "1 2 3 4 5"
  end

  test "solve3" do
    ret =
      """
      10 6
      1 2 3 7 8 9
      """
      |> Abc289.B.solve()

    assert ret == "4 3 2 1 5 6 10 9 8 7"
  end
end
