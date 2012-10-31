class QuestionsController < ApplicationController
  # GET /questions
  # GET /questions.json
  def index
    # Displaying a quiz
    if params[:number_of_questions] && params[:tag]
      number_of_questions = params[:number_of_questions]
      tag_name = params[:tag]
      @questions = Question.get_quiz(number_of_questions, tag_name)
    else
      # Default 
      @questions = Question.all
    end

    # Don't exactly understand this, but it was hiding results.
    # (Also, the parameters are not ultimately appearing in the URL.)
    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.json { render json: @questions }
    #end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = Question.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    @question = Question.new
    
    # Briefly played around with this, didn't seem to work completely
    #puts @question
    #@question.user_id = params[:user_id]
    #puts @question.user_id
    #@question.xml = params[:xml]
    #tag = Tag.find_or_create_by_name(params[:tag])
    #@question.tags << tag
    #if @question.save
    #  flash[:notice] = "Question was successfully added."
    #else
    #  flash[:notice] = "An error occured. Your question was not added."
    #end

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
        format.json { head :ok }
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
      format.json { head :ok }
    end
  end

  def generate_quiz 
      print '*************************************'
      tags = params[:tags]
      number = params[:number]
      #@questions = Question.generate_quiz(tags, number)
      @questions = []
      redirect_to '/home/index'
  end
end
