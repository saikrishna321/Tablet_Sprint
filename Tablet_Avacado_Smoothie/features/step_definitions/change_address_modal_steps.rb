Then(/^I change the address$/) do
	@current_page = page(ChangeAddress)
	@current_page.changeAddr
end









