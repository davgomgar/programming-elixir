defmodule CharLists do

  def is_printable?(char_list), do: Enum.all?(char_list, fn(char) -> char in ? ..?~ end)

  def anagrams?(word1, word2) do
    Enum.to_list(word1) |> Enum.sort == Enum.to_list(word2) |> Enum.sort
  end

  def calculate(expression) do
    {op1, rest} = _parse_number({0, expression})
    {op_fun, rest} = parse_operator(rest) 
    {op2 , []} = _parse_number({0, rest})
    op_fun.(op1, op2)
  end

  defp parse_operator([?+ | rest]), do: {&(&1 + &2), rest}
  defp parse_operator([?- | rest]), do: {&(&1 - &2), rest}
  defp parse_operator([?* | rest]), do: {&(&1 * &2), rest}
  defp parse_operator([?/ | rest]), do: {&(div(&1, &2)), rest}

  defp _parse_number({result, [digit | expression]}) when digit in ?0..?9 do
    _parse_number({result * 10 + digit - ?0, expression})
  end
  defp _parse_number(result), do: result
end

