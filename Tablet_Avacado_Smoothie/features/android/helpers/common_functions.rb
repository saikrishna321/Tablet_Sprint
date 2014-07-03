require 'calabash-android/abase'

module Common_functions

	#---------------------
	#  Common Functions
	#---------------------

	def query_element(element_id)
		"* id:'#{element_id}'"
	end



# This function can assert 4 elements as of now , later can be modified as per need
	def assert_element(*element_id)
		parameter = *element_id
		puts "Element asserted :#{element_id}"
		no_of_assertion = element_id.length
		case element_id.length

			when 1
				wait_for_elements_exist query_element(element_id[0]), timeout: 2
				puts "validating #{no_of_assertion} element & i.e. #{parameter}"
			when 2
				wait_for_elements_exist [query_element(element_id[0]), query_element(element_id[1])], timeout: 2
				puts "validating #{no_of_assertion} element & i.e. #{parameter}"
			when 3
				wait_for_elements_exist [query_element(element_id[0]), query_element(element_id[1]), query_element(element_id[2])], timeout: 2
				puts "validating #{no_of_assertion} element & i.e. #{parameter}"
			else
				wait_for_elements_exist [query_element(element_id[0]), query_element(element_id[1]), query_element(element_id[2]), query_element(element_id[3]), query_element(element_id[4])], timeout: 2
				puts "validating #{no_of_assertion} element & i.e. #{parameter}"
		end
	end



	def touch_element(element_id)
		query_string = "* marked:'#{element_id}'"
		wait_for_elements_exist [query_string], timeout: 30
		touch query_string
	end



#id - pass the argument as ID of the element
#text - Text to send into the editText Field

	def enter_text(id, text)
		query("* marked:'#{id}'", :setText => "#{text}")

	end



	#id - pass the argument as ID of the element
	#waitTime - Time in seconds to wait for the element
	def wait_for_element(id, waitTime)
		wait_for_elements_exist ["* marked:'#{id}'"], timeout: waitTime
	end



	#id - pass the argument as ID of the element
	#waitTime - Time in seconds to wait for the element to disappear
	def wait_for_element_to_disapper(id, waitTime)
		wait_for_elements_do_not_exist ["* marked:'#{id}'"], timeout: waitTime
	end



	def loading_do_not_exist
		wait_for_elements_do_not_exist ["* id:'LoadingProgress'"], timeout: 30
	end



	def print_txt(id)
		query("* marked:'#{id}'", :text)
	end


end