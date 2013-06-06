require_relative 'miniboiler'
require_relative './../stringcalc.rb'

class StringCalculatorTest < MiniTest::Test
  def setup
    @calculator = Calculator.new
  end

  def test_empty_string_addition
    assert_equal 0, @calculator.add("")
  end

  def test_one_number_string_addition
    assert_equal 190, @calculator.add("190")
    assert_equal 1,   @calculator.add("1")
  end

  def test_two_number_string_addition
    assert_equal 50, @calculator.add("20,30")
    assert_equal 68, @calculator.add("50,18")
  end

  def test_unknown_number_string_addition
    assert_equal 49, @calculator.add("7,2,6,10,20,4")
  end

  def test_newline_delimiters
    assert_equal 20, @calculator.add("7\n3,2,2\n4\n2")
  end

  def test_custom_delimiters
    assert_equal 43, @calculator.add("//^\n5^10^20^2^3^3")
    assert_equal 58, @calculator.add("//&\n30&10&10&4&2&1&1")
  end

  def test_negative_number_exception
    assert_raises(RuntimeError) { @calculator.add("-1") }      
    assert_raises(RuntimeError) { @calculator.add("-4,-3,3,4") }
    assert_raises(RuntimeError) { @calculator.add("2,3,4,5,-2") }
  end 

  def test_numbers_greater_than_1000_get_ignored
    assert_equal 3, @calculator.add("1000,2,1,1400,30000")
  end
  
  def test_delimiters_of_any_length
    assert_equal 10, @calculator.add("//***\n3***2***5")
  end

  def test_mixed_delimiters
    assert_equal 10, @calculator.add("//#*\n3#*2#*5")
  end

  def test_mixed_delimiters_of_any_length
    assert_equal 10, @calculator.add("//*$*$*\n3*$*$*2*$*$*5")
  end

end
