When(/^I tap change address option$/) do
	@current_page = page(AddAddress)
	@current_page.changeAddress
end
Then(/^I tap add new address option$/) do
	@current_page = page(AddAddress)
	@current_page.addAddressOption
end
When(/^I check for invalid postcode popup$/) do
	@current_page = page(AddAddress)
	@current_page.invalidPostcode
end
And(/^I enter valid postcode$/) do
	@current_page = page(AddAddress)
	@current_page.validPostcode
end
Then(/^I add new address$/) do
	@current_page = page(AddAddress)
	@current_page.addNew_Address
end

Then(/^I verify the back navigation$/) do
	@current_page = page(AddAddress)
	@current_page.back_nav_addnewaddr
end