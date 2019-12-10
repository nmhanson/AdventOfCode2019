#!/usr/bin/env sh
DIR_NAME="day-$1"
INPUT_FNAME="./$DIR_NAME/input.txt"

if [[ $# -ne 1 ]]; then
    echo "This script takes one argument: the day # for the AoC challenge."
    exit 1
fi

if [[ $1 -lt 1 || $1 -gt 25 ]]; then
    echo "Out of date range."
    exit 1
fi

if [[ -f "$INPUT_FNAME" ]]; then
    echo "Input file already exists."
    exit 1
fi

mkdir -p "$DIR_NAME"
curl --cookie "session=`cat ./SECRET`" "https://adventofcode.com/2019/day/1/input" > "$INPUT_FNAME"

cat <<EOF > "$DIR_NAME/day$1.exs"
defmodule Day$1 do
  def part1(input) do
    # TODO
  end

  def part$1(input) do
    # TODO
  end

  def prepare_input do
    # TODO
  end
end

{:ok, input} = File.read("input.txt")

prepared_input = Day$1.prepare_input(input)

result =
  case System.argv() do
    ["1"] -> Day$1.part1(prepared_input)
    ["2"] -> Day$1.part2(prepared_input)
    [] -> Day$1.part1(prepared_input) <> "\n" <> Day$1.part2(prepared_input)
    _ -> "?"
  end

IO.puts(result)
EOF
