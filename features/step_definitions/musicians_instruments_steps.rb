Given(/^I am in a musician profile page$/) do
  @musician = FactoryGirl.create(:musician)
  visit musician_path(@musician)
end

Then(/^I want to see a list$/) do
  expect(page).to have_text "Instruments played by #{@musician.username}"
end

Given(/^I am in a musician profile page with associated instruments$/) do
  @musician = FactoryGirl.create(:musician)
  @musician.instruments.create FactoryGirl.build(:instrument).attributes
  visit musician_path(@musician)
end

Then(/^I want to see the instruments in the list$/) do
  expect(page).to have_text "#{@musician.instruments.first.name}"
end

Given(/^I am in a musician profile that has no instruments$/) do
  @musician = FactoryGirl.create(:musician)
  visit musician_path(@musician)
end

Then(/^I want to see a warning$/) do
  expect(page).to have_text "No instruments added yet."
end