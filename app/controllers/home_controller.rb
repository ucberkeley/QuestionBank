class HomeController < ApplicationController
  def index
  	@tags = Tag.all
  end

end
