class Drink
  attr_reader :name, :price
 
  def initialize(name,price)
    @name = name
    @price = price
  end

  def to_h
    {name: @name, price: @price}
  end

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