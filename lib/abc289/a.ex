defmodule Abc289.A do
  # https://atcoder.jp/contests/abc289/tasks/abc289_a
  def main() do
    solve(IO.read(:stdio, :all))
    |> IO.puts()
  end

  def solve(input) do
    input
    |> String.trim()
    |> String.to_charlist()
    |> Enum.map(fn
      ?0 -> ?1
      ?1 -> ?0
    end)
    |> List.to_string()
  end
end
