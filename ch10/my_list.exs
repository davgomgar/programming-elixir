defmodule MyList do
  @moduledoc """
    This module
  """
  @doc """
    This function calculates the sum of the elements of a given list.
  """
  def sum([]), do: 0
  def sum([h|t]), do: h + sum(t)
  @doc """
    This function performs a map operation to each element in the list
    and after that, it sums everything
  """
  def mapsum([], _), do: 0
  def mapsum([h|t], fun), do: fun.(h) + mapsum(t, fun)

  @doc """
      Calculates the maximum value of a given list
  """
  def max([]), do: nil
  def max([x]), do: x
  def max([h|t]), do: Kernel.max(h, max(t))

  @doc """
    This function calculates the Caesar cypher for a given string
  """
  def caesar([], _), do: ""
  def caesar([h|t], n) when h + n <= ?z, do: [ h + n | caesar(t,n)]
  def caesar([h|t], n) when h + n >?z, do: [ h + n - 26 | caesar(t, n)]

  @doc """
    This functions returns a list of numbers from 'from' upto 'to'
  """
  def span(from, to) when from > to, do: []
  def span(from, to), do: [from | span(from+1, to)]

end

