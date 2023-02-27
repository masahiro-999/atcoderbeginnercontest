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
      if p == 0 do
        []
      else
        Enum.slice(a, 0..(p - 1))
      end ++
        Enum.slice(a, r..s) ++
        if q + 1 < r do
          Enum.slice(a, (q + 1)..(r - 1))
        else
          []
        end ++
        Enum.slice(a, p..q) ++
        if s == n - 1 do
          []
        else
          Enum.slice(a, (s + 1)..(n - 1))
        end

    Enum.join(b, " ")
  end
end
