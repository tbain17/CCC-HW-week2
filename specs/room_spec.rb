require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guest')
require_relative('../room')
require_relative('../song')
require_relative('../bar')
require_relative('../drink')




class TestRoom < Minitest::Test

  def setup()
    @room = Room.new("Jazz Room", 5, 10.00, @bar)

    @guest1 = Guest.new("Sam", 27, 50.20, "Jazzy Song")
    @guest2 = Guest.new("Mr Potatohead", 50, 20.00, "Lame Song")
    @guest3 = Guest.new("Monica", 35, 150.00, "Snazzy Song")
    @guest4 = Guest.new("Luke", 23, 5.50, "Jedi Song")
    @guest5 = Guest.new("Gertrude", 22, 74.23, "Lemon Song")
    @guest6 = Guest.new("Jeff", 82, 500.00, "Money Song")

    @guests = [@guest1, @guest2, @guest3, @guest4, @guest5, @guest6]

    @song1 = Song.new("Jazzy Song")
    @song2 = Song.new("Snazzy Song")
    @song3 = Song.new("Loud Song")

    @songs = [@song1, @song2, @song3]

    @drink1 = Drink.new("Blue Juice", 3.50)
    @drink2 = Drink.new("Yummy Juice", 4.50)
    @drink3 = Drink.new("Sparkle Juice", 7.50)

    @drinks = [@drink1, @drink2, @drink3]

    @bar = Bar.new(@drinks)

  end

  def test_room_has_name()
    assert_equal("Jazz Room", @room.name)
  end

  def test_room_has_capacity()
    assert_equal(5, @room.capacity)
  end

  def test_can_add_guest_to_room()
    @room.add_guest(@guest3)
    assert_equal(1, @room.guests.length())
  end

  def test_can_remove_guest_from_room()
    @room.add_guest(@guest1)
    @room.add_guest(@guest2)
    @room.remove_guest(@guest2)
    assert_equal(1, @room.guests.length())
  end

  def test_can_add_song_to_room()
    @room.add_song(@song2)
    assert_equal(1, @room.songs.length())
  end

  def test_cannot_add_more_than_capacity()
    @room.add_guest(@guest1)
    @room.add_guest(@guest2)
    @room.add_guest(@guest3)
    @room.add_guest(@guest4)
    @room.add_guest(@guest5)
    @room.add_guest(@guest6)
    assert_equal(5, @room.guests.length())
  end

  def test_guest_has_enough_money__has_enough()
    result = @room.guest_has_enough_money(@guest5)
    assert_equal(true, result)
  end

  def test_guest_has_enough_money__does_not_have_enough()
    result = @room.guest_has_enough_money(@guest4)
    assert_equal(false, result)
  end

  def test_guest_reacts_to_song()
    @room.add_song(@song1)
    @room.add_song(@song2)
    result = @room.guest_reaction(@guest1, @room.songs)
    assert_equal("Yay!", result)
  end

  def test_guest_total_money()
    @room.add_guest(@guest6)
    @bar.buy_drink(@guest6, @drink2)
    result = @room.guest_total_money(@guest6)
    assert_equal(485.50, result)
  end

end
