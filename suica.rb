class Suica
  attr_reader :deposit

  def initialize
    @deposit = 500
  end

  def charge(money)
    if money < 100
      puts '最低チャージ可能金額は、100円からになります。'
    else
      @deposit += money
    end
  end

  def pay(money)
    @deposit -= money
  end
end
