Then(/^I navigates to "(.*?)"$/) do |page_name|
	@current_page = page(PLP_Navigation)
	@current_page.plp_navigation(page_name)
	screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")
<<<<<<< HEAD
=======
end

Then(/^I see filters "([^"]*)"$/) do |arg|
	@current_page.validation_query(arg)
>>>>>>> c29ecae9de370f5b342ee1393524335846f09fc1
end