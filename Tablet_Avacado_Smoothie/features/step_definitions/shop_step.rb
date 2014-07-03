And(/^I navigate to shop PLP$/) do
	@current_page = page(HomePage).await timeout: 30
	@current_page.shop_all_groceries
	@current_page = page(ShopPage).await timeout: 35
	screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")
	@current_page.select_category("Fresh Food")
	@current_page.select_category("Fresh Fruit")
	screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")
	@current_page.select_category("Apples Pears & Rhubarb")
	screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")
	#@current_page.select_category("Berries & Cherries")
	#@current_page = page(ItemShowPage).await timeout: 35
	# @current_page.on_item?("Avocados")
end

Then (/^I navigate to PDP$/) do
	@current_page = page(ItemShowPage).await timeout: 30
	screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")
	@current_page.enter_pdp_page
end

And (/^I validate PDP page$/) do
	@current_page = page(ItemShowPage).await timeout: 30
	@current_page.pdp_page_validation
	screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")
end

#search offer product and tap on offer link
Then (/^I tap on Offer link$/) do
	@current_page = page(ShopPage)
	@current_page.offers_product
	screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")
end

And (/^Validate the Offer list screen$/) do
	@current_page = page(ShopPage)
	@current_page.offer_listscreen_validation
	screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")
end

# Tap on top offers,bye1 get 1 and half price button
When(/^I tap on "(.*?)" option from home page$/) do |action_term|
	@current_page = page(ShopPage)
	screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")
	@current_page.offers_button(action_term)
end

Then (/^I navigate back to home screen$/) do
	@current_page = page(ShopPage)
	screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")
	@current_page.back_navigation_offerListpage
end