Given(/^I am in the root page$/) do
  visit root_path
  expect(current_url).to eql("http://www.example.com/")
end
Given /^I am not authenticated$/ do
    visit('/users/sign_out') # ensure that at least
end

Given /^I am a new, authenticated as "(.*?)"$/ do |u|
  user = nil
  if u == "admin"
    user = FactoryGirl.create(:user, admin:true)
  else
    user = FactoryGirl.create(:user)
  end
  visit '/users/sign_in'
  fill_in "user[email]", :with => user.email
  fill_in "user[password]", :with => 'Password1'
  click_button "Log in"
end

When(/^I click on the register link$/) do
  click_on "Register"
end

When(/^I fill in email with "(.*?)"$/) do |email|
  fill_in "user_email", with: email
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, password|
  fill_in field, with: password
end

When(/^I click on the "(.*?)" button$/) do |submit|
  click_on submit 
end

Then(/^I should see "(.*?)"$/) do |message|
  expect(page.body).to include(message)
end
