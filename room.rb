class Room

  attr_reader :name, :capacity, :songs, :guests

  def initialize(name, capacity, entry_fee, bar)
    @name = name
    @capacity = capacity
    @entry_fee = entry_fee
    @bar = bar
    @songs = []
    @guests = []

  end

  def add_guest(guest)
    if @guests.length() < capacity && guest_has_enough_money(guest) == true
      @guests.push(guest)
      guest.money -= @entry_fee
    end
  end

  def remove_guest(guest)
    @guests.delete(guest)
  end

  def add_song(song)
    @songs.push(song)
  end

  def guest_has_enough_money(guest)
    return guest.money >= @entry_fee
  end

  def guest_reaction(guest, songs)
    for song in songs
      if guest.fav_song == song.name
        return "Yay!"
      end
    end
  end

  def guest_total_money(guest)
    return guest.money
  end


end
