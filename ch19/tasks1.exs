defmodule Fibonacci do
  def of(0), do: 0
  def of(1), do: 1
  def of(n), do: of(n-1) + of(n-2)
end

IO.puts "Fibonacci using a Task..."
worker = Task.async(fn -> Fibonacci.of(40) end)
IO.puts "Doing something else... and now, execute await..."
result = Task.await(worker)
IO.puts "Fibonacci.of(40)=#{result}"


