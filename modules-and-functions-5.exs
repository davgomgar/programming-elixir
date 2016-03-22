defmodule GCD do
  def of(x,y) when x>0 and y == 0 do
    x
  end
  def of(x,y) when x>0 and y>0 do
    of(y, rem(x,y))
  end
end
