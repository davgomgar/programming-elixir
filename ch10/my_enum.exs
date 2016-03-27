defmodule MyEnum do

  @moduledoc """
     This module implements some utility functions for Enums
     """

  @doc """
   Checks if all the elements of a given enum return true if the function `fun` is applied to them
   Returns: `true` | `false`
  """
  def all?([h|t], fun), do: _all?(t, fun, fun.(h)) 
  def _all?(_, _, false), do: false
  def _all?([], _, _), do: true
  def _all?([h|t], fun, _), do: _all?(t, fun, fun.(h))

  @doc """
    Applies function `fun` to each element of the given enum
  """
  def each(arr, fun), do: _each(arr, fun)
  def _each([], _), do: :ok
  def _each([h|t], fun) do
    fun.(h)
    _each(t, fun)
  end

  @doc """
   Splits the `enumerable` into two enumerables, leaving `count` elements in the first enumerable
   Enum.split splits the enumerable even if the `count` value is negative. This function needs a positive `count` value 
  """
  def split(enumerable, count) when count > 0, do: _split(enumerable, count, [], [])
  def _split([], _, first, second), do: {Enum.reverse(first), Enum.reverse(second)}
  def _split([h|t], count, first, second) when count > 0, do: _split(t, count - 1, [h|first], second)
  def _split([h|t], count, first, second) when count <= 0, do: _split(t, count - 1, first, [h|second])
end
