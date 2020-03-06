class Bar

  attr_reader :drinks

  def initialize(drinks)
    @drinks = drinks
  end

  def buy_drink(guest, drink)
    if guest.money >= drink.price
      guest.money -= drink.price
    end
  end

end
