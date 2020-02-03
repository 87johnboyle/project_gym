require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../models/session')

class TestSession < MiniTest::Test

  def setup
    @session1 = Session.new({
      'name' => 'Boxing',
      'genre' => 'Combat',
      'capacity' => 20
      })
    end

  def test_class_name
    assert_equal("Boxing", @session1.name)
  end

  def test_class_genre
    assert_equal("Combat", @session1.genre)
  end

  def test_class_capacity
    assert_equal(20, @session1.capacity)
  end

end
