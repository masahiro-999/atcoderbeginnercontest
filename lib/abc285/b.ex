defmodule Abc285.B do
  def main() do
    solve(IO.read(:stdio, :all))
    |> IO.puts()
  end

  def solve(input) do
    {n, s} =
      input
      |> perse()

    ret =
    for i <- 1..n-1 do
      <<_skip ::binary-size(i), s2 ::binary>> = s
      comp(s, s2, 0)
    end

    Enum.join(ret, "\n") <> "\n"
  end

  def comp(_, "" , count) do
    count
  end

  def comp(<<h1 ::binary-size(1), tail1 ::binary>>, <<h2 ::binary-size(1), tail2 ::binary>>, count) when h1 != h2 do
    # IO.inspect({h1, tail1, h2, tail2}, label: "comp")
    comp(tail1, tail2, count + 1)
  end

  def comp(_, _ , count) do
    count
  end

  def perse(input) do

    # 2行パタン
    [n, s] =
      input
      |> String.trim()
      |> String.split("\n")

    n = String.to_integer(n)
    {n, s}
  end
end
