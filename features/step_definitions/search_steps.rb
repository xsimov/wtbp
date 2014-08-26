Given(/^I go to the welcome page$/) do
  visit root_path
end

When(/^I want to search something$/) do
  @musician = FactoryGirl.create(:musician)
  fill_in "search", with: "kail"
  click_button "Search"
end

Then(/^I get the results for all fields and kinds$/) do
  expect(page).to have_text @musician.first_name
  expect(page).to have_text @musician.last_name
  expect(page).not_to have_text "Your search didn't come with anything! Sorry :("
end

Given(/^I go to the bands page$/) do
  FactoryGirl.create(:band, name: "Kail Friends")
  visit bands_path
end

When(/^I search something$/) do
  fill_in "search", with: "kail"
  click_button "Search"
end

Then(/^I get the results for bands only$/) do
  expect(current_path).to eq("/search/bands")
  expect(page).to have_text "Kail Friends"
end

Given(/^I go to the musicians page$/) do
  FactoryGirl.create(:musician, first_name: "Kail", last_name: "Laurence")
  visit musicians_path
end

Then(/^I get the results for musicians only$/) do
  expect(current_path).to eq("/search/musicians")
  expect(page).to have_text "Kail Laurence"
end

Given(/^I search for something that doesn't exist$/) do
  visit root_path
  fill_in "search", with: "ruru"
  click_button "Search"
end

Then(/^I want to see a empty\-thing warning$/) do
  expect(page).to have_text "Your search didn't come with anything! Sorry :("
end