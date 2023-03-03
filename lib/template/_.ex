defmodule AbcXXX.X do
  def main() do
    solve(IO.read(:stdio, :all))
    |> IO.puts()
  end

  def solve(input) do
    {} =
      input
      |> perse()

  end

  def perse(input) do

    # 2行パタン
    [head, data] =
      input
      |> String.trim()
      |> String.split("\n")


    [n] =
      head
      |> Enum.map(&String.to_integer/1)


    # a1
    # a2
    # a3
    # …
    # a =
    #   data
    #   |> Enum.map(&String.to_integer/1)

    # a1, a2, a3, …
    # a = String.split(a, " ") |> Enum.map(&String.to_integer/1)

    # {a1, b1},{a2, b2},{a3, b3}, …
    # data =
    #   data
    #   |> Enum.map(&String.split(&1, " "))
    #   |> Enum.map(fn [a, b] -> {String.to_integer(a), String.to_integer(b)} end)
    {n, data}
  end
end
