require 'calabash-android/abase'

class LoginPage < Calabash::ABase
  include Helpers
  include TescoHelpers
  include Common_functions
  include Common_id
  def trait
    "* id:'signin_btn'"
  end

  def sign_in
    update_cancel
    sign_in_signedOutPage
    enter_credentials
    sign_in_signInPage
  end

  def update_cancel
    wait_for_animate
    not_now_button = "* id:'cancel_btn'"
    if element_exists not_now_button
      wait_for_elements_exist ["* id:'cancel_btn'"], timeout: 30
      touch("* id:'cancel_btn'")
    end
    performAction('drag',50,50,50,20,10)
    performAction('drag',50,50,50,20,10)
  end

  #def enter_credentials(username="testclouddemo+tesco#{ENV['XTC_DEVICE_INDEX']}@xamarin.com",password="password")
 # def enter_credentials(username="auto@gmail.com",password="qwerty")
   def enter_credentials
    wait_for_element($signin_username_id, 30)
    enter_text($signin_username_id, $username)
    wait_for_element($signin_password_id, 30)
    enter_text($signin_password_id, $password)

   # query("* id:'username_et'", :setText=>"#{username}")
   # query("* id:'password_et'", :setText=>"#{password}")
  end

  def sign_in_signedOutPage
    touch_element($sign_in_id)
    wait_for_element($signin_username_id, 30)
   # tap "signin_btn"
  end

  def sign_in_signInPage
    wait_for_animate
    touch("* id:'signin_btn'")
    wait_for_element($shop_button_id, 30)
    #wait_for_elements_exist ["* marked:'dashboard_context_card_title_text'"], timeout: 20
    #wait_for_none_animating
  end

  def update_cancel
    wait_for_animate
    not_now_button = "* id:'cancel_btn'"
    if element_exists not_now_button
      wait_for_elements_exist ["* id:'cancel_btn'"], timeout: 30
      touch("* id:'cancel_btn'")
    end
    performAction('drag',50,50,50,20,10)
    performAction('drag',50,50,50,20,10)
  end

end