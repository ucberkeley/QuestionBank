class QueriesController < ApplicationController

  def execute
     if !params[:user_group][:id].blank? && !params[:question_group][:id].blank?
      user_group = UserGroup.find(params[:user_group][:id])
      question_group = QuestionGroup.find(params[:question_group][:id])
      authorize! :read, user_group
      authorize! :read, question_group
      @attempts = Attempt.retrieve_by_user_group_and_question_group(user_group.id, question_group.id)
    end
    if !params[:user_group][:id].blank? && params[:question_group][:id].blank?
      user_group = UserGroup.find(params[:user_group][:id])
      authorize! :read, user_group
      @attempts = Attempt.retrieve_by_user_group(user_group.id)
    end
    if params[:user_group][:id].blank? && !params[:question_group][:id].blank?
      question_group = QuestionGroup.find(params[:question_group][:id])
      authorize! :read, question_group
      @attempts = Attempt.retrieve_by_question_group(question_group.id)
    end
    if params[:user_group][:id].blank? && !params[:question_group][:id].blank?
      flash[:error] = 'You must choose either a user group or a question group.'
      redirect_to :action => 'prepare' 
    end
  end

  def prepare
    @user_groups = UserGroup.accessible_by(current_ability)
    @question_groups = QuestionGroup.accessible_by(current_ability)
  end

end
