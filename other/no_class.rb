
@drinks = [{name: "Cola", price: 120, stock: 5}]
@total_sales = 0
def insert
  moneys = [10, 50, 100, 500, 1000]
  k = 0
  @total_price = 0
  while @total_price < 10000 do
    puts "1 お金を入れる"
    puts "2 払い戻し"
    puts "3 飲み物を買う"
    puts "4 飲み物を補充する" #管理者メニュー
    puts "5 飲み物の在庫を確認する" #管理者メニュー
    puts "6 売上を確認する" #管理者メニュー
    puts "合計#{@total_price}円"
    k = gets.to_i
    case k
      when k = 1
        puts "入れたいお金を選択してください"
        puts "0.10円 1.50円 2.100円 3.500円 4.1000円"
        i = gets.to_i
        @total_price += moneys[i]
      when k = 2
        puts "#{@total_price}円の払い戻しです、ご利用ありがとうございました"
        break
      when k = 3
        puts "飲み物を選んでください"
        puts select_drink
      when k = 4
        puts "飲み物を補充します"
        puts store_drink
      when k = 5
        puts "在庫を確認します"
        puts check_stocks
      when k = 6
        puts "在庫を確認します"
        puts check_sales
      else
        puts "もう一度入力してください"
    end
  end
end

def select_drink
  @drinks.each_with_index do |drink, n|
    puts "--------------------------"
    puts "番号：#{n}"
    puts "種類：#{drink[:name]}"
    puts "金額：#{drink[:price]}円"
    puts "在庫：#{drink[:stock]}本"
    puts "--------------------------"
  end
  # require 'byebug'; byebug

  puts "投入金額: #{@total_price}円"
  puts "番号を選んでください"
  i = gets.to_i
  @selected_drink = @drinks[i]
  puts "--------------------------------------"
  puts "あなたが選んだのは#{@selected_drink[:price]}円の#{@selected_drink[:name]}です"
  # puts "投入金額: #{@total_price}円"
  puts "--------------------------------------"
  if @selected_drink[:price] < @total_price && @selected_drink[:stock] > 0
    puts "購入可能"
    puts " "
    puts purchase_drink
  elsif @selected_drink[:stock] <= 0
    puts "売り切れです"
  else
    puts "投入金額不足です"
  end
end

def purchase_drink
  #買うかどうか判断させる
  puts "選択画面"
  puts "--------------------"
  puts "1:購入 2:キャンセル"
  puts "--------------------"
  i = gets.to_i
  if i == 1
    #飲み物が出てくる
    puts "#{@selected_drink[:name]}を購入しました。"
    #合計金額から購入金額を差し引く
    @total_price -= @selected_drink[:price]
    @total_sales += @selected_drink[:price]
  
    puts "残額: #{@total_price}円"
    #在庫数から1つ分を差し引く
    @selected_drink[:stock] -= 1

    #再度最初の画面に戻す
  elsif i == 2
    puts "キャンセルしました"
    puts "--------------------"
  else
    puts "もう一度入力してください"
    puts "--------------------"
    purchase_drink
  end
end

def store_drink
  puts "飲み物を補充します"
  puts "補充する飲み物を以下から選んでください"
  puts "------------------------------------"
  puts "0: Cola"
  puts "1: Soda"
  puts "2: Water"
  puts "3: Tea"
  i = gets.to_i
  index = @drinks.size
  case i
  when i = 0
    @drinks.find { |item| item[:name] == "Cola"}
    drink_cola = @drinks.find { |item| item[:name] == "Cola"}
    drink_cola[:stock] = 5
    # require 'byebug'; byebug
  when i = 1
    if @drinks.find { |item| item[:name] == "Soda"}
      drink_soda = @drinks.find { |item| item[:name] == "Soda"}
      drink_soda[:stock] = 5
    else
      @drinks[index] = {name: "Soda", price: 150, stock: 5}
    end
  when i = 2
    if @drinks.find { |item| item[:name] == "Water"}
      drink_water = @drinks.find { |item| item[:name] == "Water"}
      drink_water[:stock] = 5
    else
      @drinks[index] = {name: "Water", price: 100, stock: 5}
    end
  when i = 3
    if @drinks.find { |item| item[:name] == "Tea"}
      drink_tea = @drinks.find { |item| item[:name] == "Tea"}
      drink_tea[:stock] = 5
    else
      @drinks[index] = {name: "Tea", price: 130, stock: 5}
    end
  else
    puts "もう一度選択してください"
  end
  
end

def check_stocks
  @drinks.each_with_index do |drink, n|
    puts "--------------------------"
    puts "番号：#{n}"
    puts "種類：#{drink[:name]}"
    puts "金額：#{drink[:price]}円"
    puts "在庫：#{drink[:stock]}本"
    puts "--------------------------"
  end
end

def check_sales
  sold_items = []

end

insert

