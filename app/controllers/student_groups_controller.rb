class StudentGroupsController < ApplicationController
  # GET /student_groups
  # GET /student_groups.json
  def index
    @student_groups = StudentGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @student_groups }
    end
  end

  # GET /student_groups/1
  # GET /student_groups/1.json
  def show
    @student_group = StudentGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student_group }
    end
  end

  # GET /student_groups/new
  # GET /student_groups/new.json
  def new
    @student_group = StudentGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student_group }
    end
  end

  # GET /student_groups/1/edit
  def edit
    @student_group = StudentGroup.find(params[:id])
  end

  # POST /student_groups
  # POST /student_groups.json
  def create
    @student_group = StudentGroup.new(params[:student_group])

    respond_to do |format|
      if @student_group.save
        format.html { redirect_to @student_group, notice: 'Student group was successfully created.' }
        format.json { render json: @student_group, status: :created, location: @student_group }
      else
        format.html { render action: "new" }
        format.json { render json: @student_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /student_groups/1
  # PUT /student_groups/1.json
  def update
    @student_group = StudentGroup.find(params[:id])

    respond_to do |format|
      if @student_group.update_attributes(params[:student_group])
        format.html { redirect_to @student_group, notice: 'Student group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @student_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_groups/1
  # DELETE /student_groups/1.json
  def destroy
    @student_group = StudentGroup.find(params[:id])
    @student_group.destroy

    respond_to do |format|
      format.html { redirect_to student_groups_url }
      format.json { head :no_content }
    end
  end
end
