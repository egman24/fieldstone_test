require_relative 'miniboiler.rb'
require_relative './../stringcalc.rb'

class TestStringCalculator < Minitest::Test
  def setup
    @c = Calc.new
  end
  
  def test_empty_string_addition
    assert_equal 0, @c.add("")
  end

  def test_single_number_addition
    assert_equal 6, @c.add("6")
  end

  def test_double_number_addition
    assert_equal 13, @c.add("6,7")
    assert_equal 70, @c.add("69,1")
  end

  def test_unknown_amount_addition
    assert_equal 58, @c.add("40,3,4,2,1,4,3,1")
  end

end
