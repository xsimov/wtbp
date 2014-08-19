Given(/^I go to a musician's profile page$/) do
  @musician = FactoryGirl.create(:user_authed)
  visit user_path(@musician.id)
end

Then(/^I can see the instruments I play$/) do
  expect(page).to have_content "Instruments played by #{@musician.email}:"
end