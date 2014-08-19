include Warden::Test::Helpers
Warden.test_mode!

Given(/^I am a signed in musician$/) do
  @user = FactoryGirl.create(:user_authed)
  visit '/users/sign_in'
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button "Log in"
end

When(/^I go to the edit profile page$/) do
  visit edit_user_registration_path(@user)
end

When(/^I change my first name$/) do
  fill_in "First name", with: "kail"
  click_button "Update information"
end

Then(/^name change is commited$/) do
  expect(User.find(@user.id).name).to eq("kail")
end