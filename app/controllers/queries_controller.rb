class QueriesController < ApplicationController
  def get_attempts
    if !params[:user_group].blank?
      user_group = params[:user_group]
      if !params[:question_group].blank?
        question_group = params[:question_group]
        @attempts = Attempt.where(:user_group => user_group, :question_group => question_group).includes(:all)
      else
        @attempts = Attempt.where(:user_group => user_group).includes(:all)
      end
    else
      if !params[:question_group].blank?
        @attempts = Attempt.where(:question_group => question_group).includes(:all)
      else
        flash[:error] = 'You must choose either a user group or a question group.'
        redirect_to :action => 'prepare_to_get_attempts' 
      end
    end
  end

  def prepare_to_get_attempts
    # this is just for now
    @user_groups = UserGroup.with_role(:viewer, current_user)
    # this can stay
    @question_groups = QuestionGroup.where(:user_id => current_user)
  end
end
