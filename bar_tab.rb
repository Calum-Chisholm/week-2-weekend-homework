require 'pry'

class BarTab

  attr_reader :tab

  def initialize(tab = [])
    @tab = tab
  end

  def increase_tab(guest, value)
    @tab << {guest.name => value}
  end

  def add_drink_tab(guest, drink)
    for person in @tab
      if person[guest.name]
        person[guest.name] += drink.price
      end
    end
  end




end #class end
