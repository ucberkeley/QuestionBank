class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :all_tags

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  # Because the generate-quiz-modal is part of application.erb.html, which surrounds every page.
  # Therefore, every page has to have this data.
  protected
  def all_tags
  	@tags = Tag.all
  end

end
