require 'calabash-android/abase'

class LeftHandNavigationPage < Calabash::ABase
  include Helpers
  include TescoHelpers

  def trait
    "* marked:'Home'"
  end

  def set_attributes
    # You should set attributes
    # whenever you scroll
    # whenever you swipe
    # whenever you arrive at a new page
    query "* id:'title' index:1", setContentDescription: "HOME"
    query "* id:'title' index:2", setContentDescription: "SHOP_ALL_GROCERIES"
  end

=begin
  def choose_navigation(navigation_item)
    if navigation_item=="Book a slot"
      query_string = "* marked:'Book a Slot'"

    else
      query_string = "* id:'title' {text contains'#{navigation_item}'}"
      #query_string = "grocery.droid.common.RobotoTextView {text contains'#{navigation_item}'}"
      wait_poll until_exists: query_string, timeout: 45 do
        performAction "scroll_down"
      end
    end
    touch query_string
  end
=end

  def choose_navigation(navigation_item)
    case navigation_item
      when "Book a slot"
        query_string = "* marked:'Book a Slot'"

      when "Add your clubcard"
        query_string = "* marked:'Add your Clubcard'"

      when "Wine by the Case"
        query_string = "* marked:'Wine by the case'"
        wait_poll until_exists: query_string, timeout: 45 do
          performAction('drag',10,10,50,10,1)
        end

      when "BlinkBox movies"

        puts "This option is not available"

       when "Sign out"
        query_string = "* marked:'Sign out'"

      when "BlinkBox music"
        query_string = "* marked:'blinkbox music'"
        wait_poll until_exists: query_string, timeout: 45 do
          #performAction "scroll_down"
          performAction('drag',10,10,50,10,1)
        end

      when "Tesco direct "
        query_string = "* marked:'Tesco direct '"
        wait_poll until_exists: query_string, timeout: 45 do
          performAction('drag',10,10,50,10,1)
        end
      else
        query_string = "* id:'title' {text contains'#{navigation_item}'}"
        wait_poll until_exists: query_string, timeout: 45 do
          #performAction "scroll_down"
          performAction('drag',10,10,50,10,1)
        end
    end
    blinkbox_movies = "BlinkBox movies"

    if blinkbox_movies == navigation_item
      puts "option is not present in LHN"
    else
      touch query_string
    end
  end

  def select_shop_category(category_name)
    query_string = "* {text contains[c] '#{category_name}'}"
    wait_poll until_exists: query_string, timeout: 30 do
    end
    touch query_string
  end

end