require './drink'
require './vending_machine'
require './suica'

suica = Suica.new
puts suica.charge(1000)

v_machine = VendingMachine.new
6.times { v_machine.buy(suica, 'pepsi') }
v_machine.buy(suica, 'monster')
v_machine.buy(suica, 'irohasu')
puts v_machine.show_stock
puts v_machine.sales

pepsi = Drink.new('pepsi', 150)
v_machine.add_stock(pepsi)
puts v_machine.show_stock
puts suica.deposit
