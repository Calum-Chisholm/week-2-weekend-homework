require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../room')
require_relative('../song')
require_relative('../bar_tab')
require_relative('../drink')

class KaraokeTest < MiniTest::Test

  def setup

    @guest1 = Guest.new("Rease", 17, 20, @song1)
    @guest2 = Guest.new("Andria", 23, 30, @song2)
    @guest3 = Guest.new("Phill", 57, 40, @song3)
    @guest4 = Guest.new("Jess", 16, 50, @song4)
    @guest5 = Guest.new("Paul", 38, 60, @song5)

    @song1 = Song.new("Forever Gone")
    @song2 = Song.new("Space Above")
    @song3 = Song.new("After Midnight")
    @song4 = Song.new("Ariel")
    @song5 = Song.new("Tied Up")

    @room1 = Room.new(50, 1)
    @room2 = Room.new(20, 2)
    @room3 = Room.new(35, 3)
    @room4 = Room.new(40, 4)
    @room5 = Room.new(25, 5)

    @drink1 = Drink.new("Coke", 2)
    @drink2 = Drink.new("Pepsi", 1)
    @drink3 = Drink.new("Fanta", 3)

    @tab = BarTab.new()

  end

  def test_print_attr
    assert_equal("Forever Gone", @song1.title)
    assert_equal("Rease", @guest1.name)
    assert_equal(1, @room1.room_number)
  end

  def test_check_in
    @room1.check_in(@guest5, @tab)
    result = @room1.ocupied_by.find { |guest| guest.name == "Paul" }
    assert_equal(@guest5, result)
    assert_equal([{"Paul"=>50}] ,@tab.tab)
  end

  def test_check_out
    @room1.check_in(@guest2, @tab)
    @room1.check_in(@guest3, @tab)
    @room1.check_in(@guest5, @tab)
    @room1.check_out(@guest3)
    result = @room1.ocupied_by.include?(@guest3)
    assert_equal(false, result)
  end

  def test_add_song
    @room1.add_song(@song1)
    @room1.add_song(@song2)
    @room1.add_song(@song3)
    assert_equal(true, @room1.song_list.include?(@song1))
    assert_equal(true, @room1.song_list.include?(@song2))
    assert_equal(true, @room1.song_list.include?(@song3))
  end

  def test_at_capacity
    @room1.check_in(@guest2, @tab)
    @room1.check_in(@guest3, @tab)
    @room1.check_in(@guest5, @tab)
    @room1.at_capacity
    assert_equal(true, @room1.at_capacity)
  end

  def test_buy_ticket
    assert_equal(true, @guest5.buy_ticket(@room1))
    assert_equal(false, @guest2.buy_ticket(@room1))
  end

  def test_sell_ticket
    assert_equal("Not enough money", @room1.sell_ticket(@guest3))
  end

  def test_favourite_song
    @room1.add_song(@song1)
    @room1.add_song(@song2)
    @room1.add_song(@song3)
    assert_equal("Whoo", @guest1.cheer(@room5))
  end

  def test_tab
    result = @tab.increase_tab(@guest5, 50)
    assert_equal([{"Paul"=>50}], result)
  end

  def test_buy_drink
    @guest5.buy_drink(@drink1)
    assert_equal(58, @guest5.wallet)
  end



end #class end
