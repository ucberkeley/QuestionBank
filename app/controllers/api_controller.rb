require 'json'

class ApiController < ApplicationController
	def new_event
		user 			= User.find_or_create_by_name(params["username"])
		question_group	= params["event"]["problem_id"]
		questions 		= params["event"]["answers"].keys
		questions.each do |question|
			question_id = (question_group + question).hash
			Attempt.create(
				:user_id => user.id,
				:question_id => question_id,
				:answer => params["event"]["answers"][question],
				:is_correct => params["event"]["correct_map"][question]["correctness"] == "incorrect" ? false : true)
		end	
		respond_to do |format|
      		format.html
      		format.json { render json: @attempt }
    	end	
	end
end
