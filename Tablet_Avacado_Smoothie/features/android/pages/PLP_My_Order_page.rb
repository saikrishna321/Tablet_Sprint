require 'calabash-android/abase'

class PLP_My_Order < Calabash::ABase
	include Helpers
	include TescoHelpers
	include Common_functions
	include Common_id



	def trait
		" * marked:'My orders'"
	end



	def validateAddRemove
		pending_order =" * marked:''"


	end

end