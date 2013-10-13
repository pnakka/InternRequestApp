
class InternRequestsController < ApplicationController
  # GET /intern_requests
  # GET /intern_requests.json
  def index
    @intern_requests = InternRequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @intern_requests }
    end
  end

  # GET /intern_requests/1
  # GET /intern_requests/1.json
  def show
    @intern_request = InternRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @intern_request }
    end
  end

  # GET /intern_requests/new
  # GET /intern_requests/new.json
  def new
    @intern_request = InternRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @intern_request }
    end
  end

  # GET /intern_requests/1/edit
  def edit
    @intern_request = InternRequest.find(params[:id])
  end

  # POST /intern_requests
  # POST /intern_requests.json
  def create
    @intern_request = InternRequest.new(params[:intern_request])

    respond_to do |format|
      if @intern_request.save
        format.html { redirect_to @intern_request, notice: 'Intern request was successfully created.' }
        format.json { render json: @intern_request, status: :created, location: @intern_request }
      else
        format.html { render action: "new" }
        format.json { render json: @intern_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /intern_requests/1
  # PUT /intern_requests/1.json
  def update
    @intern_request = InternRequest.find(params[:id])

    respond_to do |format|
      if @intern_request.update_attributes(params[:intern_request])
        format.html { redirect_to @intern_request, notice: 'Intern request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @intern_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intern_requests/1
  # DELETE /intern_requests/1.json
  def destroy
    @intern_request = InternRequest.find(params[:id])
    @intern_request.destroy

    respond_to do |format|
      format.html { redirect_to intern_requests_url }
      format.json { head :no_content }
    end
  end
end
