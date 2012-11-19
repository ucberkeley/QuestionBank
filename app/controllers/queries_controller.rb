require 'csv'

class QueriesController < ApplicationController

  def execute
     if !params[:user_group][:id].blank? && !params[:question_group][:id].blank?
      user_group = UserGroup.find(params[:user_group][:id])
      question_group = QuestionGroup.find(params[:question_group][:id])
      authorize! :read, user_group
      authorize! :read, question_group
      @attempts = Attempt.retrieve_by_user_group_and_question_group(user_group.id, question_group.id)
      self.export_to_csv(@attempts, user_group.name, question_group.name)
    elsif !params[:user_group][:id].blank? && params[:question_group][:id].blank?
      user_group = UserGroup.find(params[:user_group][:id])
      authorize! :read, user_group
      @attempts = Attempt.retrieve_by_user_group(user_group.id)
      self.export_to_csv(@attempts, user_group.name, false)
    elsif params[:user_group][:id].blank? && !params[:question_group][:id].blank?
      question_group = QuestionGroup.find(params[:question_group][:id])
      authorize! :read, question_group
      @attempts = Attempt.retrieve_by_question_group(question_group.id)
      self.export_to_csv(@attempts, false, question_group.name)
    else
      flash[:error] = 'You must choose either a user group or a question group.'
      redirect_to :action => 'prepare' 
    end
  end

  def prepare
    @user_groups = UserGroup.accessible_by(current_ability)
    @question_groups = QuestionGroup.accessible_by(current_ability)
  end

  def export_to_csv(attempts, user_group_name, question_group_name)       
    csv_string = CSV.generate do |csv|
         csv << ["User Id", "User Name", "Question Id", "Answer", "Is Correct", "Created At"]
         attempts.each do |attempt|
           csv << [attempt.id, User.find(attempt.user_id).name, attempt.question_id, attempt.answer, attempt.is_correct, attempt.created_at]
         end
    end         
    
    if user_group_name && question_group_name
      user_group_name = user_group_name.strip.gsub(" +", "_")
      question_group_name = question_group_name.strip.gsub(" +", "_")
      filename = user_group_name + "_" + question_group_name + "_attempts.csv" 
    elsif user_group_name && !question_group_name
      user_group_name = user_group_name.strip.gsub(" +", "_")
      filename = user_group_name + "_attempts.csv" 
    elsif !user_group_name && question_group_name
      question_group_name = question_group_name.strip.gsub(" +", "_")
      filename = question_group_name + "_attempts.csv" 
    else
      filename = "attempts.csv"
    end

    send_data csv_string,
    :type => 'text/csv; charset=iso-8859-1; header=present',
    :disposition => "attachment; filename=#{filename}" 
  end 


end
