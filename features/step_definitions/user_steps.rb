Given /^Omniauth is in test mode$/ do
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:twitter] = {
    "provider" => "twitter",
    "uid" => '12345'
  }
end

Given /^I am logged in as "(.*?)"$/ do |name|
  uid = User.find_by_name(name).uid
  OmniAuth.config.mock_auth[:twitter] = {
    "provider" => "twitter",
    "uid" => uid
  }
  visit '/signin'
end

Given /^I am logged in$/ do
  visit '/signin'
end

Given /^I am not logged in$/ do
  visit '/signout'
end

When /^I sign in$/ do
  visit '/signin'
end

When /^I sign out$/ do
  visit '/signout'
end

When /^I return to the site$/ do
  visit '/'
end
