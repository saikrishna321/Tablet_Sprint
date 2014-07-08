require 'calabash-android/abase'

class PLP_My_Order < Calabash::ABase
	include Helpers
	include TescoHelpers
	include Common_functions
	include Common_id



	def trait
		" * marked:'My orders'"
	end



	def validate_pending_orders
		pending_order =" * marked:'PENDING'"
		wait_for_elements_exist(pending_order)
		if element_exists (pending_order)
			touch(pending_order)
		else
			assert(pending_order, 'No Pending orders are present')
		end


	end



	def validate_ammend_button


	end



	def validate_add_remove
		add_button = "* id:'add_btn'"
		remove_button = "* id:'remove_btn'"
		if !element_exists [add_button, remove_button]
			puts ('Add and Remove buttons are not displayed.')
		else
			assert(add_button, 'The Add Button is displayed unexpectedly')
			assert(remove_button, 'The Remove Button is displayed unexpectedly')

		end
	end

end