@available_drinks = [{:name=>"Water", :price=>100}]
@stocks = {Coke: 5, Red_bull: 5, Water: 0}

p @stocks.keys

@drinks = @available_drinks.select {|drink| @stocks[drink[:name].to_sym] > 0}
# .select {|item| item % 2 == 0 }
p @drinks

# 金額面で購入可能のドリンク名と在庫面で可能なドリンク名をマッチングさせる

