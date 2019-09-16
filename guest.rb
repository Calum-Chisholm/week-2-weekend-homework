class Guest

  attr_reader :name, :age, :wallet, :favourite_song

  def initialize(name, age, wallet, favourite_song)
    @favourite_song = favourite_song
    @wallet = wallet
    @name = name
    @age = age
  end

  def buy_ticket(room)
    if @wallet >= room.entry_fee
      return true
    else
      return false
    end
  end

  def cheer(room)
    for song in room.song_list
      if song == @favourite_song
      end
    end
      return "Whoo"
    else
      return nil
    end

    def buy_drink(drink, tab)
      @wallet -= drink.price
      tab.add_drink_tab(self, drink)
    end


end #class end
