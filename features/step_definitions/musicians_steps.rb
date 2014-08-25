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
  3.times.with_index do |i|
    @musicians[i] = FactoryGirl.create(:musician)
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
end