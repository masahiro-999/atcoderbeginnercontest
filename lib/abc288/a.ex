defmodule Abc288.A do
  # https://atcoder.jp/contests/abc289/tasks/abc288_a
  def main() do
    solve(IO.read(:stdio, :all))
    |> IO.puts()
  end

  def solve(input) do
    [_head | data] =
    input
    |> String.trim()
    |> String.split("\n")

    ret =
    data
    |> Enum.map(fn s ->
      [a,b] =
      s
      |> String.split(" ")
      |> Enum.map(&String.to_integer/1)
      a + b
    end)
    |> Enum.join("\n")
    ret <> "\n"
  end
end
