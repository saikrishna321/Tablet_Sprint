require 'calabash-android/abase'

class ChooseASlotPage < Calabash::ABase
  include Helpers
  include TescoHelpers
  include Common_functions
  include Common_id

  def trait
    "* {text contains[c] 'Book a slot'}"
  end

  def choose_week
    wait_for_elements_do_not_exist(['activityIndicatorView'], :timeout => 30)

    # For Sprint 1 testing purpose, we are commenting out this function
    # TODO-  WRITE LOGIC to check if no slots are available in week 3 then move to the previous week tab

    #week_tab = query("SegmentLabel",:text)
    #week_3 = week_tab[2]
    #btn_week_3 = "* marked:'#{week_3}'"
    #touch(btn_week_3)
    #puts "Selected week range is #{week_3}"
    wait_for_elements_do_not_exist(['activityIndicatorView'], :timeout => 30)
  end


  def select_time
    #wait_for_elements_exist ["* marked:'bookNewSlot'"], timeout:30
    wait_for_elements_exist ["* marked:'book_slot_choose_grid_textview'"], timeout:30
    book_a_slot_btn = (query "* marked:'bookNewSlot'", :isEnabled).first

    #btn_text = (query "* marked:'bookNewSlot'", :text).first
    # # if !book_a_slot_btn
    #  puts "#{btn_text} button is disabled now"
      wait_for_elements_exist ["* id:'book_slot_choose_grid_textview'"], timeout:30
      ary = query "* id:'book_slot_choose_grid_textview'",:text
      slot_info = ary.reject! { |s| s.empty? }
      puts "AVAILABLE SLOTS :"+"\n"
      print slot_info
      ary_size = slot_info.size
      until book_a_slot_btn == true   #|| catch_value == 1 do
        label_value = slot_info[ary_size-3]
        touch "* marked:'#{label_value}'"
        ary_size = ary_size - 1
        book_a_slot_btn = (query "* marked:'bookNewSlot'", :isEnabled).first
      end
        puts "\n"+"\n"+"Selected slot of :#{label_value}"
   # end
  end



  def book_slot
    btn_text = (query "* marked:'bookNewSlot'", :text).first
    wait_for_animate
    puts "#{btn_text} button is enabled now ,User tapped on #{btn_text} button"
    book_new_slot
  end

  def book_new_slot
    book_a_slot_btn = "* id:'bookNewSlot'"
    wait_for_elements_exist([book_a_slot_btn], :timeout => 30)
    touch(book_a_slot_btn)
  end


  def slot_reserved

    wait_for_elements_exist ["* id:'loader_image'"],timeout:30
    if element_exists ("* id:'loader_image'")
      puts "Reserving the slot loader is displayed"
    else
      raise "Reserving the slot loader is not displayed"
    end

    query_string = query("* marked:'DialogTitle'", :text).first
    while !query_string == "Slot reserved"
      sleep 1
      query_string = query("* marked:'DialogTitle'", :text).first
    end
    puts "User is on Slot reserved dialog"
    wait_for_elements_exist ["* id:'LoadingProgress'"],timeout:30
    wait_for_elements_do_not_exist ["* id:'LoadingProgress'"],timeout:30
    puts "Waiting for loading to complete"
    continue
  end

  def continue
    wait_for_elements_exist(["* id:'continue_btn'"],:timeout => 30)
    continue_button = "* id:'continue_btn'"
    touch(continue_button)
    puts "Tapped Continue buttton "
    wait_for_none_animating
  end

  def refuse_dialog
    sleep 0.5
   title_text = query("* id:'dialog_desc'",:text).first

    if title_text == "Sorry, we could not book that slot because our servers are busy."
      touch "* id:'ok_btn'"
    end

  end


end