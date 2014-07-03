Then(/^I am on the "(.*?)" page$/) do |page_name|

	@current_page = page(Special_offers).validate_page(page_name)

end

Then(/^I verified Top offers list displayed by default$/) do

	@current_page = page(Special_offers).default_special_offer
end

Then(/^I switch to each Special offers type displayed in menu list$/) do
	@current_page = page(Special_offers).switch_offers

end

