class QuestionsController < ApplicationController
  before_filter :authenticate, :only => [:prepare_quiz, :generate_quiz, :show_quiz]
  respond_to :json, :html

  def authenticate
    redirect_to root_path, :alert => "Please log in first" unless user_signed_in?
  end

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all

    respond_with @questions
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = Question.find(params[:id])

    respond_with @question
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    @question = Question.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(params[:question])

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end

  def prepare_quiz
    @tags = Tag.all
  end

  def generate_quiz
    if params[:question]['number_of_questions'].empty?
      number_of_questions = 5
    else
      number_of_questions = params[:question]['number_of_questions']
    end
    if params[:question]['tag'].empty?
      redirect_to prepare_quiz_path, :alert => 'Please provide a tag.' and return
    end
    tag_id = params[:question]['tag']
    redirect_to show_quiz_path(number_of_questions, tag_id)
  end

  def show_quiz
      number_of_questions = params[:number_of_questions]
      tag_id = params[:tag]
      @questions = Question.get_quiz(tag_id, number_of_questions)
  end
end
