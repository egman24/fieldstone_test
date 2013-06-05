#####################################
### Includes minitest boilerplate ###
#####################################

require_relative "miniboiler"
include Miniboiler

###########################################
### Requires necessary files under test ###
###########################################

require_relative "./../stringcalc"

#############
### Tests ###
#############

class TestStringCalc < Minitest::Test
  def setup
    @calc = StringCalc.new
  end

  def adds_empty_string
    #assert_equal 0, @calc.add("")
  end

end

