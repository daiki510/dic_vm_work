class Drink
  attr_reader :name, :price
  
  # 初期状態
  def initialize(name,price)
    @name = name
    @price = price
  end

  def to_h
    {name: @name, price: @price}
  end

  # コーラ情報
  def self.coke
    Drink.new("Coke",120)
  end
  def self.red_bull
    Drink.new("Red_bull",200)
  end
  def self.water
    Drink.new("Water",100)
  end
end

# drink1 = Drink.coke
# drink2 = Drink.red_bull
# drink3 = Drink.water
# # require 'byebug'; byebug
# puts drink1
# puts drink2
# puts drink3