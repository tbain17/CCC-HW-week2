require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../drink')


class TestDrink < Minitest::Test

  def setup()

    @drink = Drink.new("J2O", 3.50)

  end

  def test_drink_has_name()
    assert_equal("J2O", @drink.name)
  end

  def test_drink_has_price()
    assert_equal(3.50, @drink.price)
  end


end
