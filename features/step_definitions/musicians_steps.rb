Given(/^I go to the sign up page$/) do
  visit '/musicians/new'
end

When(/^I put my data$/) do
  fill_in "Username", with: "xsimov"
  fill_in "Email", with: "xsimov@gmail.com"
  click_button "Sign up!"
end

Then(/^I am resgistered successfully$/) do
  expect(page).to have_text "Thanks for registering! Have fun discovering new music!"
end