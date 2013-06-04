#####################################
### Includes minitest boilerplate ###
#####################################

require_relative "miniboiler"
include Miniboiler

###########################################
### Requires necessary files under test ###
###########################################

require_relative "./../newclass"

#############
### Tests ###
#############

class TestNewClass < Minitest::Test
  def setup
    @new_class = NewClass.new
  end  

  def test_add_number
    assert_equal "screech", @new_class.whos_left?
  end 
end 
