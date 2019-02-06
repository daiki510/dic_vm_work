class Drink
  
  # 初期状態
  def initialize
    @slot_drink = [
                    {name: "コーラ", price: 120}
                  ]
  end

  # ジュースの情報を取得できる
  def current_slot_drink
    @slot_drink
  end

  def stock_drink(stock_name, stock_price)
    new_drink = {name: stock_name, price: stock_price}
    @slot_drink << new_drink
    require 'byebug'; byebug
  end
end

drink = Drink.new

drink.stock_drink("こーら", 9000)