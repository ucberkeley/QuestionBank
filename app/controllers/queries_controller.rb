class QueriesController < ApplicationController

  def execute
    if !params[:user_group][:id].blank? 
      user_group = UserGroup.find(params[:user_group][:id])
      authorize! :read, user_group
      if !params[:question_group][:id].blank?
        question_group = QuestionGroup.find(params[:question_group][:id])
        authorize! :read, question_group
        @attempts = Attempt.includes(:user => [:user_group], :question => [:question_group]).where("user_groups.id = ? and question_groups.id = ?", user_group.id, question_group.id)
      else
        @attempts = Attempt.includes(:user => [:user_group]).where("user_groups.id = ?", user_group.id)
      end
    else
      if !params[:question_group][:id].blank?
        question_group = QuestionGroup.find(params[:question_group][:id])
        authorize! :read, question_group
        @attempts = Attempt.includes(:question => [:question_group]).where("question_groups.id = ?", question_group.id)
      else
        flash[:error] = 'You must choose either a user group or a question group.'
        redirect_to :action => 'prepare' 
      end
    end
  end

  def prepare
    @user_groups = UserGroup.accessible_by(current_ability)
    @question_groups = QuestionGroup.accessible_by(current_ability)
  end

end
