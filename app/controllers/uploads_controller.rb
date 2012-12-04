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

  # POST /uploads/attribute/new
  def create_attribute
    flash[:error] = 'You must supply a new column name.' and redirect_to :action => 'new_attribute' and return if params[:new_attribute][:name].blank?
    data_table = params[:new_attribute][:data_table] == "Questions" ? Question : User;
    column_name = current_user.name + ":" + params[:new_attribute][:name]
    flash[:error] = 'Specified column already exist.' and redirect_to :action => 'new_attribute' and return if data_table.hydra_attributes.exists?(:name => column_name)

    @question_attributes = Question.hydra_attributes
    @user_attributes = User.hydra_attributes

    data_table.hydra_attributes.create(name: column_name, backend_type: params[:new_attribute][:backend_type])
    flash[:notice] = "New attribute successfully created"

    redirect_to :action => 'new_attribute' 
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
