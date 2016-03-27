defmodule MyEnum do

  @moduledoc """
     This module implements some utility functions for Enums
     """

  @doc """
   Checks if all the elements of a given enum return true if the function `fun` is applied to them
   Returns: `true` | `false`
  """
  def all?([h|t], fun), do: _all?(t, fun, fun.(h)) 
  defp _all?(_, _, false), do: false
  defp _all?([], _, _), do: true
  defp _all?([h|t], fun, _), do: _all?(t, fun, fun.(h))

  @doc """
    Applies function `fun` to each element of the given enum
  """
  def each(arr, fun), do: _each(arr, fun)
  defp _each([], _), do: :ok
  defp _each([h|t], fun) do
    fun.(h)
    _each(t, fun)
  end

  @doc """
   Splits the `enumerable` into two enumerables, leaving `count` elements in the first enumerable
   Enum.split splits the enumerable even if the `count` value is negative. This function needs a positive `count` value 
  """
  def split(enumerable, count) when count > 0, do: _split(enumerable, count, [], [])
  defp _split([], _, first, second), do: {Enum.reverse(first), Enum.reverse(second)}
  defp _split([h|t], count, first, second) when count > 0, do: _split(t, count - 1,  [h | first], second)
  defp _split([h|t], count, first, second) when count <= 0, do: _split(t, count - 1, first, [h | second])

  @doc """
   Filters the `enumerable` and return only those values which met the `condition_fn`
   """
  def filter(enumerable, condition_fn), do: _filter(enumerable, condition_fn, [])
  defp _filter([], _, results), do: Enum.reverse results
  defp _filter([h|t], condition_fn, results) do
    if condition_fn.(h) do
      _filter(t, condition_fn,  [h | results])
    else
      _filter(t, condition_fn, results)
    end
  end
  @doc """
    Takes `count` elements from the given `enumerable`
  """
  def take(enumerable, count) when count > 0, do: _take(enumerable, count, [])
  defp _take([], _, results), do: Enum.reverse results
  defp _take(_, 0, results), do: Enum.reverse results
  defp _take([h|t], count, results), do: _take(t, count - 1,  [h | results])
end
