def select_drink(drink_number)
  available_drinks = judge
  @selected_drink = available_drinks[drink_number - 1]
  calculate
end

# ランダムで飲み物を選択・購入
def random_drink
  available_drinks = judge
  @selected_drink = available_drinks.sample
  calculate
end

def calculate
  #在庫数を計算
  @stocks[@selected_drink[:name].to_sym] -= 1
  #合計金額を計算
  @total_money -= @selected_drink[:price]
  #売上金額を計算
  @total_sales += @selected_drink[:price] 
  puts "購入した飲み物：#{@selected_drink[:name]}"
end