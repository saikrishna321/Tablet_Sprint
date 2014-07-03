Given(/^I go through the tour$/) do
 # @current_page = page(TourPage).await timeout: 45
 @current_page = page(TourPage)
  @current_page.take_tour
end

When(/^I sign in to the application$/) do
 @current_page = page(LoginPage).await timeout: 45
 @current_page.sign_in

end