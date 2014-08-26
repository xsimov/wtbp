Given(/^I go to the welcome page$/) do
  visit root_path
end

When(/^I want to search something$/) do
  fill_in "search", with: "kail"
  click_button "Search"
end

Then(/^I get the results for all fields and kinds$/) do
  expect(page).to have_text "Results for bands"
  expect(page).to have_text "Results for musicians"
end

Given(/^I go to the bands page$/) do
  visit band_path()
end

When(/^I search something$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I get the results for that model only$/) do
  pending # express the regexp above with the code you wish you had
end