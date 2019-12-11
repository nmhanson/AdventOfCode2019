#!/usr/bin/env bash
DIR_NAME="day-$1"
SOURCE_FNAME="./$DIR_NAME/day$1.exs"
INPUT_FNAME="./$DIR_NAME/input.txt"
TEMPLATE_FNAME="./elixir-template"

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
else
  mkdir -p "$DIR_NAME"
  curl --cookie "session=`cat ./SECRET`" "https://adventofcode.com/2019/day/$1/input" > "$INPUT_FNAME"
fi

if [[ -f "$SOURCE_FNAME" ]]; then
  echo "Source File already exists."
else
  # Initialize Elixir template for the day's challenges
  sed "s/@DAY_NUM/$1/g" "$TEMPLATE_FNAME" > "$SOURCE_FNAME"
fi