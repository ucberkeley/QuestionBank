require 'csv'

class DownloadsController < ApplicationController

  # GET /downloads/new
  # GET /downloads/new.json
  def new
    @user_groups = UserGroup.accessible_by(current_ability)
    @question_groups = QuestionGroup.accessible_by(current_ability)
    @question_attributes = Question.hydra_attributes
    @user_attributes = User.hydra_attributes
  end

  # POST /downloads
  # POST /downloads.json
  def create
     if !params[:quiz][:user_group].blank? && !params[:quiz][:question_group].blank?
      user_group = UserGroup.find(params[:quiz][:user_group])
      question_group = QuestionGroup.find(params[:quiz][:question_group])
      authorize! :read, user_group
      authorize! :read, question_group
      @attempts = Attempt.retrieve_by_user_group_and_question_group(user_group.id, question_group.id)
      return self.export_to_csv(@attempts, user_group.name, question_group.name)
    
    elsif !params[:quiz][:user_group].blank? && params[:quiz][:question_group].blank?
      user_group = UserGroup.find(params[:quiz][:user_group])
      authorize! :read, user_group
      @attempts = Attempt.retrieve_by_user_group(user_group.id)
      return self.export_to_csv(@attempts, user_group.name, false)
    
    elsif params[:quiz][:user_group].blank? && !params[:quiz][:question_group].blank?
      question_group = QuestionGroup.find(params[:quiz][:question_group])
      authorize! :read, question_group
      @attempts = Attempt.retrieve_by_question_group(question_group.id)
      return self.export_to_csv(@attempts, false, question_group.name)
    
    else
      flash[:error] = 'You must choose either a user group or a question group.'
      redirect_to :action => 'new' and return
    end
  end

  def export_to_csv(attempts, user_group_name, question_group_name)       
    csv_string = CSV.generate do |csv|
     csv << ["User Id", "User Name", "Question Id", "Answer", "Is Correct", "Created At"]
     attempts.each do |attempt|
       csv << [attempt.id, User.find(attempt.user_id).name, attempt.question_id, attempt.answer, attempt.is_correct, attempt.created_at]
     end
    end         
    
    if user_group_name && question_group_name
      user_group_name = user_group_name.strip.gsub(/[\s]+/, "_")
      question_group_name = question_group_name.strip.gsub(/[\s]+/, "_")
      filename = user_group_name + "_" + question_group_name + "_attempts.csv" 
    elsif user_group_name && !question_group_name
      user_group_name = user_group_name.strip.gsub(/[\s]+/, "_")
      filename = user_group_name + "_attempts.csv" 
    elsif !user_group_name && question_group_name
      question_group_name = question_group_name.strip.gsub(/[\s]+/, "_")
      filename = question_group_name + "_attempts.csv" 
    else
      filename = "attempts.csv"
    end

    send_data csv_string,
    :filename => filename,
    :type => 'text/csv',
    :disposition => 'attachment'
  end 
end