
class AuthorizedPeopleController < ApplicationController
  # GET /authorized_people
  # GET /authorized_people.json
  def index
    @authorized_people = AuthorizedPerson.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @authorized_people }
    end
  end

  # GET /authorized_people/1
  # GET /authorized_people/1.json
  def show
    @authorized_person = AuthorizedPerson.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @authorized_person }
    end
  end

  # GET /authorized_people/new
  # GET /authorized_people/new.json
  def new
    @authorized_person = AuthorizedPerson.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @authorized_person }
    end
  end

  # GET /authorized_people/1/edit
  def edit
    @authorized_person = AuthorizedPerson.find(params[:id])
  end

  # POST /authorized_people
  # POST /authorized_people.json
  def create
    @authorized_person = AuthorizedPerson.new(params[:authorized_person])

    respond_to do |format|
      if @authorized_person.save
        format.html { redirect_to @authorized_person, notice: 'Authorized person was successfully created.' }
        format.json { render json: @authorized_person, status: :created, location: @authorized_person }
      else
        format.html { render action: "new" }
        format.json { render json: @authorized_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /authorized_people/1
  # PUT /authorized_people/1.json
  def update
    @authorized_person = AuthorizedPerson.find(params[:id])

    respond_to do |format|
      if @authorized_person.update_attributes(params[:authorized_person])
        format.html { redirect_to @authorized_person, notice: 'Authorized person was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @authorized_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authorized_people/1
  # DELETE /authorized_people/1.json
  def destroy
    @authorized_person = AuthorizedPerson.find(params[:id])
    @authorized_person.destroy

    respond_to do |format|
      format.html { redirect_to authorized_people_url }
      format.json { head :no_content }
    end
  end
end
