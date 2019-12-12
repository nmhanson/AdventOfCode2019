defmodule Day3 do
  def part1(input) do
    # TODO
  end

  def part3(input) do
    # TODO
  end

  def prepare_input(input) do
    # TODO
  end
end

{:ok, input} = File.read("input.txt")

prepared_input = Day3.prepare_input(input)

result =
  case System.argv() do
    ["1"] -> "#{Day3.part1(prepared_input)}"
    ["2"] -> "#{Day3.part2(prepared_input)}"
    [] -> "#{Day3.part1(prepared_input)}\n#{Day3.part2(prepared_input)}"
    _ -> "?"
  end

IO.puts(result)