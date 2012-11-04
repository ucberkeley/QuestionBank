Given /^that the app is set up$/ do
    # create a user  
    user = User.find_or_create_by_name("Chrissy")
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

# filler method until feature is implemented
Given /^I am logged in as an instructor$/ do
    visit path_to("the homepage")
end

# filler method until feature is implemented
Given /^I am logged in as a non\-instructor$/ do
    visit path_to("the homepage")
end

When /^I try to generate a quiz$/ do
    click_on "Generate a quiz"
end

When /^I try to generate a quiz with (\d+) questions$/ do |num_questions|
    fill_in 'num_questions', :with => num_questions
end

# this method needs to be implemented
Then /^the quiz should have (\d+) questions$/ do |num_questions|
    body = page.body
end

When /^I try to generate a quiz with the topic "(.*?)"$/ do |tag|
    select tag, :from => 'topic'
end

Then /^the quiz should have the topic "(.*?)"$/ do |tag|
    if page.respond_to? :should
        page.should have_content(tag)
    else
        assert page.has_content?(tag)
    end
end
