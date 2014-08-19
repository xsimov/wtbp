include Warden::Test::Helpers
Warden.test_mode!

Given(/^I am a signed in musician$/) do
  @user = FactoryGirl.create(:user)
  visit '/users/sign_in'
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button "Log in"
end

When(/^I go to the edit profile page$/) do
  visit edit_user_registration_path(@user)
end

When(/^I change my first name$/) do
  fill_in "First Name", with: "kail"
end

Then(/^name change is commited$/) do
  pending # express the regexp above with the code you wish you had
end