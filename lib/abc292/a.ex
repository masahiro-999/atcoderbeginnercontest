defmodule Abc292.A do
  def main() do
    solve(IO.read(:stdio, :all))
    |> IO.puts()
  end

  def solve(input) do
      input
      |> parse()
      |> String.to_charlist()
      |> Enum.map(fn x -> x - 97 + 65 end)
      |> List.to_string
  end

  def parse(input) do

      input
      |> String.trim()
  end
end
