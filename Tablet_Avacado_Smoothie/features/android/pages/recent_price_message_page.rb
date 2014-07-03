require 'calabash-android/abase'

class OrderPage < Calabash::ABase
  include Helpers
  include TescoHelpers
  include Common_functions
  include Common_id


  def orders (orderscreen)
    if orderscreen == "My Recent order"
      # sleep (5)
      recent_order = "* id:'order_date'"
      wait_for_elements_exist(["* id:'order_date'"],:timeout => 30)
      # touch(recent_order)
      if element_exists (recent_order)
        touch(recent_order)
      else
        assert(element_exists(recent_order),"There are no My recent Orders")
      end

    else
      # sleep (5)
      previous_order= "* marked:'PREVIOUS'"
      wait_for_elements_exist(["* marked:'PREVIOUS'"],:timeout => 30)

      if element_exists(previous_order)
        touch(previous_order)
      else
        assert(element_exists(previous_order),"There are no previous Orders")
      end
    end
  end


  # def MyRecentOrder
  #   sleep (10)
  #   recent_order = "* id:'#{$my_recent_order}'"
  #
  #   if (element_exits recent_order)
  #   touch_element(recent_order)
  #   else
  #   assert(element_exits(recent_order),"There are no My recent Orders")
  #   end
  #   end
  #
  # def PreviousOrder
  #   previous_order= "* id:'#{$previous_order}'"
  #
  #   if (element_exits previous_order)
  #     touch_element(previous_order)
  #   else
  #     assert(element_exits(previous_order),"There are no previous Orders")
  #   end
  # end

  def validatemessage
    # sleep(5)
    price_message = " * id:'header_text'"
    wait_for_elements_exist([" * id:'header_text'"],:timeout => 30)
    if element_exists(price_message) == true
      message = query("* id:'header_text'","text").first
      puts "User is able to see: #{message}"
    else
      assert(element_exists(price_message),"There is no price message")
    end


  end

  def validatescroll

    # sleep (5)
    price_message = "* id:'header_text'"
    object_before_scroll=query("*")
    performAction('drag',60,60,70,40,10)
    # sleep (5)
    object_after_scroll=query("*")
    if object_before_scroll==object_after_scroll
      puts "No PLP items in the screen, Hence scrolling is not possible"
    else
      if element_does_not_exist(price_message)== true
        puts "The message is not present after scrolling"

        performAction('drag',60,60,40,70,10)

        if element_exists(price_message)== true
          message = query("* id:'header_text'","text").first
          puts "After scroll up again,user is able to see: #{message}"

        else
          assert(element_exists(price_message),"There is no price message")

        end
      end

    end



  end

end
