Given(/^I am on PLP from different pages$/) do
  @current_page = page(FilterBy_Sortby)
  screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")
end

When(/^I tap on filters by$/) do
  @current_page = page(FilterBy_Sortby)
  @current_page.select_filter_by
  screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")
end

Then(/^I see "(.*?)" pop up$/) do |option|
  @current_page = page(FilterBy_Sortby)
  @current_page.select_filter_and_sort(option)
  screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")
end

When(/^I tap on sort by$/) do
  @current_page = page(FilterBy_Sortby)
  @current_page.select_sort_by
  screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")
end