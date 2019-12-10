defmodule Day2 do
  def part1(input) do
    run_intcode(input, input)
  end

  def part2(_input) do
    # TODO
  end

  def prepare_input(input) do
    String.trim(input)
    |> String.split(",")
    |> Stream.map(&Integer.parse/1)
    |> Enum.map(fn {val, _} -> val end)
    |> List.replace_at(1, 12)
    |> List.replace_at(2, 2)
  end

  defp run_intcode(rem_list, master_list) do
    [op, x1_i, x2_i, dest_i | rest] = rem_list

    case op do
      1 -> do_add(x1_i, x2_i, dest_i)
      2 -> raise "2"
      99 -> raise "99"
      n -> raise n
    end
  end

  defp do_add
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
