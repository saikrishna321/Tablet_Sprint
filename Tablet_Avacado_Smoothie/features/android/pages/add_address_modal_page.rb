require 'calabash-android/abase'

class AddAddress < Calabash::ABase
  include Helpers
  include TescoHelpers
  include Common_functions
  include Common_id

  def trait
  "* {text contains[c] 'Book a slot'}"
end

  def changeAddress
    wait_for_element($change_address_btn, 45)
    touch_element($change_address_btn)
    sleep 3
    wait_for_element($choose_address_txt, 45)
    puts "I can see the choose address modal"
  end

  def addAddressOption
    sleep 3
    wait_for_element($change_address_info, 45)
    wait_poll(:until_exists => "* id:'add_new_address'", :timeout => 20) do
      performAction('scroll_down')
    end
    wait_for_element($addNew_address_option, 45)
    puts "I can see add new address option"
    touch_element($addNew_address_option)
    sleep 3
    wait_for_element($addaddrs_search_txt, 45)
    puts "I can see add new address modal for postcode validation"
  end


  def invalidPostcode

    wait_for_element($addaddrs_search_txt, 45)
    enter_text($addaddrs_search_txt, "ZZ12AA")
    system("adb shell input keyevent KEYCODE_ENTER")
    wait_for_element($invpostcode_popup, 45)
    print_txt($invpostcode_popup_desc)
    puts "I can see the add address popup for invalid postcode"
    touch_element($invpostcode_ok_btn)
    wait_for_element($addaddrs_search_txt, 45)
  end

  def validPostcode
    enter_text($addaddrs_search_txt, "EH47EZ")
    system("adb shell input keyevent KEYCODE_ENTER")
    #touch_element($poscode_search_btn)
    wait_for_element($addrdetail_txt, 45)
    puts "I can see the add new address detail modal"
  end

  def addNew_Address
    wait_for_element($addrdetail_txt, 45)
    puts "I can see the add new address detail modal"
    touch_element($select_address)
    sleep 3
    touch_element($address_item)
    sleep 3
    puts "I select an address item"
    touch_element($select_proptype)
    touch_element($protype_item)
    sleep 3
    puts "I select an protype item"
    nickname = SecureRandom.hex(8)
    enter_text($address_nickname,nickname)
    sleep 3
    puts "I enter the nickname"
    enter_text($mobile_text,"07823555231")
    sleep 3
    performAction('scroll_down')
    enter_text($daytime_number_text,"07823555231")
    enter_text($evng_number_text,"07823555231")
    puts "I filled in all the mobile number"
    touch_element($done_btn)
    sleep 3
    wait_for_element($delivery_address, 45)
    puts "The new delivery address is: "
    print_txt($delivery_address)
    changeAddress
    wait_for_element($addr_info, 45)
    puts "The new address is displayed successfully on choose address screen"
    print_txt($addr_info)
  end

  def back_nav_addnewaddr
    wait_for_element($back_button, 45)
    sleep 5
    puts "I can see the back button"
    touch_element($back_button)
    puts "I touch the back button"
    sleep 3
    wait_for_element($choose_address_txt, 45)
    puts "I can see choose address screen"
    wait_for_element($close_icon, 45)
    touch_element($close_icon)
    wait_for_element($delivery_address, 45)
    I close the

  end
  end
