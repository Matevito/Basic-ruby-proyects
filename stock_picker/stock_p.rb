def stock_picker(stock_values)
  # TODO: think in a better name for this variable
  profitable_days = []
  (0..stock_values.length - 2).each do |buy|
    profit_per_day = []
    (buy + 1..stock_values.length - 1).each do |sell|
      buy_day = stock_values[buy]
      sell_day = stock_values[sell]
      profit = sell_day - buy_day
      buy_index = buy
      sell_index = sell
      day_data = [profit, buy_day, sell_day, buy_index, sell_index]
      profit_per_day.push(day_data)
    end

    profit_per_day = profit_per_day.sort_by { |option| option[0] }
    # send the best day to profit per day and remove the first element in stock values
    profitable_days.push(profit_per_day.last)
  end
  profitable_days = profitable_days.sort_by { |day| day[0] }
  # this returns just the values of the buy and sell index days
  profitable_days.last.last(2)
end

p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
