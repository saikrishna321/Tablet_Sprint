require 'calabash-android/abase'

class ChangeAddress < Calabash::ABase
  include Helpers
  include TescoHelpers
  include Common_functions
  include Common_id

  def trait
    "* {text contains[c] 'Book a slot'}"
  end

  def changeAddr
    wait_for_element($change_address_btn, 45)
    touch_element($change_address_btn)
    # sleep 3
    wait_for_element($addr_info, 45)
    puts "I can see the address list"
    touch_element($addr_info)
    wait_for_element($delivery_address, 45)
    puts "Address changed successfully"
    touch_element($change_address_btn)
    wait_for_element($close_icon, 45)
    touch_element($close_icon)
    wait_for_element($delivery_address, 45)
    puts "I closed the modal successfully"
  end
  end
