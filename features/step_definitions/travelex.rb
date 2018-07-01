Given(/^I am on the Travelex landing page$/) do
  visit(TravelexLandingPage)
end

When(/^I resize the window to ([^"]*) pixels$/) do |pixels_value|
  on(TravelexLandingPage).resize_window_scroll(pixels_value)
end

When(/^I swipe the blocks sliders twice to the left side to view Buy foreign currency slider$/) do
  on(TravelexLandingPage).swipe_to_buy_foreign_currency_slider
end

Then(/^I should see the ([^"]*) slider successfully$/) do |slider_header|
  expect(on(TravelexLandingPage).buy_foreign_currency_header_element.text).to eql slider_header
end
