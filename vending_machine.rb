class Suica
  DEPOSIT = 500
  def initialize
    @charge_fare = DEPOSIT
  end

  attr_reader :charge_fare

  def show_charge_fare
    @charge_fare
  end

  def add_charge_fare(money)
    if money < 100
      puts '最低チャージ可能金額は、100円からになります。'
    else
      @charge_fare += money
    end
  end

  def minus_charge_fare(money)
    @charge_fare -= money
  end
end

class VendingMachine
  def initialize
    @sales = 0
    @menu = { 'pepsi' => 150, 'monster' => 250, 'irohasu' => 120 }
    @stock = { 'pepsi' => 5, 'monster' => 5, 'irohasu' => 5 }
  end

  def show_revenues
    @sales
  end

  def show_stock
    puts "・pepsiの在庫：#{@stock['pepsi']}個"
    puts "・monsterの在庫：#{@stock['monster']}個"
    puts "・irohasuの在庫：#{@stock['irohasu']}個"
  end

  def add_stock(drink)
    @stock[drink.drink_name] += 1
  end

  def buy_drink(suica, order)
    if @stock[order].positive?
      if suica.charge_fare >= @menu[order]
        @sales += @menu[order]
        @stock[order] -= 1
        suica.minus_charge_fare(@menu[order])
      else
        puts 'チャージ残高が足りません'
      end
    else
      puts "#{order}の在庫がありません"
    end
  end
end

class Drink
  def initialize(drink_name, drink_fare)
    @drink_name = drink_name
    @drink_fare = drink_fare
  end

  attr_reader :drink_name, :drink_fare
end

suica = Suica.new
puts suica.add_charge_fare(1000)
puts suica.show_charge_fare

v_machine = VendingMachine.new
v_machine.buy_drink(suica, 'pepsi')
v_machine.buy_drink(suica, 'pepsi')
v_machine.buy_drink(suica, 'pepsi')
v_machine.buy_drink(suica, 'pepsi')
v_machine.buy_drink(suica, 'pepsi')
v_machine.buy_drink(suica, 'pepsi')
v_machine.buy_drink(suica, 'monster')
v_machine.buy_drink(suica, 'monster')

puts v_machine.show_revenues
pepsi = Drink.new('pepsi', 150)
monster = Drink.new('monster', 250)
v_machine.add_stock(pepsi)
v_machine.add_stock(monster)
v_machine.show_stock
puts v_machine.show_revenues
puts suica.show_charge_fare
