namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [Attempt, Question, Tag, User].each(&:delete_all)
    
    # Create users
    50.times do |i|
      created_at = Populator.value_in_range(1.year.ago..Time.now)
      User.create(
        :provider => 'facebook',
        :uid => rand(100000).to_s,
        :name => Faker::Name.name,
        :oauth_token => Populator.words(1), 
        :oauth_expires_at => 14.days.from_now,
        :created_at => created_at,
        :updated_at => created_at
      )
    end

    # Create tags
    10.times do |i|
      created_at = Populator.value_in_range(1.year.ago..Time.now)
      Tag.create(
        :name => Populator.words(1),
        :created_at => created_at,
        :updated_at => created_at       
      )
    end

    # Create questions
    @users = User.all
    25.times do |i|
        user = @users.sample
        created_at = Populator.value_in_range(user.created_at..Time.now.to_datetime)
        user.questions.create(
          :xml => Populator.words(1..5),
          :created_at => created_at,
          :updated_at => created_at
        )
    end

    # Create attempts
    @questions = Question.all
    50.times do |i| 
      user = @users.sample
      question = @questions.sample
      earliest_time = [user.created_at, question.created_at].max
      created_at = Populator.value_in_range(earliest_time..Time.now.to_datetime)
      Attempt.create(
        :user_id => user.id,
        :question_id => question.id,
        :answer => Populator.words(1..3),
        :created_at => created_at,
        :is_correct => [true, false].sample,
        :cohort_id => rand(100)
      )
    end    
    
    # Create questions_tags entries
    @tags = Tag.all
    50.times do |i|
      question = @questions.sample
      tag = @tags.sample
      question.tags << tag
    end

  end
end