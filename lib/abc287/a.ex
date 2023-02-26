defmodule Abc287.A do
  # https://atcoder.jp/contests/abc289/tasks/abc287_a
  def main() do
    solve(IO.read(:stdio, :all))
    |> IO.puts()
  end

  def solve(input) do
    [n | data] =
    input
    |> String.trim()
    |> String.split("\n")

    n = String.to_integer(n)

    ret =
    data
    |> Enum.count(fn s -> s == "For" end)

    if div(n+1,2) <= ret, do: "Yes", else: "No"
  end
end
