def stock_picker(stock_values)
    #todo: think in a better name for this variable
    profitable_days = []
    while true
        profit_per_day = []
        #when stock_values length = 1, theres nothing more else to do 
        break if stock_values.length == 1

        for i in (1..stock_values.length-1)
            buy_day = stock_values.first
            sell_day = stock_values[i]
            profit = sell_day-buy_day
            
            #todo: think in a better name for this variable
            day_data = [profit,buy_day,sell_day]
            profit_per_day.push(day_data)
        end
        #stock_values.shift
        profit_per_day = profit_per_day.sort_by {|option| option[0]}

        #send the best day to profit per day and remove the first element in stock values
        profitable_days.push(profit_per_day.last)
        stock_values.shift
    end
    profitable_days = profitable_days.sort_by {|day| day[0]}
    most_profitable_day = profitable_days.last
end


p stock_picker([17,3,6,9,15,8,6,1,10])