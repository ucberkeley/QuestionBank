# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'populator'
require 'faker'

[Attempt, Question, Tag, User].each(&:delete_all)

# Create users
50.times do |i|
  User.create(
    :provider => 'facebook',
    :uid => rand(100000).to_s,
    :name => Faker::Name.name,
    :email => Faker::Internet.email,
  )
end

# Create tags
10.times do |i|
  Tag.create(
    :name => Populator.words(1),
  )
end

# Create questions
@users = User.all
25.times do |i|
    user = @users.sample
    user.questions.create(
      :xml => Populator.words(1..5),
    )
end

# Create attempts
@questions = Question.all
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
@tags = Tag.all
50.times do |i|
  question = @questions.sample
  tag = @tags.sample
  question.tags << tag
end


# Roles


# Abilities