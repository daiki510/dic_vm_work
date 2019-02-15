require 'minitest/autorun'
require './lib/drink'
require './lib/vm'

class VendingMachineTest < Minitest::Test
  
  def setup
    
  end

  def check_current_money
    vm = VendingMachine.new
    vm.insert(500)
    assert vm.current_slot_money = 500
  end
end