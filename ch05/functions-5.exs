#First example
Enum.map [1,2,3,4], &(&1 + 2)

#Second example
Enum.each [1,2,3,4], &(IO.inspect(&1))
