require 'calabash-android/abase'

module Helpers

	def wait_for_none_animating
		sleep 8
	end



	def until_element_exists element, action
		wait_poll until_exists: element, timeout: 25 do
			action.call
		end
	end



	def once_element_exists element, action = lambda { touch element }
		#With this time out you better be sure it will show
		wait_for_elements_exist [element], timeout: 65
		action.call
	end



	def scroll_down_to? element
		performAction "scroll_down"
		element_exists element
	end



	def scroll_up_to? element
		performAction "scroll_up"
		element_exists element
	end



	def wait_for_animate
		# in cases where the element exists according to a query before an actual visual cue
		sleep(2)
	end



	def wait_for_animate_3sec
		sleep(3)
	end



	def wait_for_animation
		sleep(1)
	end



	def wait_for_animate_5sec
		sleep(5)
	end


end
