def stock_picker(prices_array)
  highest_profit = -10**6
  highest_profit_interval = []

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

def stock_picker_combination(prices_array)
  (0..prices_array.length - 1).to_a.combination(2).max_by do |pair|
    (prices_array[pair[1]]) - (prices_array[pair[0]])
  end
end

def stock_picker_with_min(prices_array)
  min = 10**6
  highest_profit = -10**6
  highest_interval = []
  min_index = 0
  prices_array.each_with_index do |price, price_index|
    if price < min
      min = price
      min_index = price_index
    end
    profit = price - min
    next unless profit > highest_profit

    highest_profit = profit
    highest_interval = [min_index, price_index]
  end

  highest_interval
end

# array with highest price on the first day
# array = [14, 6, 2, 1]

# p array
# p 'two loops', stock_picker(array)
# p 'with combination', stock_picker_combination(array)
# p 'with min', stock_picker_with_min(array)
