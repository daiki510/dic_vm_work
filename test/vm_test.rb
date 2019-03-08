require 'minitest/autorun'
require './lib/drink'
require './lib/vm'

class VendingMachineTest < Minitest::Test
  
  def setup
    @vm = VendingMachine.new
    @vm.insert(500)
  end
  
  def test_current_money
    assert_equal 500,@vm.current_total_money
  end

  def test_return_money
    @vm.return_money
    assert_equal 0,@vm.current_total_money
  end
  
  def test_select_drink
    @vm.judge
    @vm.select_drink(1)
    assert_equal 380,@vm.current_total_money
    assert_equal 120,@vm.current_total_sales
  end

  # def test_stock_drink
  #   @vm.store_drink(:Coke, 5)
  #   assert_equal 5,@stocks[:Coke]
  # end
end