class ApisController < ApplicationController
  # GET /apis
  # GET /apis.json
  def index
    @apis = Api.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @apis }
    end
  end

  # GET /apis/1
  # GET /apis/1.json
  def show
    @api = Api.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @api }
    end
  end

  # GET /apis/new
  # GET /apis/new.json
  def new
    @api = Api.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @api }
    end
  end

  # GET /apis/1/edit
  def edit
    @api = Api.find(params[:id])
  end

  # POST /apis
  # POST /apis.json
  def create
    @api = Api.new(params[:api])

    respond_to do |format|
      if @api.save
        format.html { redirect_to @api, notice: 'Api was successfully created.' }
        format.json { render json: @api, status: :created, location: @api }
      else
        format.html { render action: "new" }
        format.json { render json: @api.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /apis/1
  # PUT /apis/1.json
  def update
    @api = Api.find(params[:id])

    respond_to do |format|
      if @api.update_attributes(params[:api])
        format.html { redirect_to @api, notice: 'Api was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @api.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apis/1
  # DELETE /apis/1.json
  def destroy
    @api = Api.find(params[:id])
    @api.destroy

    respond_to do |format|
      format.html { redirect_to apis_url }
      format.json { head :no_content }
    end
  end
end
