defmodule UnionFind do
  def new(n) do
    for _i <- 0..n-1, reduce: {} do
      acc -> Tuple.append(acc, -1)
    end
  end

  def union(u, a, b) do
    {u, a} = find_and_update(u, a)
    {u, b} = find_and_update(u, b)
    if a == b do
      u
    else
      {a, b} =
        if elem(u, a) > elem(u, b) do
          {b, a}
        else
          {a, b}
        end

      u
      |> put_elem(a, elem(u, a) + elem(u, b))
      |> put_elem(b, a)
    end
   end

  def find_and_update(u, a) do
    cond do
      elem(u, a) < 0 -> {u, a}
      true ->
        {u, new_parent} = find_and_update(u, elem(u, a))
        {put_elem(u, a, new_parent), new_parent}
    end
  end

  def find(u, a) do
    cond do
      elem(u, a) < 0 -> a
      true -> find(u, elem(u, a))
    end
  end

  def same(u, a, b) do
    find(u, a) == find(u, b)
  end

  def members(u, a) do
    root = find(u, a)
    for a <- 0..tuple_size(u)-1, reduce: [] do
      acc ->
        root_a = find(u, a)
        if root_a == root , do: [a | acc], else: acc
    end
  end

  def roots(u) do
    for a when elem(u, a) < 0 <- 0..tuple_size(u)-1 do
      a
    end
  end

  def group_count(u) do
    Enum.count(roots(u))
  end

  def all_group_members(u) do
    for a <- 0..tuple_size(u)-1, reduce: %{} do
      acc ->
        root = find(u, a)
        val = Map.get(acc, root, [])
        Map.put(acc, root ,[a | val])
    end
  end
end
