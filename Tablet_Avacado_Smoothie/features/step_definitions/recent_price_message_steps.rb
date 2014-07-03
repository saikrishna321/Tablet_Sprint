Then (/^I tap on the "(.*?)"$/) do |orderscreen|
  @current_page = page (OrderPage)
  @current_page.orders(orderscreen)

end

And (/^I Validate the recent order Price Message$/) do
  @current_page=page(OrderPage)
  @current_page.validatemessage

end

Then (/^I validate scroll off$/)do
  @current_page=page(OrderPage)
  @current_page.validatescroll
end