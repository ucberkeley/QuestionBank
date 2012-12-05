require 'csv'

class UploadsController < ApplicationController
  # GET /uploads/new
  def new
    authenticate_user!
    @question_attributes = QuestionAttributes.all
    #@question_attributes = Question.hydra_attributes
    #@user_attributes = User.hydra_attributes
  end

  # GET /uploads/attribute/new
  def new_attribute
    authenticate_user!
    @question_attributes = QuestionAttributes.all
    #@question_attributes = Question.hydra_attributes
    #@user_attributes = User.hydra_attributes
  end

  # POST /uploads/attribute/new
  def create_attribute
    authenticate_user!
    flash[:error] = 'You must supply a new column name.' and redirect_to :action => 'new_attribute' and return if params[:new_attribute][:name].blank?
    # data_table = params[:new_attribute][:data_table] == "Questions" ? Question : User;
    data_table = QuestionAttributes;
    #column_name = current_user.name + ":" + params[:new_attribute][:name]
    column_name = params[:new_attribute][:name]
    #flash[:error] = 'Specified column already exist.' and redirect_to :action => 'new_attribute' and return if data_table.hydra_attributes.exists?(:name => column_name)
    flash[:error] = 'Specified column already exist.' and redirect_to :action => 'new_attribute' and return if data_table.exists?(:name => column_name)
    @question_attributes = Question.hydra_attributes
    #@user_attributes = User.hydra_attributes

    #data_table.hydra_attributes.create(name: column_name, backend_type: params[:new_attribute][:backend_type])
    QuestionAttributes.create(:name=>column_name, :backend_type=>params[:new_attribute][:backend_type])
    flash[:notice] = "New attribute successfully created"

    redirect_to :action => 'new_attribute'
  end

  # POST /uploads
  def create
    authenticate_user!
    file = params[:upload][:upload_file].read()
    csv = CSV.new(file, :headers=>true, :encoding=>"UTF-8")
    data = csv.read()
    headers = data.headers
    skip = false
    #if headers.include?("Question Id")
      custom_headers = data.headers.collect {|h| Question.hydra_attributes.find_by_name(h) }.compact!
      data.each do |row|
        question_id = row["Question Id"]
        question = Question.find(question_id)
        custom_headers.each do |h|
          question.update_attribute(h.name.to_sym, row[h.name])
        end
      end
    # else
    #   custom_headers = data.headers.collect {|h| User.hydra_attributes.find_by_name(h) }.compact!
    #   owned_groups = UserGroup.with_role([:owner,:viewer], current_user)
    #   data.each do |row|
    #     user_id = row["User Id"]
    #     user = User.find(user_id)
    #     if (user.user_groups & owned_groups).size < 1
    #       skip = true
    #       next
    #     end
    #     custom_headers.each do |h|
    #       user.update_attribute(h.name.to_sym, row[h.name])
    #     end
    #   end
    # end

    if skip
      flash[:notice] = "Data successfully imported! (some records are skipped for lack of permission)"
    else
      flash[:notice] = "Data successfully imported!"
    end
    redirect_to :action => 'new'
  end
end
