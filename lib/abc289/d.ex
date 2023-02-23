defmodule Abc289.D do
  def main() do
    solve(IO.read(:stdio, :all))
    |> IO.puts()
  end

  def solve(input) do
    {x, a, b} =
      input
      |> perse()

    {b, result} = di(x, a, b)
    if(result, do: "Yes", else: "No")
  end

  def di(0, _, b) do
    {b, true}
  end

  def di(i, _, b) when i < 0 do
    {b, false}
  end

  def di(i, a, b) do
    cached = Map.get(b, i, nil)
    cond do
      cached != nil -> {b, cached}
      true -> Enum.reduce_while(a, {b, false}, fn val_a, {b, _result} ->
        {b, result} = di(i - val_a, a, b)
        b = Map.put(b, i - val_a, result)
        if result do
          {:halt, {b, true}}
        else
          {:cont, {b, false}}
        end
      end)
    end
  end

  def perse(input) do
    [_n, a, _m, b, x | _] =
      input
      |> String.split("\n")

    x = String.to_integer(x)

    a = String.split(a, " ") |> Enum.map(&String.to_integer/1)
    b = String.split(b, " ") |> Enum.map(&String.to_integer/1)
    b = b |> Enum.map(fn val -> {val, false} end) |> Enum.into(%{})
    {x, a, b}
  end
end
