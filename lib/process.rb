require_relative 'drink'
require_relative 'vm'

#処理の流れ

vm = VendingMachine.new
money = 1000
if vm.insert(money)
  puts "#{money}円が投入されました"
else
  puts "投入不可のため、返却されました"
end
puts "現在の投入金額: #{vm.current_total_money}円"

#１週目
puts "--------------------------"
puts "購入可能な飲み物一覧"
vm.available_drink_list
available_drink = vm.judge
vm.select_drink(available_drink.size + 1) #ランダムで選択
puts "購入する飲み物番号: #{available_drink.size + 1}"
puts "残金：#{vm.current_total_money}円"
puts "売上金額：#{vm.current_total_sales}円"
vm.stock_info

#２週目
puts "購入可能な飲み物一覧"
puts "--------------------------"
vm.available_drink_list
vm.select_drink(1)
puts "残金：#{vm.current_total_money}円"
puts "売上金額：#{vm.current_total_sales}円"
vm.stock_info

#在庫補充
puts "在庫補充を実施"
vm.store_drink(:Coke, 5)
vm.store_drink(:Red_bull, 5)
vm.store_drink(:Water, 5)
vm.store_drink(:Tea, 5)
vm.stock_info

#３週目
puts "購入可能な飲み物一覧"
puts "--------------------------"
vm.available_drink_list
vm.select_drink(1)
puts "残金：#{vm.current_total_money}円"
puts "売上金額：#{vm.current_total_sales}円"
vm.stock_info
vm.return_money

#在庫補充
puts "在庫補充を実施"
vm.store_drink(:Coke, 5)
vm.store_drink(:Red_bull, 5)
vm.store_drink(:Water, 5)
vm.store_drink(:Tea, 5)
vm.stock_info
