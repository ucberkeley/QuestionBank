class Question < ActiveRecord::Base
  has_many   :attempts
  has_and_belongs_to_many :tags
  belongs_to :user
  has_many   :users, :through => :attempts

  #
  def generate_quiz(tags, number)
  	questions = []
  	results   = []
  	tags.each do |tag|
  		questions << Question.find_by_tag(tag).all
  	end
  	num_categories = questions.length 
  	num_per_category = number/num_categories
  		
  	if questions.flatten.length < number
  		#abandon ship
  	end

  	#not quite robust enough
  	#while(results.length < number){
	  	questions.each{|question|
	  		results << (question.length >= num_per_category) ? question.slice(num_per_category) : question.slice(question.length)
	  	}
	  	results.flatten
	#}
  end
end
