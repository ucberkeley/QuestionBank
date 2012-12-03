class UploadsController < ApplicationController
  # GET /uploads/new
  def new
    @question_attributes = Question.hydra_attributes
    @user_attributes = User.hydra_attributes
  end

  # GET /uploads/attribute/new
  def new_attribute
    @question_attributes = Question.hydra_attributes
    @user_attributes = User.hydra_attributes
  end

  # POST /uploads
  def create
    # @user_group = UserGroup.new(params[:user_group])

    # respond_to do |format|
      # if @user_group.save
        # format.html { redirect_to @user_group, notice: 'User group was successfully created.' }
        # format.json { render json: @user_group, status: :created, location: @user_group }
      # else
        # format.html { render action: "new" }
        # format.json { render json: @user_group.errors, status: :unprocessable_entity }
      # end
    # end
  end
end
