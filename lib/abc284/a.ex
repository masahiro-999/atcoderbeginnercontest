defmodule Abc284.A do
  def main() do
    solve(IO.read(:stdio, :all))
    |> IO.puts()
  end

  def solve(input) do
    {n, data} =
      input
      |> parse()

      ret =
      Enum.reverse(data)
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


    {n, data}
  end
end
