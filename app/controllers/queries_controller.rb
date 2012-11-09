class QueriesController < ApplicationController
  def get_attempts
    if params[:user_group].blank?
    
    end
    if params[:question_group].blank?

    end
    user_group = params[:user_group]
    question_group = params[:question_group]
    if params[:operator].equals('and')
        
    else

    end
  end

  def prepare_to_get_attempts
    # this is just for now
    @user_groups = UserGroup.all
    # this can stay
    @question_groups = QuestionGroup.where(:user_id => current_user)
  end
end
