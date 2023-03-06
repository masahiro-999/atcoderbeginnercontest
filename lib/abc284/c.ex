defmodule Abc284.C do
  def main() do
    solve(IO.read(:stdio, :all))
    |> IO.puts()
  end

  def solve(input) do
    {n, _m, data} =
      input
      |> parse()

    u =
      data
      |> Enum.reduce(new_union(n + 1), fn {a, b}, u ->
      union(u, a, b)
    end)

    num_g =
    for i <- 1..n, reduce: 0 do
      count -> if elem(u,i) < 0, do: count + 1, else: count
    end
    "#{num_g}"
  end

  def new_union(n) do
    for _i <- 0..n-1, reduce: {} do
      acc -> Tuple.append(acc, -1)
    end
  end

  def union(u, a, b) do
    {u, a} = find(u, a)
    {u, b} = find(u, b)
    if a == b do
      u
    else
      {a, b} =
        if elem(u, a) > elem(u, b) do
          {b, a}
        else
          {a, b}
        end

      u
      |> put_elem(a, elem(u, a) + elem(u, b))
      |> put_elem(b, a)
    end
   end

  def find(u, a) do
    cond do
      elem(u, a) < 0 -> {u, a}
      true ->
        {u, new_parent} = find(u, elem(u, a))
        {put_elem(u, a, new_parent), new_parent}
    end
  end


  def parse(input) do
    # 2行パタン
    [head| data] =
      input
      |> String.trim()
      |> String.split("\n")


    [n, m] =
      head
      |> String.split(" ")
      |> Enum.map(&String.to_integer/1)


    # {a1, b1},{a2, b2},{a3, b3}, …
    data =
      data
      |> Enum.map(&String.split(&1, " "))
      |> Enum.map(fn [a, b] -> {String.to_integer(a), String.to_integer(b)} end)
    {n, m, data}
  end
end
