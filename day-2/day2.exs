defmodule Day2 do
  def part1(input) do
    # TODO
  end

  def part2(input) do
    # TODO
  end

  def prepare_input do
    # TODO
  end
end

{:ok, input} = File.read("input.txt")

prepared_input = Day2.prepare_input(input)

result =
  case System.argv() do
    ["1"] -> Day2.part1(prepared_input)
    ["2"] -> Day2.part2(prepared_input)
    [] -> Day2.part1(prepared_input) <> "\n" <> Day2.part2(prepared_input)
    _ -> "?"
  end

IO.puts(result)
