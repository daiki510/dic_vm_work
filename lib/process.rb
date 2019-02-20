require_relative 'drink'
require_relative 'vm'

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