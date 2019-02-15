@available_drinks = {:name=>"Water", :price=>100}
@stocks = {Coke: 5, Red_bull: 5, Water: 5}

# p @stocks.keys

# @drinks = @available_drinks.select {|drink| @stocks[drink[:name].to_sym] > 0}
# .select {|item| item % 2 == 0 }
def store_drink(drink_name, stock)
  @stocks[drink_name] += stock
end

# p @stocks[@available_drinks[:name].to_sym] -= 1

store_drink(:Coke, 5)
p @stocks



# 金額面で購入可能のドリンク名と在庫面で可能なドリンク名をマッチングさせる

