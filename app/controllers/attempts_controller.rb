class AttemptsController < ApplicationController
  # GET /attempts
  # GET /attempts.json
  def index
    @attempts = Attempt.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attempts }
    end
  end

  # GET /attempts/1
  # GET /attempts/1.json
  def show
    @attempt = Attempt.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attempt }
    end
  end

  # GET /attempts/new
  # GET /attempts/new.json
  def new
    @attempt = Attempt.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attempt }
    end
  end

  # GET /attempts/1/edit
  def edit
    @attempt = Attempt.find(params[:id])
  end

  # POST /attempts
  # POST /attempts.json
  def create
    @attempt = Attempt.new(params[:attempt])

    respond_to do |format|
      if @attempt.save
        format.html { redirect_to @attempt, notice: 'Attempt was successfully created.' }
        format.json { render json: @attempt, status: :created, location: @attempt }
      else
        format.html { render action: "new" }
        format.json { render json: @attempt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attempts/1
  # PUT /attempts/1.json
  def update
    @attempt = Attempt.find(params[:id])

    respond_to do |format|
      if @attempt.update_attributes(params[:attempt])
        format.html { redirect_to @attempt, notice: 'Attempt was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attempt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attempts/1
  # DELETE /attempts/1.json
  def destroy
    @attempt = Attempt.find(params[:id])
    @attempt.destroy

    respond_to do |format|
      format.html { redirect_to attempts_url }
      format.json { head :no_content }
    end
  end
end
