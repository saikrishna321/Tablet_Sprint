require 'calabash-android/abase'

class FilterBy_Sortby < Calabash::ABase
	include Helpers
	include TescoHelpers
	include Common_functions
	include Common_id



	def trait
		"* id:'filter_by'"
	end



	def select_filter_by
		sleep 8
		wait_for_elements_exist ["* id:'filter_by'"], timeout: 30
		touch("* id:'filter_by'")
		sleep 3
		#touch_element($filter_by_id)
		#puts "verified"
		# wait_for_element($clear_all_filters_id, 30)
		# wait_for_elements_exist ["* id:'clear_all_filters'"], timeout: 30
	end



	def select_sort_by
		if element_exists "* id:'sort_by'"
			wait_for_elements_exist ["* id:'sort_by'"], timeout: 30
			touch("* id:'sort_by'")
			#touch_element($sort_by_id)
		else
			puts "Sort by option is not available"
		end
	end



	def select_filter_and_sort(option)

		if option == "filtered"
			wait_for_elements_exist ["* id:'header_cross_btn'"], timeout: 30
			touch("* id:'header_cross_btn'")
			#touch_element($sort_filter_cross_icon_id)
			wait_for_elements_exist ["* id:'filter_by'"], timeout: 30
			#wait_for_element($filter_by_id, 30)

		else
			#wait_for_elements_exist ["* id:'default_btn'"], timeout: 30
			if element_exists "* id:'default_btn'"
				#wait_for_element($sort_default_button_id, 30)
				touch("* id:'header_cross_btn'")
				#touch_element($sort_filter_cross_icon_id)
				wait_for_elements_exist ["* id:'sort_by'"], timeout: 30
				#wait_for_element($sort_by_id, 30)
			else
				puts "Sort by option is not available"
			end
		end
	end


end