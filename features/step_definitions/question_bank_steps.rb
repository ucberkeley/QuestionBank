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
    click_button 'Save'
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

# Example:
#
# Given the following attempts exist:
#   | Question   | User      | Answer | Correctness |
#   | Question A | Student A | Apple  | True        |
#   | Question B | Student A | Orange | False       |
#   | Question A | Student B | Orange | False       |
Given /^the following attempts exist:$/ do |fields|
  fields.hashes.each do |attempt|
    question = attempt["Question"]
    user = attempt["User"]
    answer = attempt["Anser"]
    correctness = attempt["Correctness"]
    Attempt.create(
      :user_id => User.find_by_name(user).uid,
      :question_id => Question.find_by_xml(question).id,
      :answer => answer,
      :is_correct => correctness == "True" ? true : false
    )
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

When /^I upload a CSV file "(.*?)" with the following content:$/ do |filename, string|
  visit new_upload_path
  file = Tempfile.new(string)
  attach_file(:upload_upload_file,  Rails.root.join('features', filename))
  click_button "Upload CSV"
end

Given /^"(.*?)" is added as a question attribute$/ do |arg1|
  QuestionAttribute.create(name: arg1, backend_type: 'string')
end

Given /^I have admin privilege$/ do
  current_user.add_role :admin
end

Given /^"(.*?)" has admin privilege$/ do |name|
  User.find_by_name(name).add_role :admin
end

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

Then /^I should get a download with the filename "([^\"]*)"$/ do |filename|
  page.response_headers['Content-Disposition'].should include("filename=\"#{filename}\"")
end

Given /^I post to "(.*?)" with:$/ do |path, string|
  post path, string, "CONTENT_TYPE" => "application/json"
end

Given /^"(.*?)" is added as a user attribute$/ do |arg1|
  UserAttribute.create(name: arg1, backend_type: 'string')
end

And /^I should see an error message$/ do 
  if page.respond_to? :should
    page.should have_selector('#flash_error')
  else
    assert page.has_selector?('#flash_error')
  end
end
