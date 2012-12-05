class QuestionValue < ActiveRecord::Base
	belongs_to :question_attributes
	belongs_to :questions

	def self.update_attribute (question, attribute, value)
		newAttribute = self.create(:question_attribute_id => attribute.id, :question_id=>question.id, (attribute.backend_type+"_value").to_sym => value)
	end
end
