When (/^I navigate to the search PLP$/) do
	@current_page = page(SearchPage)
	@current_page.search_product("Milk")
	screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")
end

