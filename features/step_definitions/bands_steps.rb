Given(/^I go to a musician's bands profile$/) do
  @musician = FactoryGirl.create(:musician)
  visit musician_path(@musician)
end

When(/^I add a band$/) do
  click_link "Create a new band!"
  expect(current_path).to eq(new_band_path)
end

Then(/^I enter the properties$/) do
  fill_in "Name", with: "Illegal Jamms"
  fill_in "Styles", with: "Ska-Jazz, Ballads"
  fill_in "Year", with: 2007
  click_button "Create band!"
end

Then(/^I get redirected to that band's profile$/) do
  band = Band.find_by(name: "Illegal Jamms")
  expect(current_path).to eq(band_path(band.id))
end

Then(/^I want see that I am a member$/) do
  expect(page).to have_text(@musician.username)
end

Given(/^I go to a band profile$/) do
  band = FactoryGirl.create(:band)
  visit band_path(band)
end

When(/^I want to add a new member$/) do
  @musician = FactoryGirl.create(:musician)
  click_button "Add a new member!"
end

Then(/^I can choose it from all the registered members$/) do
  find("##{@musician.username}").click
end

# Then(/^the musician I chose is in the list with its position in the band$/) do
#   expect(page).to have_content "#{@musician.username} - Piano"
# end

When(/^I want to add a concert$/) do
  click_button "Add a new concert!"
end

Then(/^I can enter the specifications$/) do
  fill_in "Date", with: "5/9/2014"
  fill_in "Hour", with: "19:00"
  fill_in "Place", with: "Cafe Rene"
  fill_in "Additional info", with: "Tarírarí"
  click_button "Save concert!"
end

# Then(/^I get redirected to that concert page$/) do
#   this_concert = Concert.find_by(place: "Cafe Rene")
#   expect(current_path).to eq(band_concert_path(this_concert.band_id, this_concert.id))
# end

Then(/^add its position on the band$/) do
  within('#position_form') do
    fill_in "input_position", with: "Piano"
    click_button "Set position"
  end
end