defmodule Abc289.B do
  # https://atcoder.jp/contests/abc289/tasks/abc289_b

  alias Abc289.Graph

  def main() do
    solve(IO.read(:stdio, :all))
    |> IO.puts()
  end

  def solve(input) do
    g = Graph.new()

    [nm | [a | _]] =
      input
      |> String.split("\n")

    [n, m] = String.split(nm, " ") |> Enum.map(&String.to_integer/1)

    a
    |> String.split(" ")
    |> Enum.take(m)
    |> Enum.map(&String.to_integer/1)
    |> Enum.reduce(g, fn a, g -> Graph.add_vertice_to_graph(g, {a, a + 1}) end)
    |> get_result(Enum.to_list(1..n))
    |> Enum.join(" ")
  end

  def get_result(_, []) do
    []
  end

  def get_result(g, remain) do
    i = Enum.min(remain)
    v = Graph.get_vertices(g, i)
    new_element = if v != [], do: Enum.sort(v, :desc), else: [i]
    new_element ++ get_result(g, remain -- new_element)
  end
end

defmodule Abc289.Graph do
  alias __MODULE__
  defstruct [:num, :vertices]

  def new() do
    %Graph{num: 0, vertices: %{}}
  end

  def add_vertice_to_graph(%Graph{num: num, vertices: vertices} = graph, {a1, a2}) do
    g1 = get_graph_num(graph, a1)
    g2 = get_graph_num(graph, a2)

    case {g1, g2} do
      {nil, nil} ->
        struct!(graph,
          num: num + 1,
          vertices: vertices |> Map.put(a1, num) |> Map.put(a2, num)
        )

      {nil, _} ->
        struct!(graph, num: num, vertices: Map.put(vertices, a1, g2))

      {_, nil} ->
        struct!(graph, num: num, vertices: Map.put(vertices, a2, g1))

      {_, _} ->
        merge(graph, g1, g2)
    end
  end

  def get_graph_num(%Graph{vertices: vertices}, vertice) do
    Map.get(vertices, vertice, nil)
  end

  def get_vertices(%Graph{} = graph, vertice) do
    g = get_graph_num(graph, vertice)
    get_vertices_has_num(graph, g)
  end

  def get_vertices_has_num(%Graph{}, nil) do
    []
  end

  def get_vertices_has_num(%Graph{vertices: vertices}, num) do
    vertices
    |> Enum.filter(fn {_k, v} -> v == num end)
    |> Enum.map(fn {k, _v} -> k end)
  end

  def merge(%Graph{vertices: vertices} = graph, g1, g2) do
    struct!(graph,
      vertices:
        Enum.map(vertices, fn
          {k, ^g2} -> {k, g1}
          {k, v} -> {k, v}
        end)
        |> Enum.into(%{})
    )
  end
end
