
class EnrichmentActsController < ApplicationController
  # GET /enrichment_acts
  # GET /enrichment_acts.json
  def index
    @enrichment_acts = EnrichmentAct.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @enrichment_acts }
    end
  end

  # GET /enrichment_acts/1
  # GET /enrichment_acts/1.json
  def show
    @enrichment_act = EnrichmentAct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @enrichment_act }
    end
  end

  # GET /enrichment_acts/new
  # GET /enrichment_acts/new.json
  def new
    @enrichment_act = EnrichmentAct.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @enrichment_act }
    end
  end

  # GET /enrichment_acts/1/edit
  def edit
    @enrichment_act = EnrichmentAct.find(params[:id])
  end

  # POST /enrichment_acts
  # POST /enrichment_acts.json
  def create
    @enrichment_act = EnrichmentAct.new(params[:enrichment_act])

    respond_to do |format|
      if @enrichment_act.save
        format.html { redirect_to @enrichment_act, notice: 'Enrichment act was successfully created.' }
        format.json { render json: @enrichment_act, status: :created, location: @enrichment_act }
      else
        format.html { render action: "new" }
        format.json { render json: @enrichment_act.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /enrichment_acts/1
  # PUT /enrichment_acts/1.json
  def update
    @enrichment_act = EnrichmentAct.find(params[:id])

    respond_to do |format|
      if @enrichment_act.update_attributes(params[:enrichment_act])
        format.html { redirect_to @enrichment_act, notice: 'Enrichment act was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @enrichment_act.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrichment_acts/1
  # DELETE /enrichment_acts/1.json
  def destroy
    @enrichment_act = EnrichmentAct.find(params[:id])
    @enrichment_act.destroy

    respond_to do |format|
      format.html { redirect_to enrichment_acts_url }
      format.json { head :no_content }
    end
  end
end
