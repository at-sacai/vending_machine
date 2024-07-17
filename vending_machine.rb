class VendingMachine
  attr_reader :sales

  def initialize
    @sales = 0
    @stock = []
    5.times do
      @stock << Drink.new('pepsi', 150)
      @stock << Drink.new('monster', 230)
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
    selected_drink = @stock.find { |stock| stock.name == drink }
    unless selected_drink
      puts "#{drink}の在庫がありません"
      return
    end

    if suica.deposit < selected_drink.price
      puts 'チャージ残高が足りません'
      return
    end

    @sales += selected_drink.price
    @stock.delete_at(@stock.find_index { |stock| stock.name == drink })
    suica.pay(selected_drink.price)
  end
end
