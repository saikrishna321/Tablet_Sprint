require 'calabash-android/abase'

class ItemShowPage < Calabash::ABase
	include Helpers
	include TescoHelpers
	include Common_functions
	include Common_id



	def trait
		"* id:'add_btn'"
	end



	def on_item?(item_name)
		element_exists "* id:'HeaderTitle' {text contains[c] '#{item_name}'}"
	end



	def enter_pdp_page
		wait_for_animate
		touch_element($pdp_page) # tap on first item on the PLP
	end



# function for PDP screen & To verify user in PDP screen
	def pdp_page_validation
		wait_for_animate
		check_element_does_not_exist("* id:'#{$filterBy_id}'")
		product_name = query("* id:'prod_name'", "text").first
		puts "Product name is: #{product_name}"
		puts "User on PDP screen"
	end

end