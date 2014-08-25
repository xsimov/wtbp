Given(/^I go to the welcome page$/) do
  visit root_path
end

When(/^I want to search something$/) do
  fill_in "Search", with: "kail"
  click_button "Search"
end

Then(/^I get the results for all fields and kinds$/) do
  expect(page).to have_text "kail"
end