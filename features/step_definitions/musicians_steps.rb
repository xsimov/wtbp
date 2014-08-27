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

Given(/^I go to the all musicians page$/) do
  @musicians = []
  @bands = []
  3.times.with_index do |i|
    @musicians[i] = FactoryGirl.create(:musician)
    @bands[i] = FactoryGirl.create(:band)
    @bands[i].members << @musicians[i]
  end
  visit musicians_path
end

Given(/^I can see all the registered musicians$/) do
  3.times.with_index do |i|
    expect(page).to have_text @musicians[i].username
  end
end

When(/^I click on a musician's username$/) do
  click_link @musicians[0].username
end

Then(/^I get redirected to its profile$/) do
  expect(current_url).to eq(musician_url(@musicians[0]))
end

Then(/^I can see its information$/) do
  expect(find('article')).to have_text "Aliases"
  expect(find('article')).to have_text "First Name"
  expect(find('article')).to have_text "Last Name"
  expect(find('article')).to have_text "Birth date"
  expect(find('article')).to have_text "Instruments played"
  expect(find('article')).to have_text "Bands"
end

Given(/^some bands they play on next to their name$/) do
  3.times.with_index do |i|
    expect(page).to have_text @musicians[i].bands.first.name
  end
end

Given(/^I am a registered musician$/) do
  @musician = FactoryGirl.create(:musician)
end

When(/^I go to the sign in \/ up page$/) do
  visit new_musician_path
end

When(/^I input the login info$/) do
  within("#login") do
    fill_in "username", with: @musician.username
    fill_in "password", with: @musician.password
    click_button "Sign in"
  end
end

Then(/^I get redirected to my profile$/) do
  expect(current_url).to eq(musician_url(@musician))
end

Then(/^I see the menu$/) do
  expect(page).to have_text
end