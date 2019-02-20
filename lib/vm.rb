require_relative 'drink'
# require 'byebug'; byebug

class VendingMachine

  MONEY = [10, 50, 100, 500, 1000].freeze
  
  #初期値
  def initialize
    @total_money = 0
    @total_sales = 0
    @stocks = {Coke: 1, Red_bull: 1, Water: 1}
    @selected_drink = []
  end

  #投入金額の確認
  def current_total_money
    @total_money
  end

  #売上金額の確認
  def current_total_sales
    @total_sales
  end
  
  # 払い戻し
  def return_money
    puts "#{@total_money}円の返金"
    @total_money = 0
  end
    
  # お金を投入
  def insert(money)
    return false unless MONEY.include?(money)
    @total_money += money
  end

  #金額・在庫より購入できる飲み物を判断
  def judge
    drinks = [Drink.coke.to_h, Drink.red_bull.to_h, Drink.water.to_h].select {|drink| @total_money >= drink[:price] }
    drinks.select { |drink| @stocks[drink[:name].to_sym] > 0 }
  end

  # 飲み物を選択・購入
  def select_drink(drink_number)
    available_drinks = judge
    drink_number == available_drinks.size + 1 ? @selected_drink = available_drinks.sample : @selected_drink = available_drinks[drink_number - 1]

    calculate
    puts "購入した飲み物：#{@selected_drink[:name]}"
  end

  def calculate
    #在庫数を計算
    @stocks[@selected_drink[:name].to_sym] -= 1
    #合計金額を計算
    @total_money -= @selected_drink[:price]
    #売上金額を計算
    @total_sales += @selected_drink[:price] 
  end

  #飲み物を補充
  def store_drink(drink_name, stock)
    @stocks[drink_name] += stock
  end

  #飲み物の在庫を確認
  def stock_info
    puts "在庫状況"
    puts "---------------------------------"
    @stocks.each do |name, stock|
      puts "#{name}: #{stock}本"
    end
    puts "---------------------------------"
  end
end

#処理の流れ
if $0 == __FILE__
  vm = VendingMachine.new
  money = 1000
  if vm.insert(money)
    puts "#{money}円が投入されました"
  else
    puts "投入不可のため、返却されました"
  end
  puts "現在の投入金額: #{vm.current_total_money}円"

  #１週目
  puts "購入可能な飲み物一覧"
  available_drinks = vm.judge
  puts "--------------------------"
  available_drinks.each.with_index(1) do |available_drink, i|
    puts "番号：#{i}"
    puts "種類：#{available_drink[:name]}"
    puts "金額：#{available_drink[:price]}円"
    puts "--------------------------"
  end
  puts "番号：#{available_drinks.size + 1}(ランダム)"
  puts "種類：??"
  puts "金額：??円"
  puts "--------------------------"

  vm.select_drink(4)
  puts "残金：#{vm.current_total_money}円"
  puts "売上金額：#{vm.current_total_sales}円"
  vm.stock_info

  #２週目
  puts "購入可能な飲み物一覧"
  available_drinks = vm.judge
  puts "--------------------------"
  available_drinks.each.with_index(1) do |available_drink, i|
    puts "番号：#{i}"
    puts "種類：#{available_drink[:name]}"
    puts "金額：#{available_drink[:price]}円"
    puts "--------------------------"
  end
  puts "番号：#{available_drinks.size + 1}(ランダム)"
  puts "種類：??"
  puts "金額：??円"
  puts "--------------------------"
  vm.select_drink(1)
  puts "残金：#{vm.current_total_money}円"
  puts "売上金額：#{vm.current_total_sales}円"
  vm.stock_info

  #在庫補充
  puts "在庫補充"
  vm.store_drink(:Coke, 5)
  vm.store_drink(:Red_bull, 5)
  vm.store_drink(:Water, 5)
  vm.stock_info

  #３週目
  puts "購入可能な飲み物一覧"
  available_drinks = vm.judge
  puts "--------------------------"
  available_drinks.each.with_index(1) do |available_drink, i|
    puts "番号：#{i}"
    puts "種類：#{available_drink[:name]}"
    puts "金額：#{available_drink[:price]}円"
    puts "--------------------------"
  end
  puts "番号：#{available_drinks.size + 1}(ランダム)"
  puts "種類：??"
  puts "金額：??円"
  puts "--------------------------"
  vm.select_drink(1)
  puts "残金：#{vm.current_total_money}円"
  puts "売上金額：#{vm.current_total_sales}円"
  vm.stock_info
  vm.return_money

  #在庫補充
  puts "在庫補充"
  vm.store_drink(:Coke, 5)
  vm.store_drink(:Red_bull, 5)
  vm.store_drink(:Water, 5)
  vm.stock_info
end