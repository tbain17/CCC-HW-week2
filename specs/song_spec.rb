require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guest')
require_relative('../room')
require_relative('../bar')
require_relative('../song')


class TestGuest < Minitest::Test

  def setup()
    @song = Song.new("Noisy Song")
  end


  def test_song_has_name()
    assert_equal("Noisy Song", @song.name)
  end

end
