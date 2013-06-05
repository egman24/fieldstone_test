  gem "minitest"
  require "minitest/autorun"
  require_relative "./../stringcalc"  

  class TestStringCalculator < MiniTest::Test
    def setup
      @calc = StringCalc.new
    end    

    def test_add_blank_string
      assert_equal 0, @calc.add("")
    end

    def test_add_one_number
      assert_equal 2, @calc.add("2")
      assert_equal 90, @calc.add("90")
    end

    def test_add_two_numbers
      assert_equal 7, @calc.add("4,3")
    end
    
    def test_unknown_amount_of_numbers
      assert_equal 40, @calc.add("6,4,10,15,3,2")
    end

    def test_handle_new_line_delimiters
      assert_equal 10, @calc.add("2\n3,1,1,2\n1")
    end

    def test_different_delimiters
      assert_equal 35, @calc.add("//@\n10@20@5")
    end

    def test_negative_numbers
      assert_throws(:error, 'negatives not allowed: -1, -4, -3') { @calc.add("3,4,2.-1,27,-4,-3,8")}
    end
  end


