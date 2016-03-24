# Write function which takes three arguments
# If first argument is 0 return Fizz
# IF second argument is 0 return Buzz
# If first and second are 0, return FizzBuzz.
# Otherwise, return third argument

fizzbuzz = fn
  (0, 0, _) -> "FizzBuzz"
  (0, _, _) -> "Fizz"
  (_, 0, _) -> "Buzz"
  (_, _, num) -> num
end

fun = fn(n) ->
  fizzbuzz.(rem(n, 3), rem(n, 5), n)
end

IO.puts fun.(10)
IO.puts fun.(11)
IO.puts fun.(12)
IO.puts fun.(13)
IO.puts fun.(14)
IO.puts fun.(15)
IO.puts fun.(16)
