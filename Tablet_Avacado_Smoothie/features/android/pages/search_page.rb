require 'calabash-android/abase'

class SearchPage < Calabash::ABase
	include Helpers
	include TescoHelpers
	include Common_functions
	include Common_id



	def trait
		"* id:'scan_btn'"
	end



	def search_product(search_names)
		wait_for_animate_3sec
		# query_string = "* {text contains[c] '#{search_names}'}"
		touch_element($search_icon_id)
		wait_for_element($search_editfield_id, 30)
		enter_text($search_editfield_id, search_names)
		touch_element($search_gridview_id)
		loading_do_not_exist
		wait_for_element($filterBy_id, 30)
	end



	def back_button
		touch_element($back_navigation_id)
		#touch("* id:'action_bar_up_navigation'")
		wait_for_animate_3sec
	end



# added

	def scan_button?
		if element_exists "* id:'scan_btn'"
			puts "The Clear all button is present in Search screen!"
		else
			raise "Search did not get inititated"
		end
	end



	def suggested_items?
		# Selects the first item in the suggested text terms
		wait_for_elements_exist ["* id:'grid_textview'"], timeout: 30
		puts "Suggestions are displayed"
	end



	def select_suggested_search_item
		sleep 1.0
		suggested_txt = "* {text contains[c] 'Search For'}"
		touch(suggested_txt)
		wait_for_elements_do_not_exist ["* id:'LoadingProgress'"]
		sleep 1.0
	end



	def clear_all_history
		clear_all_btn = "* id:'clear_searches_text'"
		confirm_clear_search_history = "* id:'ok_btn'"
		# below 4 lines are added for quick fix ( When user not able to tap on clear history Yes button)
		query("*  id:'SearchEditText'", :setText => "sugar")
		wait_for_elements_exist ["* id:'grid_textview'"], timeout: 30
		touch("*  id:'grid_textview'")
		wait_for_elements_exist ["* id:'cancel_button'"], timeout: 30
		touch("* id:'cancel_button'")
		wait_for_elements_exist [clear_all_btn], timeout: 30
		touch clear_all_btn
		wait_for_elements_exist [confirm_clear_search_history], timeout: 30
		touch confirm_clear_search_history
		wait_for_elements_exist ["* id:'scan_btn'"], timeout: 30
	end



	def validate_search_history_cleared?
		wait_for_elements_do_not_exist(["* marked:'MY FREQUENT SEARCHES'"], :timeout => 30)
	end



	# in Android cancel button is not there so below functions tap on the back button
	def cancel_btn
		touch("* id:'action_bar_up_navigation'")
		wait_for_animate_3sec
		#wait_for_elements_exist("* id:'PopoverDismissRegion'")
		# touch "* id:'PopoverDismissRegion'"
	end



	def dismiss_search_bar?
		wait_for_elements_exist ["* id:'dashboard_context_card_title_text'"], timeout: 20
		puts "Search bar gets dismissed"
	end



	def verify_no_product
		element_exists("* {text contains[c] 'No Products Found'}")
	end
end

