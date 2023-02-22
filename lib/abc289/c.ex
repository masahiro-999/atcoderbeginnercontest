defmodule Abc289.C do

  import Bitwise

  def main() do
    solve(IO.read(:stdio, :all))
    |> IO.puts()
  end

  def solve(input) do
      input
      |> perse()
      |> check_all_pattern()
  end

  def check_all_pattern({n, m, s}) do
    for i <- 1..((1<<<m)-1), reduce: 0 do
      count -> if Enum.count(union(s, i)) == n, do: count + 1, else: count
    end
  end

  def union(_ , select_pattern) when select_pattern == 0 do
    MapSet.new([])
  end

  def union([_head| tail] , select_pattern) when Bitwise.band(select_pattern, 1) == 0 do
    union(tail, select_pattern >>> 1)
  end

  def union([head| tail] , select_pattern) when Bitwise.band(select_pattern, 1) == 1 do
    MapSet.union(MapSet.new(head), union(tail, select_pattern >>> 1))
  end

  def perse(input) do
    [head | data] =
    input
    |> String.split("\n")

    [n,m] =
      head
      |> String.split(" ")
      |>Enum.map(&String.to_integer/1)

    s =
      data
      |> Enum.take(m*2)
      |> Enum.chunk_every(2)
      |> Enum.map(fn [c, data] ->
        String.split(data, " ")
      end)
    {n, m, s}
  end

end
