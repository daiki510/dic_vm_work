class VendingMachine
  MONEY = [10,50,100,500,1000].freeze
    # モデルのバリデーション？
  
  def initialize
    @slot_money = 0
  end


  def slot_money(money)
    return false unless MONEY.include?(money)
    @slot_money += money
  end



  def current_slot_money
    @slot_money
  end



  def return_money
    puts @slot_momney
    @slot_momney = 0
  end

  def juice
    

  end
end