require 'calabash-android/abase'

class ShopPage < Calabash::ABase
	include Helpers
	include TescoHelpers
	include Common_functions
	include Common_id



	def trait
		"* id:'HeaderTitle' {text contains[c] 'shop'}"
	end



	def select_category(category_name)
		query_string = "* {text contains[c] '#{category_name}'}"

		wait_poll until_exists: query_string, timeout: 45 do
			wait_for_animate
			#performAction "scroll_down"
			performAction "scroll_up"
		end
		touch query_string
	end



	def offers_product
		list_offers = query_element($offer_link)
		wait_poll until_exists: list_offers, timeout: 45 do
			performAction('drag', 50, 50, 50, 20, 10) # scroll items in the PLP
			wait_for_animate
		end
		touch list_offers
		#touch("* id:'pro_offer_desc'")
	end



	def offer_listscreen_validation
		wait_for_animate
		wait_for_element($offerValid_title_id, 30)
		query_string = "* id:'offerValidity'"
		if element_exists query_string
			off_title = query(query_string, :text).first
			puts "'#{off_title }'"
		else
			puts "Offer list page is not displayed"
		end
	end



	def offers_button(action_term)
		if action_term == "Top offers"
			performAction('scroll_down')
			performAction('scroll_down')
			touch_element($top_offers_id)
			loading_do_not_exist
		elsif action_term == "Half price"
			performAction('scroll_down')
			performAction('scroll_down')
			touch_element($half_price_id)
			loading_do_not_exist
		elsif action_term == "Buy 1 Get 1 Free"
			performAction('scroll_down')
			performAction('scroll_down')
			touch_element($buy1get1_id)
			loading_do_not_exist
		end
	end



	def back_navigation_offerListpage
		touch_element($back_navigation_id)
		touch_element($back_navigation_id)
	end

end


