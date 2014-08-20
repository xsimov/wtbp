Given(/^I go to a musician's bands profile$/) do
  @musician = FactoryGirl.create(:musician)
  visit musician_path(@musician)
end

When(/^I add a band$/) do
  click_link "Create a new band!"
  expect(current_url).to eq(new_band_url)
end

Then(/^I enter the properties$/) do
  fill_in "Name", with: "Illegal Jamms"
  fill_in "Styles", with: "Ska-Jazz, Ballads"
  fill_in "Year", with: "2007"
  click_button "Create band!"
end

Then(/^I get redirected to that band's profile$/) do
  band = Band.find_by(name: "Illegal Jamms")
  expect(current_url).to eq(band_url(band.id))
end

Then(/^I want see that I am a member$/) do
  expect(page).to have_text(@musician.username)
end