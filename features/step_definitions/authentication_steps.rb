Given(/^I am in the root page$/) do
  visit root_path
  expect(current_url).to eql("http://www.example.com/")
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
