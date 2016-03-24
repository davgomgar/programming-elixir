defmodule Guess do
  def number(range, number) do
    _number(range, number)
  end

  defp _number((min..max)=range, number) do
    center = div(min + max, 2)
    _number(range, number, center)
  end

  defp _number(_range, number, center) when number == center do
    IO.puts "Found it!!!! Number is #{center}"
  end

  defp _number((_min..max), number, center) when number > center do
    IO.puts "Is it #{center}?"
    _number(center..max, number, div(center + max, 2))
  end

  defp _number((min.._max), number, center) when number < center do
    IO.puts("Is it #{center}?")
    _number(min..center, number, div(min + center, 2))
  end
end

Guess.number 1..1000, 273
