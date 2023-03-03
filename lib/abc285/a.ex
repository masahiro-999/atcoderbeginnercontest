defmodule Abc285.A do

  import Bitwise
  def main() do
    solve(IO.read(:stdio, :all))
    |> IO.puts()
  end

  def solve(input) do
    {a, b} =
      input
      |> perse()

      if((a <<< 1) == b or (a <<< 1) + 1 == b, do: "Yes", else: "No")
  end

  def perse(input) do
    [a, b] =
    input
    |> String.trim()
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)

    {a, b}
  end
end
