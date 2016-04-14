defmodule Parallel do

  def map(collection, fun) do
    me = self
    collection
    |> Enum.map( fn(elem) ->
      spawn_link fn -> (:timer.sleep(100)
        send me, {self, fun.(elem)}) end
    end)
    |> Enum.map( fn(pid) ->
      receive do
        {^pid, res} ->
          res
      end
    end)
  end
end
#By adding sleep when spawning new processes the hidden bug arises
#If the receive block does not match against ^pid, the result array
#will contain the result in random order.
IO.inspect Parallel.map 1..1000, fn(x) -> x * x end
