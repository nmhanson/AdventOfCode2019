defmodule Day2 do
  def part1(input) do
    List.replace_at(input, 1, 12)
    |> List.replace_at(2, 2)
    |> run_intcode
    |> Enum.at(0)
  end

  def part2(_input) do
    # TODO
  end

  def prepare_input(input) do
    String.trim(input)
    |> String.split(",")
    |> Stream.map(&Integer.parse/1)
    |> Enum.map(fn {val, _} -> val end)
  end

  defp run_intcode(master_list, rem_list, noun, verb) do
    # TODO
  end

  defp run_intcode(master_list, rem_list) do
    [op, x1_i, x2_i, dest_i | rest] = rem_list

    res =
      case op do
        1 -> Enum.at(master_list, x1_i) + Enum.at(master_list, x2_i)
        2 -> Enum.at(master_list, x1_i) * Enum.at(master_list, x2_i)
        99 -> :end
        n -> raise n
      end

    if res == :end do
      master_list
    else
      List.replace_at(master_list, dest_i, res)
      |> run_intcode(rest)
    end
  end

  defp run_intcode(master_list) do
    run_intcode(master_list, master_list)
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
