Given (/^I see the home page$/) do
@current_page = page(HomePage).await timeout: 30
screenshot_embed(:prefix => "screenshots/", :name => "sc_#{Time.now.to_i}")
end