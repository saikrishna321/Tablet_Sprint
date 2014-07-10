Then(/^I see filters$/) do

end

When(/^I tap the search bar$/) do
	@current_page.initiate_search
end

Then(/^I am on the search page$/) do
	@current_page = page(SearchPage).await timeout: 45
end

Then(/^I see a scan button$/) do
	@current_page.scan_button?
end

When(/^I search for "(.*?)"$/) do |item|
	@current_page.search_for(item)
end

Then(/^I see some suggested searches$/) do
	@current_page.suggested_items?
end

When(/^I select a suggested search item$/) do
	@current_page.select_suggested_search_item
end

When(/^I open the left hand navigation \(LHN\)$/) do

end

Then(/^I am on the favourites hub$/) do

end

When(/^I select "(.*?)" from the Favourites page$/) do |arg1|

end
