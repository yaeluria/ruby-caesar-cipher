def stock_picker(prices_array)
  highest_profit = 0
  highest_profit_interval = [0, 0]
  return [0, prices_array.index(prices_array[1..].max)] if prices_array.max == prices_array[0]

  prices_array.each_with_index do |buying_price, buy_day_index|
    break if buy_day_index == prices_array.size - 1

    prices_after_buy_day_index = prices_array[buy_day_index + 1..]
    max_selling_price_for_buy_day = prices_after_buy_day_index.max
    max_profit_for_buy_day = max_selling_price_for_buy_day - buying_price
    next unless max_profit_for_buy_day > highest_profit

    highest_profit = max_profit_for_buy_day
    highest_profit_interval = [buy_day_index,
                               prices_after_buy_day_index.index(max_selling_price_for_buy_day) + buy_day_index + 1]
  end
  highest_profit_interval
end

# array = [6, 8, 17, 15, 7, 6, 3, 9, 10, 15, 1]
# array with highest price on the first day
# array = [3, 2, 0]
# p array, stock_picker(array)
