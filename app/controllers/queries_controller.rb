require 'csv'

class QueriesController < ApplicationController

  def execute
     if !params[:user_group][:id].blank? && !params[:question_group][:id].blank?
      user_group = UserGroup.find(params[:user_group][:id])
      question_group = QuestionGroup.find(params[:question_group][:id])
      authorize! :read, user_group
      authorize! :read, question_group
      @attempts = Attempt.retrieve_by_user_group_and_question_group(user_group.id, question_group.id)
    elsif !params[:user_group][:id].blank? && params[:question_group][:id].blank?
      user_group = UserGroup.find(params[:user_group][:id])
      authorize! :read, user_group
      @attempts = Attempt.retrieve_by_user_group(user_group.id)
    elsif params[:user_group][:id].blank? && !params[:question_group][:id].blank?
      question_group = QuestionGroup.find(params[:question_group][:id])
      authorize! :read, question_group
      @attempts = Attempt.retrieve_by_question_group(question_group.id)
    else # params[:user_group][:id].blank? && params[:question_group][:id].blank?
      flash[:error] = 'You must choose either a user group or a question group.'
      redirect_to :action => 'prepare' and return
    end

    return self.export_to_csv(@attempts)
  end

  def prepare
    @user_groups = UserGroup.accessible_by(current_ability)
    @question_groups = QuestionGroup.accessible_by(current_ability)
  end

  def export_to_csv(attempts)       
    csv_string = CSV.generate do |csv|
         csv << ["User Id", "User Name", "Question Id", "Answer", "Is Correct", "Create At"]
         attempts.each do |attempt|
           csv << [attempt.id, User.find(attempt.user_id).name, attempt.question_id, attempt.answer, attempt.is_correct, attempt.created_at]
         end
    end         
  
   send_data csv_string,
   :filename => 'attempts.csv',
   :type => 'text/csv',
   :disposition => 'attachment'
  end 


end
