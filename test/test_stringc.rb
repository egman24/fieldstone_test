require_relative "miniboiler.rb"
require_relative "./../stringcalc.rb"

class StringCalculatorTest < MiniTest::Test

  def setup 
    @calc = Calculator.new
  end

  def test_empty_string_addtion
    assert_equal 0, @calc.add("")
  end

  def test_single_number_addition
    assert_equal 4, @calc.add("4")
  end

  def test_multi_number_addition
    assert_equal 19, @calc.add("3,4,5,4,3")
  end

  def test_newline_delimiters
    assert_equal 12, @calc.add("6\n6")
  end

  def test_mixed_delimiters
    assert_equal 20, @calc.add("5,2\n3,5\n5")
  end

  def test_custom_delimiters
    assert_equal 10, @calc.add("//@\n3@2@5")
  end

end
