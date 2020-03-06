require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guest')
require_relative('../room')
require_relative('../song')
require_relative('../bar')
require_relative('../drink')


class TestBar < Minitest::Test

  def setup()

    @guest = Guest.new("Gertrude", 22, 74.50, "Lemon Song")
    @drink1 = Drink.new("Blue Juice", 3.50)
    @drink2 = Drink.new("Yummy Juice", 4.50)
    @drink3 = Drink.new("Sparkle Juice", 7.50)

    @drinks = [@drink1, @drink2, @drink3]

    @bar = Bar.new(@drinks)

  end

  def test_bar_has_drinks()
    assert_equal([@drink1, @drink2, @drink3], @bar.drinks)
  end

  def test_guest_can_buy_drink()
    @bar.buy_drink(@guest, @drink2)
    assert_equal(70.00, @guest.money)
  end


end
