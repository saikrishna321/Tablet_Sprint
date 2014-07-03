
Then(/^I navigates to "(.*?)"$/) do |page_name|
  @current_page = page(PLP_Navigation)
  @current_page.plp_navigation(page_name)
  screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")
end