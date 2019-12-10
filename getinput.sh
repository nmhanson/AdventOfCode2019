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
