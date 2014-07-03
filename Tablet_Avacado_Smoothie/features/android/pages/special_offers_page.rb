require 'calabash-android/abase'
require 'test/unit/assertions'


class Special_offers < Calabash::ABase
	include Helpers
	include TescoHelpers
	include Common_functions
	include Common_id



	def trait

		"* marked:'All Offers'"

	end



	def default_special_offer


	end



	def switch_offers

		menu_item = query "* marked:'menu_name'", :text

		puts "Total #{menu_item.count} special offer type displayed :"
		puts menu_item



		def touch_offers(type)

			touch "* marked:'#{type}'"
			puts "\n"+" Selected :#{type} "
			wait_for_elements_do_not_exist ["* marked:'LoadingProgress'"], timeout: 150
		end



		menu_item.each { |a| touch_offers(a) }

	end



	def validate_page(page_name)

		case page_name

			when "Special Offers"
				wait_for_elements_exist ["* marked:'sort_by'"], timeout: 30
				title = (query "* marked:'HeaderTitle'", :text).first
				#assert_equal("Special Offers", title, failure_message = "User is not on Special offer page" )

				if (title == "Special Offers")
					puts "User is on Special offer page"

				else

					raise "User expected to be on Special offers page"
				end


		end

	end

end