require 'calabash-android/abase'

class BookASlotPage < Calabash::ABase
	include Helpers
	include TescoHelpers



	def trait
		"* id:'HeaderTitle' {text contains[c] 'Book a slot'}"
	end



	def slot_type(type)
		if type.downcase == "home delivery"
			home_delivery
		elsif type.downcase == "click & collect"
			click_and_collect
		else
			raise "That is not an option on the Book a slot page"
		end
	end



	#----------Selecting home delivery option-------------
	def home_delivery
		wait_for_elements_do_not_exist ["* id:'LoadingProgress'"]
		wait_for_elements_exist(["* id:'hd_book_a_slot_layout'"], timeout: 30)
		touch("* id:'hd_book_a_slot_layout'")
	end



	#----------Selecting click & collect delivery option-------------

	def click_and_collect
		wait_for_elements_do_not_exist ["* id:'LoadingProgress'"]
		query_string = "* id:'cc_book_a_slot_layout'"
		wait_poll until_exists: query_string, timeout: 30 do
			performAction("scroll_down")
		end
		wait_for_elements_exist(["* id:'cc_book_a_slot_layout'"], timeout: 30)
		touch("* id:'cc_book_a_slot_layout'")
		#select collection point
		wait_for_elements_exist ["* id:'collection_point_address'"], timeout: 30
		touch "* id:'collection_point_address'"
		wait_for_elements_do_not_exist ["* id:'collection_point_address'"], timeout: 30
	end



	#---------------User tapping on change button from Home delivery or C&C----------------
	def change_address
		wait_for_elements_exist(["* id:'changeAddress'"], timeout: 30)
		touch("* id:'changeAddress'")
		wait_for_animation
	end



	#---------Verifying slot change confirmation message------
	def verify_popup_message
		# popUpNote = "You will lose your delivery slot reservation if you change to a collection.\nWould you like to change to a collection?"
		puts "Test"
	end



	def default_view
		query_string = query("* marked:'hd_title'", :isSelected).first
		if query_string == true
			puts "Default view selected is :Home Delivery"
		else
			raise "Default view selected should be : Home Delivery , but Click & collect is displayed as default "
		end
	end



	def switch_slot_type(slot_type)

		if slot_type == "Home Delivery"
			home_delivery
		else
			click_and_collect

		end
	end



	def verify_slot_type(slot_type)
		puts slot_type
		if (query "* marked:'cc_title'", :isSelected).first

			slot_details0 = query("* id:'cc_slot_booked_day'", :text).first
			slot_details1 = query("* id:'cc_slot_booked_date'", :text).first
			slot_details2 = query("* id:'cc_slot_booked_month'", :text).first
			slot_details3 = query("* id:'cc_slot_booked_type'", :text).first
			slot_details4 = query("* id:'cc_slot_delivery_to'", :text).first
			slot_details5 = query("* id:'cc_slot_between'", :text).first
			slot_details6 = query("* id:'cc_slot_service_charge'", :text).first
			slot_details7 = query("* id:'cc_slot_booked_footer_text'", :text).first

			slot_details = slot_details0+slot_details1+slot_details2+slot_details3+slot_details4+slot_details5+slot_details6+slot_details7
			puts "Click & collect is selecetd with slot details"
			puts "Slot details displayed :#{slot_details}"
		else

			puts "default selection id : Home Delivery"
		end
	end

end
