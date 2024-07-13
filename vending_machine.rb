class VendingMachine
  attr_reader :sales

  def initialize
    @sales = 0
    @price = { 'pepsi' => 150, 'monster' => 250, 'irohasu' => 120 }
    @stock = { 'pepsi' => [], 'monster' => [], 'irohasu' => [] }

    5.times do
      @stock['pepsi'] << Drink.new('pepsi', 150)
      @stock['monster'] << Drink.new('monster', 250)
      @stock['irohasu'] << Drink.new('irohasu', 120)
    end
  end

  def show_stock
    puts "pepsiの在庫は#{@stock['pepsi'].size}個です"
    puts "monsterの在庫は#{@stock['monster'].size}個です"
    puts "irohasuの在庫は#{@stock['irohasu'].size}個です"
  end

  def add_stock(drink)
    @stock[drink.name] << drink
  end

  def buy(suica, drink)
    if @stock[drink].size > 0
      if suica.deposit >= @price[drink]
        @sales += @price[drink]
        @stock[drink].shift
        suica.pay(@price[drink])
      else
        puts 'チャージ残高が足りません'
      end
    else
      puts "#{drink}の在庫がありません"
    end
  end
end
