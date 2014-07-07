When (/^I tap on "(.*?)" from LHN$/ do |navigation_item|
	@current_page = page(HomePage)
	screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")
	@current_page.open_side_nav
	@current_page = page(LeftHandNavigationPage).await timeout: 45
	screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")
	@current_page = page(LeftHandNavigationPage)
	screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")
	@current_page.choose_navigation(navigation_item)
end


And (/^tapping on Pending order from LHN should not display Add or remove component$/) do
	@current_page = page ()

end