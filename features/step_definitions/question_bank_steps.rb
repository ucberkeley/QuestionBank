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
    # create user groups
    UserGroup.find_or_create_by_name("CS169Fall2012")
    UserGroup.find_or_create_by_name("CS111Fall2011")
    # create question groups
    QuestionGroup.find_or_create_by_name("Quiz 1")
    QuestionGroup.find_or_create_by_name("Quiz 2")
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

# this method needs to be implemented
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

# filler step until feature is implemented
Then /^I should see an under\-privileged error message$/ do
  body = page.body
#  page.should have_content "Only instructors are allowed to generate quizzes"
end

Given /^I own the "(.*?)" "(.*?)"$/ do |resource_type, resource_name|
    # filler
end

Then /^I should get a download with the filename "([^\"]*)"$/ do |filename|
       page.response_headers['Content-Disposition'].should include("filename=\"#{filename}\"")
end