defmodule Primes do
  import MyList, only: [span: 2] 
  @doc """
  This function generates a list with all the existing primes from 'from' upto 'to'
  """
  def primes(from, to) do
    for x <- span(from, to), is_prime(x), do: x
  end

  @doc """
  This function checks if a given number is a prime number
  """
  def is_prime(x) do
    not (factors(x) |> Enum.any?)
  end

  @doc """

  """
  def factors(x), do: ((for i <- span(2, round(:math.sqrt(x))), do: rem(x, i) == 0))
end
