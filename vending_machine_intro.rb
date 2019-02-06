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

# class VendingMachine
#   # ステップ０　お金の投入と払い戻しの例コード
#   # ステップ１　扱えないお金の例コード

#   # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
#   MONEY = [10, 50, 100, 500, 1000].freeze

#   # （自動販売機に投入された金額をインスタンス変数の @slot_money に代入する）
#   def initialize
#     # 最初の自動販売機に入っている金額は0円
#     @slot_money = 0
#   end

#   # 投入金額の総計を取得できる。
#   def current_slot_money
#     # 自動販売機に入っているお金を表示する
#     @slot_money
#   end

#   # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
#   # 投入は複数回できる。
#   def slot_money(money)
#     # 想定外のもの（１円玉や５円玉。千円札以外のお札、そもそもお金じゃないもの（数字以外のもの）など）
#     # が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。
#     return false unless MONEY.include?(money)
#     # 自動販売機にお金を入れる
#     @slot_money += money
#   end

#   # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
#   def return_money
#     # 返すお金の金額を表示する
#     puts @slot_money
#     # 自動販売機に入っているお金を0円に戻す
#     @slot_money = 0
#   end
# end