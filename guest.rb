class Guest

attr_reader :name, :age, :fav_song
attr_accessor :money

  def initialize (name, age, money, fav_song)
    @name = name
    @age = age
    @money = money
    @fav_song = fav_song
  end

end
