class BarTab

  attr_reader :tab

  def initialize(tab = [])
    @tab = tab
  end

  def increase_tab(guest, value)
    @tab << {guest.name => value}
  end


end #class end
