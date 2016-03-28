defmodule Shipping do
  def tax_rates, do:  [NC: 0.075, TX: 0.08]
  def orders do
    [
      [ id: 123, ship_to: :NC, net_amount: 100.00],
      [ id: 124, ship_to: :OK, net_amount: 35.50],
      [ id: 125, ship_to: :TX, net_amount: 24.00],
      [ id: 126, ship_to: :TX, net_amount: 44.80],
      [ id: 127, ship_to: :NC, net_amount: 25.00],
      [ id: 128, ship_to: :MA, net_amount: 10.00],
      [ id: 129, ship_to: :CA, net_amount: 102.00],
      [ id: 130, ship_to: :NC, net_amount: 50.00]
    ]
  end

  def with_total_amount(current_orders, rates) do
    for order <- current_orders, do:  total_amount_for order, rates
  end

  def total_amount_for([_, ship_to: :NC, net_amount: amount]=order, rates), do: order ++ [total_amount: amount *  (1 + rates[:NC])]
  def total_amount_for([_, ship_to: :TX, net_amount: amount] = order, rates), do: order ++ [total_amount: amount * (1 + rates[:TX])]
  def total_amount_for([_, _, net_amount: amount] = order, _rates), do: order ++ [total_amount: amount]

  #Function to be called from outside the module...
  def calculate_total_amounts, do: with_total_amount(orders, tax_rates)
end

IO.inspect Shipping.calculate_total_amounts
