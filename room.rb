class Room

  attr_reader :room_number, :is_full, :ocupied_by, :song_list, :entry_fee

  def initialize(entry_fee, room_number, is_full = false, ocupied_by = [], song_list = [])
    @entry_fee = entry_fee
    @ocupied_by = ocupied_by
    @room_number = room_number
    @is_full = is_full
    @song_list = song_list
  end

  def check_in(guest, tab)
    at_capacity
    if @is_full ==  false
      @ocupied_by << guest
    else
      return "We are at capacity"
    end
    tab.increase_tab(guest, @entry_fee)
  end

  def check_out(guest)
    @ocupied_by.delete(guest)
  end

  def add_song(song)
    @song_list << song
  end

  def at_capacity
    if @ocupied_by.count == 3
      @is_full = true
    end
  end

  def sell_ticket(guest)
    if guest.buy_ticket(self) == true
      check_in(guest)
    else
      return "Not enough money"
    end
  end
 

end #class end
