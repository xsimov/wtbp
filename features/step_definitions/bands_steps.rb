Given(/^I go to a musician's bands profile$/) do
  @musician = FactoryGirl.create(:musician)
  visit musician_path(@musician)
end

When(/^I add a band$/) do
  click_button "Create a new band!"
end

Then(/^I can enter the properties$/) do
  fill_in "Band's name:", with: "Illegal Jams"
  fill_in ""
end