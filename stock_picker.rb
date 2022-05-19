
def stock_picker(prices_array)
    highest_interval = 0
    buy_day = 0
    sell_day = -1
    prices_array.each_with_index do |price, index|
        break if index == prices_array.size - 1
            prices_after_index = prices_array[index+1..-1]
            max_value = prices_after_index.max
            new_interval = max_value - price
            if new_interval > highest_interval
                highest_interval = new_interval
                buy_day = index
                sell_day = prices_after_index.index(max_value) + index + 1
            end
        end
    [buy_day, sell_day]
end


# random_array = Array.new(10) { rand(1...10) }
# stock_picker(random_array)