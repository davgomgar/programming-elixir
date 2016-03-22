# Exercise Functions-4 from book Programming Elixir:
# Functional |> Concurrent |> Pragmatic |> Fun

prefix = fn (prefix) ->
  fn (str) ->  "#{prefix} #{str}" end
end

#Use this functions
mrs = prefix.("Mrs.")
IO.puts mrs.("Smith")
IO.puts prefix.("Elixir").("Rocks")

currying = prefix.("Dr.")
IO.puts currying.("Rossi")
