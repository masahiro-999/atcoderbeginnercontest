defmodule Abc283.A do
  def main() do
    solve(IO.read(:stdio, :all))
    |> IO.puts()
  end

  def solve(input) do
    {a, b} =
      input
      |> parse()

    pow(a, b)
  end

  def pow(a, 0) do
    1
  end

  def pow(a, n) do
    a * pow(a, n - 1)
  end


  def parse(input) do

    [a, b] =
      input
      |> String.trim()
      |> String.split(" ")
      |> Enum.map(&String.to_integer/1)

    {a, b}
  end
end
