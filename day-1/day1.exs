defmodule Day1 do
  def part1(input) do
    Stream.map(input, fn mass -> div(mass, 3) - 2 end)
    |> Enum.sum()
    |> Integer.to_string()
  end

  def part2(input) do
    Stream.map(input, &calc_fuel_recursive/1)
    |> Enum.sum()
    |> Integer.to_string()
  end

  defp calc_fuel_recursive(mass) do
    case div(mass, 3) - 2 do
      new_mass when new_mass <= 0 -> 0
      new_mass -> new_mass + calc_fuel_recursive(new_mass)
    end
  end

  def prepare_input(input) do
    String.trim(input)
    |> String.split("\n")
    |> Stream.map(&Integer.parse/1)
    |> Stream.map(fn {mass, _} -> mass end)
  end
end

{:ok, input} = File.read("input.txt")

prepared_input = Day1.prepare_input(input)

result =
  case System.argv() do
    ["1"] -> Day1.part1(prepared_input)
    ["2"] -> Day1.part2(prepared_input)
    [] -> Day1.part1(prepared_input) <> "\n" <> Day1.part2(prepared_input)
    _ -> "?"
  end

IO.puts(result)
