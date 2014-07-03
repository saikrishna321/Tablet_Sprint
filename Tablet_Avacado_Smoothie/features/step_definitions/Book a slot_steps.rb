When /^I open the left hand navigation$/ do

	@current_page = page(HomePage)
	screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")
	@current_page.open_side_nav
	@current_page = page(LeftHandNavigationPage).await timeout: 45
	screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")

end

When(/^I choose "(.*?)" from the left hand navigation$/) do |navigation_item|
	@current_page = page(LeftHandNavigationPage)
	screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")
	@current_page.choose_navigation(navigation_item)
end

Then (/^I am on the book a slot page$/) do
	@current_page = page(BookASlotPage).await timeout: 35
	screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")
end

When (/^I select "(.*?)" from the book a slot page$/) do |slot_type|
	@current_page = page(BookASlotPage)
	@current_page.slot_type(slot_type)
	screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")
end

Then /^I am on a choose a slot page$/ do
	@current_page = page(ChooseASlotPage).await timeout: 35
	screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")
end

And /^I choose a date with available times$/ do
	@current_page = page(ChooseASlotPage).choose_week
end

And /^I select an available time$/ do
	@current_page = page(ChooseASlotPage).select_time
	screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")
end

When /^I book the slot$/ do
	@current_page = page(ChooseASlotPage).book_slot
	screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")
end

Then /^I see the slot reserved page$/ do
	@current_page = page(ChooseASlotPage).slot_reserved
	screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")
end


And /^I see "Book a slot" card in home page$/ do
	@current_page = page(HomePage).await timeout: 30
	@current_page.slot_reserve_card?
	screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")

end
When /^I go to my basket$/ do
	@current_page = page(HomePage).open_basket
	screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")

end
And /^I initiate checkout$/ do
	@current_page = page(HomePage).proceed_to_checkout
	screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")

end

Then /^I proceed to checkout$/ do
	@current_page = page(Basket).initiate_checkout
	screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")
end

Then /^I add few item to basket$/ do

	@current_page = page(HomePage).add_item_to_basket
	screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")
end

Then(/^I verified "(.*?)" selected by default$/) do |view_type|

	@current_page = page(BookASlotPage).default_view
end

When(/^I selected "(.*?)"$/) do |slot_type|
	@current_page = page(BookASlotPage).slot_type(slot_type)

end

Then(/^I book a slot$/) do
	steps %Q{
  Then I am on a choose a slot page
  And I choose a date with available times
  And I select an available time

  When I book the slot
  Then I see the slot reserved page


  Then I see the home page
}
end

Then(/^I verified "(.*?)" selected by default with slot details$/) do |slot_type|

	@current_page = page(BookASlotPage).verify_slot_type(slot_type)

end
