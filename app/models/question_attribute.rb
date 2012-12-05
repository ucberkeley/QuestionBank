class QuestionAttribute < ActiveRecord::Base
	has_many :question_values
end
