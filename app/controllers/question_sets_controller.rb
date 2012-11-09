class QuestionSetsController < ApplicationController
  # GET /question_sets
  # GET /question_sets.json
  def index
    @question_sets = QuestionSet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @question_sets }
    end
  end

  # GET /question_sets/1
  # GET /question_sets/1.json
  def show
    @question_set = QuestionSet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question_set }
    end
  end

  # GET /question_sets/new
  # GET /question_sets/new.json
  def new
    @question_set = QuestionSet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question_set }
    end
  end

  # GET /question_sets/1/edit
  def edit
    @question_set = QuestionSet.find(params[:id])
  end

  # POST /question_sets
  # POST /question_sets.json
  def create
    @question_set = QuestionSet.new(params[:question_set])

    respond_to do |format|
      if @question_set.save
        format.html { redirect_to @question_set, notice: 'Question set was successfully created.' }
        format.json { render json: @question_set, status: :created, location: @question_set }
      else
        format.html { render action: "new" }
        format.json { render json: @question_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /question_sets/1
  # PUT /question_sets/1.json
  def update
    @question_set = QuestionSet.find(params[:id])

    respond_to do |format|
      if @question_set.update_attributes(params[:question_set])
        format.html { redirect_to @question_set, notice: 'Question set was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_sets/1
  # DELETE /question_sets/1.json
  def destroy
    @question_set = QuestionSet.find(params[:id])
    @question_set.destroy

    respond_to do |format|
      format.html { redirect_to question_sets_url }
      format.json { head :no_content }
    end
  end
end
