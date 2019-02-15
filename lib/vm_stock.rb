require_relative 'drink'

class VendingMachine

  MONEY = [10, 50, 100, 500, 1000].freeze
  
  #初期値
  def initialize
    @total_money = 0
    @total_sales = 0
    @stocks = {Coke: 1, Red_bull: 1, Water: 1}
  end

  #投入金額の確認
  def current_total_money
    @total_money
  end

  #売り上げ金額を確認する
  def check_sales
    @total_sales
  end
  
  # 払い戻し
  def return_money
    puts "#{@total_money}円の返金"
    @total_money = 0
  end
    
  # お金を投入する
  def insert(money)
    return false unless MONEY.include?(money)
    @total_money += money
  end

  #金額にて購入できる飲み物を判断する
  def judge_with_price
    @judge_drinks = [Drink.coke.to_h, Drink.red_bull.to_h, Drink.water.to_h].select {|judged_drink| @total_money >= judged_drink[:price]}  
  end

  #在庫にて購入できる飲み物を判断する
  def judge_with_stock
    @available_drinks = @judge_drinks.select {|drink| @stocks[drink[:name].to_sym] > 0}
  end

  #購入できる飲み物を確認する
  def available_drinks
    puts "--------------------------"
    @available_drinks.each.with_index(1) do |available_drink, i|
      puts "番号：#{i}"
      puts "種類：#{available_drink[:name]}"
      puts "金額：#{available_drink[:price]}円"
      puts "--------------------------"
    end
  end

  # require 'byebug'; byebug

  # 飲み物を選び、購入する
  def select_drink(drink_number)
    @selected_drink = @available_drinks[drink_number - 1]
    puts "購入した飲み物：#{@selected_drink[:name]}"
    @stocks[@selected_drink[:name].to_sym] -= 1
    #-----------------修正必要---------------------------------------------------
    @total_money -= @selected_drink[:price]
    
    @total_sales += @selected_drink[:price] #メソッドを使うと、売り上げ金額が出力されてしまう
    #---------------------------------------------------------------------------
  end

  #飲み物の在庫を確認する
  def stock_drink
    @stocks
  end

  #飲み物を補充する
  def store_drink(drink_name, stock)
    @stocks[drink_name] += stock
  end

  def stock_info
    puts "在庫状況"
    puts "---------------------------------"
    @stocks.each do |name, stock|
      puts "#{name}: #{stock}本"
    end
    puts "---------------------------------"
  end


end

# def stock_info
#   puts "在庫状況"
#   puts "---------------------------------"
#   vm.stock_drink.each do |name, stock|
#     puts "#{name}: #{stock}本"
#   end
#   puts "---------------------------------"
# end

if $0 == __FILE__
  vm = VendingMachine.new
  money = 500
  if vm.insert(money)
    puts "#{money}円が投入されました"
  else
    puts "投入不可のため、返却されました"
  end
  puts "現在の投入金額: #{vm.current_total_money}円"

  #１週目
  puts "購入可能な飲み物一覧"
  vm.judge_with_price
  vm.judge_with_stock
  vm.available_drinks
  vm.select_drink(1)
  puts "残金：#{vm.current_total_money}円"
  puts "売上金額：#{vm.check_sales}円"
  vm.stock_info


  #２週目
  puts "購入可能な飲み物一覧"
  vm.judge_with_price
  vm.judge_with_stock
  vm.available_drinks
  vm.select_drink(1)
  puts "残金：#{vm.current_total_money}円"
  puts "売上金額：#{vm.check_sales}円"
  vm.stock_info

  #在庫補充
  puts "在庫補充"
  vm.store_drink(:Coke, 5)
  vm.store_drink(:Red_bull, 5)
  vm.store_drink(:Water, 5)
  vm.stock_info

  #３週目
  puts "購入可能な飲み物一覧"
  vm.judge_with_price
  vm.judge_with_stock
  vm.available_drinks
  vm.select_drink(1)
  puts "残金：#{vm.current_total_money}円"
  puts "売上金額：#{vm.check_sales}円"
  vm.stock_info

  #在庫補充
  puts "在庫補充"
  vm.store_drink(:Coke, 5)
  vm.store_drink(:Red_bull, 5)
  vm.store_drink(:Water, 5)
  vm.stock_info
end