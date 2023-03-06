defmodule Abc284.B do
  def main() do
    solve(IO.read(:stdio, :all))
    |> IO.puts()
  end

  def solve(input) do
    {n, data} =
      input
      |> parse()

    ret =
    data
    |> Enum.map(fn l ->
      Enum.count(l, fn x -> rem(x, 2)==1 end)
    end)
    |> Enum.join("\n")

    ret <> "\n"
  end

  def parse(input) do

    # 2行パタン
    [head | data] =
      input
      |> String.trim()
      |> String.split("\n")


    n =
      head
      |> String.to_integer()


    data =
    data
    |> Enum.chunk_every(2)
    |> Enum.map(fn [_a, b] ->
      String.split(b, " ")
      |> Enum.map(&String.to_integer/1)
      end)
    {n, data}
  end
end
