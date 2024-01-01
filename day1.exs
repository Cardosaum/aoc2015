defmodule Solution do
  def read_input do
    File.stream!("day1.in")
    |> Stream.flat_map(&String.split(&1, "", trim: true))
  end

  def part1 do
    __MODULE__.read_input()
    |> Enum.reduce(0, fn x, acc ->
      case x do
        "(" -> acc + 1
        ")" -> acc - 1
      end
    end)
  end

  def part2 do
    __MODULE__.read_input()
    |> Stream.with_index(1)
    |> Stream.map(fn {x, i} ->
      case x do
        "(" -> {1, i}
        ")" -> {-1, i}
      end
    end)
    |> Stream.scan(fn {x1, i1}, {x2, _} ->
      {x1 + x2, i1}
    end)
    |> Stream.take_while(fn {x, _} -> x != -1 end)
    |> Enum.to_list()
    |> List.last()
    |> elem(1)
    |> Kernel.+(1)
  end
end

Solution.part2()
|> IO.inspect()
