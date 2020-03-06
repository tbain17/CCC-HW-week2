require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guest')
require_relative('../room')
require_relative('../song')
require_relative('../bar')



class TestGuest < Minitest::Test

  def setup()
    @guest = Guest.new("Roberto", 37, 15.50, "Jazzy Song")
  end

  def test_guest_has_name()
    assert_equal("Roberto", @guest.name)
  end

  def test_guest_has_age()
    assert_equal(37, @guest.age)
  end

  def test_guest_has_money()
    assert_equal(15.50, @guest.money)
  end

  def test_guest_has_fav_song()
    assert_equal("Jazzy Song", @guest.fav_song)
  end

end
