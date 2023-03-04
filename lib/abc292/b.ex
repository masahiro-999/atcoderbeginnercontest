defmodule Abc292.B do
  def main() do
    solve(IO.read(:stdio, :all))
    |> IO.puts()
  end

  def solve(input) do
    {n,q,data} =
      input
      |> parse()

    table = Tuple.duplicate(0, n + 1)
    {table, result} =
    Enum.reduce(data, {table, []}, fn ({cmd, x}, {table, result}) ->
      update_table(table, result, cmd, x)
    end)

    Enum.join(result, "\n") <> "\n"
  end

  def update_table(table, result, 1, x) do
    {put_elem(table, x, elem(table, x) + 1 ), result}
  end

  def update_table(table, result, 2, x) do
    {put_elem(table, x, 2), result}
  end

  def update_table(table, result, 3, x) do
    {table,
      if elem(table, x) >= 2 do
        result ++ ["Yes"]
      else
        result ++ ["No"]
      end
    }
  end
  def parse(input) do

    # 2行パタン
    [head| data] =
      input
      |> String.trim()
      |> String.split("\n")


    [n, q] =
      head
      |> String.split(" ")
      |> Enum.map(&String.to_integer/1)


    data =
      data
      |> Enum.map(&String.split(&1, " "))
      |> Enum.map(fn [a, b] -> {String.to_integer(a), String.to_integer(b)} end)
    {n, q, data}
  end
end
