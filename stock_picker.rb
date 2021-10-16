def stock_picker(prices)
  if prices.empty?
    return [-1,-1]
  end
  min_price = prices[0]
  min_index = 0
  profit = 0
  days = [0,0]

  prices.each_with_index do |price, index|
    if price < min_price 
      min_price = price
      min_index = index
      next
    end

    if price - min_price > profit
      profit = price - min_price
      days = [min_index,index]
    end

    
  end
  days


end

stock_picker([17,3,6,9,15,8,6,2,1])