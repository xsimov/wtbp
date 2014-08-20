Given(/^I go to a musician's bands profile$/) do
  @musician = FactoryGirl.create(:musician)
  visit musician_path(@musician)
end

When(/^I add a band$/) do
  click_link "Create a new band!"
  expect(current_url).to eq(new_band_url)
end

Then(/^I can enter the properties$/) do
  fill_in "Name", with: "Illegal Jams"
  fill_in "Styles", with: "Ska-Jazz, Ballads"
  fill_in "Year", with: "2007"
  click_button "Create band!"
end