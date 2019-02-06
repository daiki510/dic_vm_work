def insert
  moneys = [10, 50, 100, 500, 1000]
  k = 0
  total_price = 0
  while k < 10000 do
    puts "1 お金を入れる"
    puts "2 払い戻し"
    puts "合計#{total_price}円"
    k = gets.chomp.to_i
    if k == 1
      puts "入れたいお金を選択してください"
      puts "0.10円 1.50円 2.100円 3.500円 4.1000円"
      i = gets.chomp.to_i

      total_price += moneys[i]
      
    elsif k == 2
      puts "#{total_price}円の払い戻しです、ご利用ありがとうございました"
      break
    else
      puts "もう一度入力してください"
    end
  end
end

insert

