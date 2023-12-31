defmodule Solution do
  def run do
    File.stream!("day1.in")
    |> Stream.flat_map(&String.split(&1, "", trim: true))
    |> Enum.reduce(0, fn x, acc ->
      case x do
        "(" -> acc + 1
        ")" -> acc - 1
      end
    end)
    |> IO.puts
  end
end

Solution.run()
