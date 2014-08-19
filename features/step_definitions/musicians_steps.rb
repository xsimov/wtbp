Given(/^I go to the sign up page$/) do
  visit '/musicians/new'
end

When(/^I put my data$/) do
  fill_in "Username", with: "kagdkajhdfkajhd"
  fill_in "Email", with: "someone@somemail.som"
  click_button "Sign up!"
end

Then(/^I am resgistered successfully$/) do
  expect(page).to have_text "Thanks for registering! Have fun discovering new music!"
end