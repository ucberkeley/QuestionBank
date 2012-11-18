class Question < ActiveRecord::Base
	has_and_belongs_to_many :tag
  has_and_belongs_to_many :question_group
	belongs_to :user
	has_many :attempt

	 def self.get_quiz(number_of_questions, tag_name)
    # Wonder if there is a cleaner way to do this
    all_tagged_questions = Question.all(:include => :tags, :conditions => ["tags.id = ?", tag_name])
    if number_of_questions.empty?
      return all_tagged_questions.take([all_tagged_questions.length, 5].min)
    else
      return all_tagged_questions.take([all_tagged_questions.length, Integer(number_of_questions)].min)
    end
  end
end
