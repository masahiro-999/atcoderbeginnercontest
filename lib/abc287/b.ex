defmodule Abc287.B do
  def main() do
    solve(IO.read(:stdio, :all))
    |> IO.puts()
  end

  def solve(input) do

    {s, t} =
    input
    |> perse()

    table = Enum.reduce(t, %{}, fn (elem, acc) ->
      Map.put(acc, elem, true)
    end)

    check(s, table, 0)
  end

  def check([], _table, count) do
    count
  end

  def check([current|next], table, count) do
    <<_head ::binary-size(3), tail ::binary>> = current
    if Map.get(table, tail, false) do
      check(next, table, count + 1)
    else
      check(next, table, count)
    end
  end

  def perse(input) do
    [head | data] =
    input
    |> String.trim()
    |> String.split("\n")

    [n, _m] = String.split(head, " ") |> Enum.map(&String.to_integer/1)

    s = Enum.take(data, n)

    t = Enum.slice(data, n..-1)

    {s, t}
  end
end
