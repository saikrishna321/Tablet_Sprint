require 'calabash-android/abase'

class PLP_Navigation < Calabash::ABase
	include Helpers
	include TescoHelpers
	include Common_functions
	include Common_id



	def plp_navigation(page_name)

		case page_name

			when "Home"
				wait_for_elements_exist [$shop_button_id]
				puts "I am on home screen"
				wait_for_elements_exist [$search_icon_id]
				puts "I am on Home0 screen"

			when "Shop"
				wait_for_animate_3sec
				shop_all_groceries_btn = "* id:'shop_btn'"
				grid_items = "* id:'grid_item'"
				touch(shop_all_groceries_btn)
				wait_for_elements_exist [grid_items]
				touch(grid_items)
				wait_for_elements_exist [grid_items]
				touch(grid_items)
				wait_for_elements_exist [grid_items]
				touch(grid_items)
				wait_for_elements_exist ["* id:'filter_by'"], timeout: 30
				puts "I am on shop all screen"

			when "Search"

				wait_for_animate_3sec
				# query_string = "* {text contains[c] '#{search_names}'}"
				touch_element($search_icon_id)
				wait_for_element($search_editfield_id, 30)
				enter_text($search_editfield_id, "sugar")
				touch_element($search_gridview_id)
				#loading_do_not_exist
				wait_for_element($filter_by, 30)

			when "My favourites"

				# wait_for_elements_exist ["* id:'action_bar_up_navigation'"], timeout:30
				# touch("* id:'action_bar_up_navigation'")
				touch_element($back_navigation_id)
				wait_for_elements_exist ["* marked:'Favourites & usuals'"], timeout: 30
				touch("* marked:'Favourites & usuals'")
				wait_for_none_animating
				wait_for_elements_exist ["* marked:'My favourites'"], timeout: 30
				touch("* marked:'My favourites'")
				wait_for_element($filter_by, 30)
				puts "I am on My favourite screen"

			when "My usuals"

				wait_for_elements_exist ["* id:'action_bar_up_navigation'"], timeout: 30
				touch("* id:'action_bar_up_navigation'")
				wait_for_elements_exist ["* marked:'Favourites & usuals'"], timeout: 30
				touch("* marked:'Favourites & usuals'")
				wait_for_none_animating
				wait_for_elements_exist ["* marked:'My usuals'"], timeout: 30
				touch("* marked:'usuals_layout_option'")
				wait_for_element($filter_by, 30
				puts "I am on My usuals screen"

			when "Special Offers"
				wait_for_elements_exist [$lhn_navigation], timeout: 30
				touch_element($lhn_navigation)
				wait_for_elements_exist [$lhn_special_offers], timeout: 30
				touch_element($lhn_special_offers)
				wait_for_elements_exist [$special_offer_header], timeout: 30
				puts "I am on Special offers screen"


			when "MY RECENT ORDERS"

				wait_for_elements_exist ["* id:'action_bar_up_navigation'"], timeout: 30
				touch("* id:'action_bar_up_navigation'")
				wait_for_elements_exist ["* marked:'Favourites & usuals'"], timeout: 30
				touch("* marked:'Favourites & usuals'")
				wait_for_none_animating
				wait_for_elements_exist ["* marked:'MY RECENT ORDERS'"], timeout: 30
				touch("* id:'order_date'")
				wait_for_element($filter_by, 30)
				puts "I am on My recent orders screen"

			when "My orders "

				wait_for_elements_exist [$lhn_navigation], timeout: 30
				touch_element($lhn_navigation)
				wait_for_elements_exist [$lhn_my_orders], timeout: 30
				touch_element($lhn_my_orders)
				wait_for_elements_exist [$my_order_header], timeout: 30
				puts "I am on My orders screen"


			when "Top offers"
				query_string = "* id:'dashboard_offers_topoffers_link'"
				wait_poll until_exists: query_string, timeout: 30 do
					performAction('scroll_down')
				end
				# wait_for_elements_exist ["* id:'dashboard_offers_topoffers_link'"], timeout:30
				# touch("* id:'dashboard_offers_topoffers_link'")
				touch_element($top_offers_id)
				wait_for_element($filter_by, 30)

			when "Half price"
				query_string = "* id:'dashboard_offers_halfprice_link'"
				wait_poll until_exists: query_string, timeout: 30 do
					performAction('scroll_down')
				end
				# wait_for_elements_exist ["* id:'dashboard_offers_halfprice_link'"], timeout:30
				# touch("* id:'dashboard_offers_halfprice_link'")
				touch_element($half_price_id)
				wait_for_element($filter_by, 30)

			when "Buy1get1free"
				query_string = "* id:'dashboard_offers_bogof_link'"
				wait_poll until_exists: query_string, timeout: 30 do
					performAction('scroll_down')
				end
				# wait_for_elements_exist ["* id:'dashboard_offers_bogof_link'"], timeout:30
				# touch("* id:'dashboard_offers_bogof_link'")
				touch_element($buy1get1_id)
				wait_for_element($filter_by, 30)

			else
				puts "Something went wrong , please check your code"
		end

	end



	def validation_query(validation_msg)
		sleep(2)
		puts "#{validation_msg}"
		text_from_screen=query("*", "text")
		element_present=text_from_screen.include? validation_msg
		assert_equal true, element_present

	end

end

