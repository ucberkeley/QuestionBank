Given /^I am signed in$/ do  
  visit login_path
  visit oauth_callback_path
end  

When /^Facebook authorizes me$/ do
  visit oauth_callback_path
end
