Given(/^I am in the sign up page$/) do
  visit new_user_registration_path
end

When(/^I fill in the sign up information$/) do
  fill_in 'Email', with: "xsimov@gmail.com"
  fill_in 'Password', with: "12345678"
  fill_in 'Password confirmation', with: "12345678"
  click_button "Sign up"

end

Then(/^I am registered$/) do
  expect(page).to have_content "You have successfully registered in 
  Who'sThatBassPlayer? An email has been sent with a verify link, in the 
  meanwhile you can fill in more information. Make yourself at home!"
end

When(/^I fill in wrong information$/) do
  fill_in 'Email', with: "gmail.com"
  fill_in 'Password', with: "15678"
  fill_in 'Password confirmation', with: "1678"
  click_button "Sign up"
end

Then(/^I get a validation error message$/) do
  expect(page).to have_content "There was some mistyping, maybe? Try filling in the following 3 fields again:"
end