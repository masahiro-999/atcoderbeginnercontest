defmodule Abc286.B do
  def main() do
    solve(IO.read(:stdio, :all))
    |> IO.puts()
  end

  def solve(input) do
    input
    |> perse()
    |> replace()
    # |> String.replace("na", "nya")
  end

  def replace("") do
    ""
  end

  def replace("na"  <> tail) do
    "nya" <> replace(tail)
  end

  def replace(<<head ::binary-size(1), tail ::binary>>) do
    head <> replace(tail)
  end

  def perse(input) do
    [_n , s] =
    input
    |> String.trim()
    |> String.split("\n")

    s
  end
end
