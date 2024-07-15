class VendingMachine
  attr_reader :sales

  def initialize
    @sales = 0
    @price = { 'pepsi' => 150, 'monster' => 230, 'irohasu' => 120 }
    @stock = []
    5.times do
      @stock << Drink.new('pepsi', 150)
      @stock << Drink.new('monster', 250)
      @stock << Drink.new('irohasu', 120)
    end
  end

  def show_stock
    puts "pepsiの在庫は、#{@stock.count { |stock| stock.name == 'pepsi' }}個です"
    puts "monsterの在庫は、#{@stock.count { |stock| stock.name == 'monster' }}個です"
    puts "irohasuの在庫は、#{@stock.count { |stock| stock.name == 'irohasu' }}個です"
  end

  def add_stock(drink)
    @stock << drink
  end

  def buy(suica, drink)
    if @stock.count { |stock| stock.name == drink }.positive?
      if suica.deposit >= @price[drink]
        @sales += @price[drink]
        @stock.delete_at(@stock.find_index { |stock| stock.name == drink })
        suica.pay(@price[drink])
      else
        puts 'チャージ残高が足りません'
      end
    else
      puts "#{drink}の在庫がありません"
    end
  end
end
