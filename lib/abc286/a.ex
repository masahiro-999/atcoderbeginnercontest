defmodule Abc286.A do
  # https://atcoder.jp/contests/abc289/tasks/abc287_a
  def main() do
    solve(IO.read(:stdio, :all))
    |> IO.puts()
  end

  def solve(input) do
    [head, data] =
      input
      |> String.trim()
      |> String.split("\n")

    [n, p, q, r, s] =
      head
      |> String.split(" ")
      |> Enum.map(&String.to_integer/1)

    a =
      data
      |> String.split(" ")
      |> Enum.map(&String.to_integer/1)

    p = p - 1
    q = q - 1
    r = r - 1
    s = s - 1

    b =
        slice(a, 0, p) ++
        slice(a, r, s + 1) ++
        slice(a, q + 1, r) ++
        slice(a, p , q  + 1) ++
        slice(a, s + 1, n)

    Enum.join(b, " ")
  end

  def slice(a, s, e) do
    Enum.slice(a, s, e - s)
  end
end
