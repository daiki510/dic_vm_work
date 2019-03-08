require 'minitest/autorun'
# require './lib/drink'
require './lib/vm'

class VendingMachineTest < Minitest::Test
  
  def set_up
    vm = VendingMachine.new
  end
  
  def check_current_money
    vm.insert(500)
    assert_equal vm.current_total_money, 500
  end
end