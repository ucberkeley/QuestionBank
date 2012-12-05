require 'populator'
require 'faker'

# Create user groups
5.times do |i|
  UserGroup.create(:name => "User Group " + Faker::Name.name,)
end

# Create random users
50.times do |i|
  u = User.create(
    :provider => 'Twitter',
    :uid => i+1,
    :name => Faker::Name.name,
    :email => Faker::Internet.email,
  )
  (rand(3)+1).times do |j|
    UserGroup.find(rand(5)+1).users << u
  end
end

# Create tags
10.times do |i|
  Tag.create(:name => Populator.words(1))
end

# Create questions
5.times do |i|
    QuestionGroup.create(:name => "Question Group " + Populator.words(1))
end

# Create questions
25.times do |i|
    q = User.all.sample.questions.create(:xml => Populator.words(1..5))
    (rand(3)+1).times do |j|
      q.tags << Tag.all.sample
    end
    QuestionGroup.all.sample.questions << q
end

# Create attempts
50.times do |i| 
  user = User.all.sample
  question = Question.all.sample
  Attempt.create(
    :user_id => user.id,
    :question_id => question.id,
    :answer => Populator.words(1..3),
    :is_correct => [true, false].sample,
  )
end    
