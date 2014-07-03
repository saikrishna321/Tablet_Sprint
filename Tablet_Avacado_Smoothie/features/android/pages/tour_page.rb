require 'calabash-android/abase'

class TourPage < Calabash::ABase
	include Helpers
	include TescoHelpers



	def trait
		"* id:'next_btn'"
	end



	def take_tour
		if element_exists "* marked:'Next'"
			touch(trait)
			ok_got_it_btn = "* marked:'Ok, got it'"
			wait_for_elements_exist([ok_got_it_btn], timeout: 45)
			touch(ok_got_it_btn)
		end
	end

end