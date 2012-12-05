class Question < ActiveRecord::Base
  attr_accessible :xml, :tag_ids
	has_and_belongs_to_many :tags
  has_and_belongs_to_many :question_groups
  has_many :question_attributes
  has_many :question_values, :through => :question_attributes
	belongs_to :user
	has_many :attempts

	 def self.get_quiz(number_of_questions, tag_name)
    # Wonder if there is a cleaner way to do this
    all_tagged_questions = Question.all(:include => :tags, :conditions => ["tags.id = ?", tag_name])
    if number_of_questions.empty?
      return all_tagged_questions.take([all_tagged_questions.length, 5].min)
    else
      return all_tagged_questions.take([all_tagged_questions.length, Integer(number_of_questions)].min)
    end
  end
  include HydraAttribute::ActiveRecord
end
