require_relative 'drink'

class VendingMachine

  MONEY = [10, 50, 100, 500, 1000].freeze
  
  #初期値
  def initialize
    @total_money = 0
    @total_sales = 0
    @stocks = {Coke: 5, Red_bull: 5, Water: 5}
  end

  #投入金額の確認
  def current_total_money
    @total_money
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
  
  
  #購入できる飲み物を確認する
  # def available_drinks
  #   puts "--------------------------"
  #   @available_drinks.each.with_index(1) do |available_drink, i|
  #     puts "番号：#{i}"
  #     puts "種類：#{available_drink[:name]}"
  #     puts "金額：#{available_drink[:price]}円"
  #     puts "--------------------------"
  #   end
  # end

  #購入できる飲み物を判断する
  def judge_available_drinks
    @available_drinks = []
    [Drink.coke.to_h, Drink.red_bull.to_h, Drink.water.to_h].each do |judged_drink|
      if @total_money >= judged_drink[:price]
        @available_drinks << judged_drink
      end
    end
    # puts "--------------------------"
    # @available_drinks.each.with_index(1) do |available_drink, i|
    #   puts "番号：#{i}"
    #   puts "種類：#{available_drink[:name]}"
    #   puts "金額：#{available_drink[:price]}円"
    #   puts "--------------------------"
    # end
  end

  def stocks(drink_name)
    if @stocks[:drink_name] > 0
      puts "OK"
    end
  end

  # require 'byebug'; byebug

  # 飲み物を選び、購入する
  def select_drink(drink_number)
    @selected_drink = @available_drinks[drink_number - 1]
    puts "購入する飲み物：#{@selected_drink[:name]}"

    @total_money -= @selected_drink[:price]
    @total_sales += @selected_drink[:price]
    # require 'byebug'; byebug
  end

  # # 飲み物を買う
  # def purchase_drink
    
  # end

  #売り上げ金額を確認する
  def check_sales
    @total_sales
  end

  #飲み物を補充する
  def store_drink

  end

  #飲み物の在庫を確認する
  def stock_drink

  end

end

if $0 == __FILE__
  vm = VendingMachine.new
  money = 500
  if vm.insert(money)
    puts "#{money}円が投入されました"
  else
    puts "投入不可のため、返却されました"
  end
  puts "現在の投入金額: #{vm.current_total_money}円"
  puts "購入可能な飲み物一覧"
  vm.judge_available_drinks
  # vm.available_drinks
  vm.select_drink(1)
  puts "購入する飲み物：#{@selected_drink[:name]}"
  puts "残額：#{vm.current_total_money}円"
  puts "--------------------------------"
  puts "売上金額：#{vm.check_sales}円"
  #２週目
  # vm.judge_available_drinks
  # vm.available_drinks
  # puts "購入する飲み物：#{vm.select_drink(1)[:name]}"
  # vm.purchase_drink
  # puts "残額：#{vm.current_total_money}円"
  # puts "--------------------------------"
  # puts "売上金額：#{vm.check_sales}円"
end