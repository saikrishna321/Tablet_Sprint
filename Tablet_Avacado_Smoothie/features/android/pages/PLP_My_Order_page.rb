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

		wait_for_elements_exist([pending_order], :timeout => 30)
		if element_exists (pending_order)
			touch(pending_order)
		else
			assert(pending_order, 'No Pending orders are present')
		end


	end



	def validate_amend_button
		make_changes = "* id:'amend_btn'"
		cancel_order = "* id:'cancel_btn'"
		wait_for_elements_exist([make_changes], :timeout => 30)
		if element_exists [make_changes, cancel_order]
			puts 'The Make Changes and Cancel Order button are displayed'
		else
			assert(make_changes, 'Make changes button is not present')
			assert(cancel_order, 'Cancel order button is not present')
		end

	end



	def validate_add_remove
		sleep(10)
		add_button = "* id:'add_btn'"
		remove_button = "* id:'remove_btn'"
		if !element_exists [add_button, remove_button]
			puts 'Add and Remove buttons are not displayed.'
			touch add_button
		else
			assert(add_button, 'The Add Button is displayed unexpectedly')
			assert(remove_button, 'The Remove Button is displayed unexpectedly')

		end
	end


end