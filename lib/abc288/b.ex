defmodule Abc288.B do
  def main() do
    solve(IO.read(:stdio, :all))
    |> IO.puts()
  end

  def solve(input) do
    input
    |> perse()
    |> sort()
  end

  def perse(input) do
    [head | s] =
    input
    |> String.trim()
    |> String.split("\n")

    [n, k] = String.split(head, " ") |> Enum.map(&String.to_integer/1)
    {n, k, s}
  end

  def sort({n, k, s}) do
    (s
    |> Enum.take(k)
    |> Enum.sort()
    |> Enum.join("\n") )<> "\n"
  end
end
