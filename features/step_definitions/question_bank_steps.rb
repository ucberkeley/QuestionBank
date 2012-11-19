Given /^that the app is set up$/ do
    # create questions
    question1 = Question.find_or_create_by_xml("Why is the sky blue?")
    question2 = Question.find_or_create_by_xml("What is the meaning of life?")
    # create tags
    tag1 = Tag.find_or_create_by_name("meteorology")
    tag2 = Tag.find_or_create_by_name("philosophy")
    # tag questions
    question1.tags << tag1
    question2.tags << tag2
end    

Given /^I added a question with content "(.*?)"$/ do |question_xml|
    visit path_to("the new question page")
    fill_in 'question_xml', :with => question_xml
    click_button 'Create Question'
end

# filler method until feature is implemented
Given /^I am logged in as an instructor$/ do
    visit path_to("the homepage")
end

# filler method until feature is implemented
Given /^I am logged in as a non\-instructor$/ do
    visit path_to("the homepage")
end

When /^I try to generate a quiz$/ do
    click_on "Generate Quiz"
end

When /^I try to generate a quiz with (\d+) questions$/ do |num_questions|
    fill_in 'question[number_of_questions]', :with => num_questions # Something's wrong here ...
end

When /^I try to generate a quiz with the topic "(.*?)"$/ do |tag|
    select tag, :from => 'topic'
end

Given /^PENDING/ do
    pending
end

Given /^the "(.*?)" "(.*?)" exists$/ do |resource_type, resource_name|
    resource_type.to_s.classify.constantize.find_or_create_by_name(resource_name.to_s)
end

Given /^the user group "(.*?)" exists$/ do |group|
  UserGroup.create(:name => group)
end

Given /^the question group "(.*?)" exists$/ do |group|
  QuestionGroup.create(:name => group)
end

Given /^the users? "(.*?)" exists with uid "(.*?)"$/ do |user, uid|
  User.create(:name => user, :uid => uid, :provider => "twitter")
end

Given /^the following users exist:$/ do |fields|
  fields.rows_hash.each do |user, uid|
    User.create(:name => user, :uid => uid, :provider => "twitter")
  end
end

Given /^the following questions exist:$/ do |fields|
  fields.rows_hash.each do |question, number|
    Question.create(:xml => question)
  end
end

Given /^"(.*?)" is in the user group "(.*?)"$/ do |user, group|
  UserGroup.find_by_name(group).users << User.find_by_name(user)
end

Given /^"(.*?)" is in the question group "(.*?)"$/ do |question, group|
  QuestionGroup.find_by_name(group).questions << Question.find_by_xml(question)
end

Given /^"(.*?)" is the owner of "(.*?)"$/ do |user, group|
  User.find_by_name(user).add_role :owner, UserGroup.find_by_name(group)
end

Given /^"(.*?)" is the owner of question group "(.*?)"$/ do |user, group|
  User.find_by_name(user).add_role :owner, QuestionGroup.find_by_name(group)
end

Given /^"(.*?)" is a viewer of "(.*?)"$/ do |user, group|
  User.find_by_name(user).add_role :viewer, UserGroup.find_by_name(group)
end

Given /^"(.*?)" is a viewer of question group "(.*?)"$/ do |user, group|
  User.find_by_name(user).add_role :viewer, QuestionGroup.find_by_name(group)
end

When /^I visit the user group edit page of "(.*?)"$/ do |group|
  visit edit_user_group_path(UserGroup.find_by_name(group))
end

# http://stackoverflow.com/questions/5255250/cucumber-test-file-download
Then /^I should receive a file "(.*?)"$/ do |file|
  page.response_headers['Content-Type'].should == "text/csv" && page.response_headers['Content-Disposition'].should =~ /#{file}/
end

# filler step until feature is implemented
Then /^the quiz should have (\d+) questions$/ do |num_questions|
    body = page.body
end

Then /^the quiz should have the topic "(.*?)"$/ do |tag|
    if page.respond_to? :should
        page.should have_content(tag)
    else
        assert page.has_content?(tag)
    end
end

Then /^I should see an under\-privileged error message$/ do
    pending
    # body = page.body
    # page.should have_content "Only instructors are allowed to generate quizzes"
end

Then /^I should get a download with the filename "([^\"]*)"$/ do |filename|
  page.response_headers['Content-Disposition'].should include("filename=#{filename}")
end

Given /^I have no privileges in group "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given /^I try to view analytics of "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given /^I have "(.*?)" privilege in group "(.*?)"$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Given /^I assign "(.*?)" priviledge to "(.*?)"$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see "(.*?)" as a "(.*?)"$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Given /^I have "(.*?)" privilege$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see (\d+) groups$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

And /^I should see an error message$/ do 
  if page.respond_to? :should
    page.should have_selector('#flash_error')
  else
    assert page.has_selector?('#flash_error')
  end
end
