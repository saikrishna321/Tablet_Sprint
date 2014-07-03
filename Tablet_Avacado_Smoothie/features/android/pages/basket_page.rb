require 'calabash-android/abase'

class Basket < Calabash::ABase
  include Helpers
  include TescoHelpers
  include Common_functions
  include Common_id



def initiate_checkout
  wait_for_elements_exist(["* id:'continue_btn'"], timeout:30) || wait_for_elements_exist(["* id:'check_out_btn'"], timeout:30)
    if element_exists("* id:'check_out_btn'")
      touch "* id:'check_out_btn'"
    else
      touch "* id:'continue_btn'"
    end

end


















  end