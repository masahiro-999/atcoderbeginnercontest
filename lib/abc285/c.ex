defmodule Abc285.C do
  def main() do
    solve(IO.read(:stdio, :all))
    |> IO.puts()
  end

  def solve(input) do
    s =
      input
      |> parse()

    len = String.length(s)
    offset(len-1) + az_to10(s) + 1
  end

  def offset(0) do
    0
  end

  def offset(n) do
    26 + 26 * offset(n - 1)
  end

  def az_to10(s) do
    s
    |> String.to_charlist()
    |> Enum.reduce(0, fn (val, acc) ->
      val = val - ?A
      acc * 26 + val
    end)
  end

  def parse(input) do

    input
    |> String.trim()
  end
end
