Given(/^I'm in any page$/) do
  visit root_path
end

When(/^I access the log in menu$/) do
  click_on "Sign in"
end

When(/^put my data$/) do
  @musician = FactoryGirl.create(:musician)
  within('#signin') do
    fill_in "username", with: @musician.username
    fill_in "password", with: @musician.password
    click_button "Sign in"
  end
end

Then(/^I get redirected to my profile page$/) do
  expect(current_url).to eq(musician_url(@musician))
end

Then(/^I can see the menu to edit$/) do
  expect(page).to have_text "Create a new band"
end

Then(/^When I log out$/) do
  click_on "Sign out"
end

Then(/^I see a notice$/) do
  expect(find('#notice')).to have_text "Signed out successfully, hope to see you soon! :)"
end

Then(/^I don't see the menu anymore$/) do
  visit musician_path(@musician)
  expect(page).not_to have_text "Create a new band"
end

Given(/^I'm logged in$/) do
  visit new_musician_path
  @musician = FactoryGirl.create(:musician)
  within('#signin') do
    fill_in "username", with: @musician.username
    fill_in "password", with: @musician.password
    click_button "Sign in"
  end
end