require 'calabash-android/abase'

class HomePage < Calabash::ABase
  include Helpers
  include TescoHelpers
  include Common_functions
  include Common_id

  def trait
    "* marked:'Shop all groceries'"
    #"* id:'dashboard_context_card_button_1'"
  end
  def shop_all_groceries
    shop_btn = "* marked:'Shop all groceries'"
    wait_for_elements_exist [shop_btn], timeout: 30
    touch(shop_btn)
  end
    #def trait
   # "* id:'dashboard_welcome_text'"
  #end

  def slot_reserved?
    query_string = "* id:'dashboard_context_card_title_text' {text contains[c] 'slot reserved'}"

    wait_poll until_exists: query_string, timeout: 30 do
      sleep 1.0
    end
  end

  #def shop_all_groceries
   # touch "* id:'shop_btn'"
  #end

   def change_slot
    wait_for_elements_exist ["* id:'dashboard_context_card_title_text'"], timeout: 50
    query_string = "* marked:'Change slot'"
    wait_for_elements_exist [query_string]
    touch query_string
  end
def navigation(page_name)

    touch "* marked:'#{page_name}'"

end

   def validate_page(page_name)

    print "User navigated to :"

    case page_name

      when "Home"
        wait_for_elements_exist ["* id:'shop_btn'"], timeout:30
        puts "#{page_name} page"

      when "My orders"
        wait_for_elements_exist ["* marked:'My orders'"], timeout:30
        puts "#{page_name} page"

      when "Favourites"
        wait_for_elements_exist ["* marked:'Favourites'"], timeout:30
        puts "#{page_name} page"

      when "Book a slot"
        wait_for_elements_exist ["* marked:'Book a slot'"], timeout:30
        puts "#{page_name} page"

      when "Add your clubcard"
        wait_for_elements_exist ["* marked:'Add your Clubcard'"], timeout:30
        puts "#{page_name} page"

      when "Store locator"
        wait_for_animate_5sec
        wait_for_elements_exist ["* marked:'Store locator'"], timeout:30
        puts "#{page_name} page"

      when "Real food"
        wait_for_animate_5sec
        wait_for_elements_exist ["* marked:'Real food'"], timeout:30
        puts "#{page_name} page"

      when "Wine by the Case"
        wait_for_elements_exist ["* {text contains[c] 'This option will take you out of the Tesco Groceries app'}"], timeout:30
        puts "#{page_name} page & This option will take you out of the Tesco Groceries app"

      when "Tesco direct"
        wait_for_elements_exist ["* {text contains[c] 'This option will take you out of the Tesco Groceries app'}"], timeout:30
        puts "#{page_name} page & This option will take you out of the Tesco Groceries app"

      when "BlinkBox movies"
        puts "option not available"

      when "BlinkBox music"
        query_string = "* marked:'blinkbox music'"
        wait_for_elements_exist ["* {text contains[c] 'This option will take you out of the Tesco Groceries app'}"], timeout:30
        puts "#{page_name} page & This option will take you out of the Tesco Groceries app"

      when "Help & about"
        wait_for_animate
        wait_for_elements_exist ["* marked:'Terms & conditions'"], timeout:30
        puts "#{page_name} page"

      else
        raise "Something went wrong, please check the page name or this feature is not available in your platform"

    end

   end

  def slot_reserve_card?
    wait_for_elements_exist ["* id:'dashboard_context_card_button_1'"], timeout:30
    query_string = (query "* id:'dashboard_context_card_button_1'",:text).first
    puts "Card text:#{query_string}"
    checkout_text = "Checkout"
    if query_string == checkout_text

      raise "Prerequisite for this scenario : slot should not be already booked"
    else

      puts "Slot is not reserved yet , Please book your slot to checkout"
    end
  end

  def open_basket
    wait_for_elements_exist ["* id:'basket_action_bar_down'"]
    touch "* id:'basket_action_bar_down'"
    sleep 5
  end

  def proceed_to_checkout
    wait_for_elements_exist ["* id:'check_out_btn'"], timeout:30
    touch "* id:'check_out_btn'"
  end

  def add_item_to_basket

    shop_all_groceries_btn = "* id:'shop_btn'"
    grid_items = "* id:'grid_item'"
    add_btn = "* id:'add_btn'"

    touch(shop_all_groceries_btn)
    wait_for_elements_exist [grid_items]
    touch(grid_items)
    wait_for_elements_exist [grid_items]
    touch(grid_items)
    sleep 1
    wait_for_elements_exist [grid_items]
    touch(grid_items)
    wait_for_none_animating
    wait_for_elements_exist [add_btn]
    touch add_btn
  end


end