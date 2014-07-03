require 'calabash-android/abase'

module TescoHelpers

	def open_side_nav
		wait_for_animate
		touch_element($menu_btn)
	end



	def back_btn
		back_btn = "button marked:'header btn back'"
		touch back_btn
		wait_for_elements_do_not_exist [back_btn]
	end



	def previous_page
		back_btn = "* marked:'action_bar_up_navigation'"
		open_main_menu_btn = "button marked:'Open main menu'"
		home_btn = "* marked:'Home'"
		wait_for_animate

		if element_exists("* marked:'Continue shopping'")
			touch "* marked:'Continue shopping'"
		end
		wait_for_loading
		wait_for_elements_exist([back_btn], :timeout => 10)
		touch(back_btn)
		wait_for_animate
		wait_for_animate
		if element_exists(back_btn)
			touch(back_btn)
			wait_for_animate
			if element_exists(home_btn)
				touch home_btn
				wait_for_animate
			end
		else
			if element_exists(home_btn)
				touch home_btn
			end
			touch(open_main_menu_btn)
			wait_for_animation
			touch(home_btn)
		end
	end



	def my_basket
		touch("button marked:'Open basket'")
		sleep 2.0
	end



	def add_item
		# by default this will only add the first item in the array of items in the list.
		# we can get more sophisicated to decide which item we want to choose, but I think this works
		# as a proof of concept for now
		wait_for_none_animating
		add_btn = "button marked:'add_btn'"
		wait_for_elements_exist [add_btn], timeout: 15
		touch(add_btn)
		# wait_for_elements_exist ["button marked:'Open basket'"], timeout: 35
		wait_for_elements_exist ["* marked:'IN BASKET'"], timeout: 35
	end



	def add_another_item
		# by default this will only add the first item in the array of items in the list.
		# we can get more sophisicated to decide which item we want to choose, but I think this works
		# as a proof of concept for now
		wait_for_none_animating
		add_btn = "button marked:'add_btn'"
		wait_for_elements_exist [add_btn], timeout: 15
		touch(add_btn)
		wait_for_elements_exist ["* marked:'IN BASKET'"], timeout: 35
	end



	def remove_item
		# by default this will only remove the first item in the array of items in the list.
		# we can get more sophisicated to decide which item we want to choose, but I think this works
		# as a proof of concept for now
		wait_for_animate
		touch("button marked:'remove_btn'")
		wait_for_animate
		# wait_for_elements_exist( ["button marked:'Open basket'"], :timeout => 30)
		puts "Item removed successfully"
	end



	# Added Add_item funcation to remove item  and campare the values for both quantity & Guide Price before & After add
	# from any PLP screen
	def add_item_verify
		wait_for_animate
		value1= query("* marked:'quantityText'", :text)[0]
		guide_price1 = query("* marked:'basket_action_bar_up'", :text)[0]
		puts "Quantity Before Add Item :  :  #{value1}"
		touch("* id:'add_btn'")
		wait_for_animate
		sleep 4
		#wait_for_elements_exist( ["button marked:'Open basket'"], :timeout => 40)
		value2 = query("* marked:'quantityText'", :text)[0]
		if (value2 == "0")
			value2 = query("* marked:'quantityText'", :text)[3]
		end
		guide_price2 = query("* marked:'basket_action_bar_up'", :text)[0]
		puts "Quantity After Add Item: :  #{value2}"
		#campare_values(value1,value2)
		#campare_values(guide_price1,guide_price2)
		#puts "Item added successfully"

	end



	# Funcation to campare two values
	def campare_values(a, b)
		if a == b
			#puts"#{a} and #{b}"
			puts "Item count is same as before"
		elsif a > b
			puts "Item is removed from the basket"

		else
			puts "Item is added into basket"
		end

	end



	# def add_another_item
	#     # by default this will only add the first item in the array of items in the list.
	#     # we can get more sophisicated to decide which item we want to choose, but I think this works
	#     # as a proof of concept for now
	#     wait_for_animate
	#     touch("button marked:'add_btn'")
	#     wait_for_animation
	# end


	# Added Remove funcation to remove item  and campare the values for both quantity & Guide Price before & After remove
	# from any PLP screen
	def remove_item_verify

		wait_for_animate
		value3= query("* marked:'quantityText'", :text)[0]
		guide_price3 = query("* marked:'basket_action_bar_up'", :text)[0]
		puts "Quantity Before remove Item :  :  #{value3}"
		touch("* id:'remove_btn'")
		wait_for_animate
		sleep 4
		#wait_for_elements_exist( ["button marked:'Open basket'"], :timeout => 40)
		value4 = query("* marked:'quantityText'", :text)[0]
		guide_price4 = query("* marked:'basket_action_bar_up'", :text)[0]
		puts "Values guide price & Quantity(remove :After) : #{guide_price4} #{value4}"
		puts "Count  guide price #{guide_price4}"
		puts "Quantity campare"
		campare_values(value3, value4)
		# puts "guideprice campare"
		# campare_values(guide_price3,guide_price4)
		#puts "Item added successfully"
	end



	#item add and remove
	def item_count
		query("* marked:'quantityText'", :text)[0]
	end



	def scroll_down
		#scroll("*", :down)
	end



	def scroll_carousel


	end



	def initiate_search
		wait_for_elements_exist ["* marked:'Search'"], timeout: 30
		touch("* marked:'Search'")
	end



	def dismiss_dialogue
		if element_exists "grocery.droid.common.RobotoButton id:'ok_single_btn'"
			touch "grocery.droid.common.RobotoButton id:'ok_single_btn'"
			wait_for_elements_do_not_exist ["grocery.droid.common.RobotoButton id:'ok_single_btn'"]
		else
			query_size = query("grocery.droid.common.RobotoButton").size - 1
			touch("grocery.droid.common.RobotoButton index:#{query_size}") if element_exists "grocery.droid.common.RobotoButton index:#{query_size}"
			wait_for_elements_do_not_exist ["grocery.droid.common.RobotoButton index:#{query_size}"]
		end
	end



	def save_order_changes
		query_string = "button marked:'Save changes'"
		dialogue_query_string = "* {text contains 'Yes'}"
		continue_save_amend = "* marked:'Continue'"
		if element_exists query_string

			touch query_string
			wait_for_elements_exist [dialogue_query_string]
			touch dialogue_query_string
			wait_for_elements_exist [continue_save_amend]
			touch continue_save_amend
		else
			raise "You had no changes to save!"
		end
	end



	def outstanding_changes?
		begin
			wait_for_elements_exist ["button marked:'Save changes'"], timeout: 10
			element_exists "button marked:'Save changes'"
		rescue
			element_exists "button marked:'Save changes'"
		end
	end



	def cancel_order_changes
		query_string = "button marked:'Cancel changes'"
		dialogue_query_string = "label {text contains[c] 'Do you want to cancel changes to this order?'}"
		if element_exists query_string
			touch query_string
			wait_for_elements_exist [dialogue_query_string]
			touch dialogue_query_string
		else
			raise "You had no changes to save!"
		end
	end



	def confirm_amend?
		dialog_desc = "label {text contains[c] 'Changes to your order have been saved'}"
		wait_for_elements_exist [dialog_desc]
		element_exists dialog_desc
		touch "* marked:'OK'"
		wait_for_animate
		puts "Order Confirmation message is displayed "
	end

end
