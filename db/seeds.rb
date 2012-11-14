# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'populator'
require 'faker'

# [Attempt, Question, Tag, User, Role].each(&:delete_all)

# Create random users
50.times do |i|
  User.create(
    :provider => 'facebook',
    :uid => rand(100000).to_s,
    :name => Faker::Name.name,
    :email => Faker::Internet.email,
  )
end

chrissy = User.find_or_create_by_name("Chrissy")
joe = User.find_or_create_by_name("Joe")
tett = User.find_or_create_by_name("Tett")
alex = User.find_or_create_by_name("Alex")

@users = User.all

# Create user groups
user_group_a = UserGroup.find_or_create_by_name(
  :name => "UserGroupA"
)
user_group_b = UserGroup.find_or_create_by_name(
  :name => "UserGroupB"
)
user_group_c = UserGroup.find_or_create_by_name(
  :name => "UserGroupC"
)

# Put users in user groups
user_group_a.users << chrissy
user_group_b.users << tett
user_group_c.users << alex
user_group_c.users << joe

# Create tags
10.times do |i|
  Tag.create(
    :name => Populator.words(1),
  )
end

@tags = Tag.all

# Create questions
25.times do |i|
    user = @users.sample
    user.questions.create(
      :xml => Populator.words(1..5),
    )
end

question_1 = Question.find_or_create_by_xml("Question 1")
question_2 = Question.find_or_create_by_xml("Question 2")
question_3 = Question.find_or_create_by_xml("Question 3")
question_4 = Question.find_or_create_by_xml("Question 4")

@questions = Question.all

# Create question groups
question_group_a = QuestionGroup.find_or_create_by_name_and_user_id(
  "QuestionGroupA",
  joe.id
)
question_group_b = QuestionGroup.find_or_create_by_name_and_user_id(
  "QuestionGroupB",
  alex.id
)
question_group_c = QuestionGroup.find_or_create_by_name_and_user_id(
  "QuestionGroupC",
  chrissy.id
)

@question_groups = QuestionGroup.all

# Put questions in question groups
question_group_a.questions << question_2
question_group_a.questions << question_3
question_group_b.questions << question_3
question_group_b.questions << question_1
question_group_c.questions << question_4
question_group_c.questions << question_1

# Create attempts
50.times do |i| 
  user = @users.sample
  question = @questions.sample
  Attempt.create(
    :user_id => user.id,
    :question_id => question.id,
    :answer => Populator.words(1..3),
    :is_correct => [true, false].sample,
  )
end    

# Create questions_tags entries
50.times do |i|
  question = @questions.sample
  tag = @tags.sample
  question.tags << tag
end


# Roles


# Abilities